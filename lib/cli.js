#!/usr/bin/env node

const yargs = require('yargs');
const _ = require('lodash');
const Table = require('cli-table2');
const YAML = require('yamljs');

const Util = require('./util');
const Config = require('./models/Config');
const Builder = require('./services/Builder');
const Deployer = require('./services/Deployer');
const JobRunner = require('./services/JobRunner');
const Kubectl = require('./services/Kubectl');

const args = process.argv.join(' ');
const pass = _.first(args.split(" -- "));
const append = _.first(_.at(args.split(" -- "), 1));

function parseArgs(args) {
  const result = {};
  _.forEach(args, arg => {
    const key = _.first(arg.split('='));
    const value = _.last(arg.split('=')) || true;

    result[key] = value;
  });

  return result;
}

var argv = yargs
  .usage('Usage: $0 <command> [options]')
  .default('c', '~/.kube/nix-kubernetes.json')
  .alias('c', 'config').global('c')
  .describe('c', 'path to configuration file')
  .command('create <file>', 'Create deployment', yargs => {
    return yargs
      .demand('d')
      .alias('d', 'deployment')
      .describe('d', 'Deployment name')
      .example('$0 create -n deployment deploy.nix', 'create a new deployment');
  }, argv => {
    const fullPath = Util.resolvePath(argv.config);
    const config = Config.loadOrCreate(fullPath);

    if(_.has(config.deployments, argv.deployment)) {
      console.error('Deployment with this name already exists');
      process.exit(1);
    }

    config.updateOrCreate(argv.deployment, argv.file);
    config.save(fullPath);

    console.log('Deployment created');
  })
  .command('list', 'List all known deployments', yargs => {
  }, argv => {
    const fullPath = Util.resolvePath(argv.config);
    const config = Config.loadOrCreate(fullPath);

    const table = new Table({ head: ['name', 'path'] });
    _.forEach(config.deployments, (deployment, name) => {
      table.push([deployment.name, deployment.file]);
    });

    console.log(table.toString());
  })
  .command('delete', 'Delete deployment', yargs => {
    return yargs
      .demand('d')
      .alias('d', 'deployment')
      .describe('d', 'Deployment name')
      .example('$0 delete -d deployment', 'delete deployment');
  }, argv => {
    const fullPath = Util.resolvePath(argv.config);
    const config = Config.loadOrCreate(fullPath);

    if(!_.has(config.deployments, argv.deployment)) {
      console.error('Deployment with this name does not exist');
      process.exit(1);
    }

    config.delete(argv.deployment);
    config.save(fullPath);

    console.log('Deployment deleted');
  })
  .command('describe', 'Describes deployment', yargs => {
    return yargs
      .demand('d')
      .alias('d', 'deployment')
      .describe('d', 'Deployment name')
      .example('$0 describe -d deployment', 'describe deployment');
  }, argv => {
    const fullPath = Util.resolvePath(argv.config);
    const config = Config.loadOrCreate(fullPath);

    if(!_.has(config.deployments, argv.deployment)) {
      console.error('Deployment with this name does not exist');
      process.exit(1);
    }

    const deployment = config.deployments[argv.deployment];

    const builder = new Builder(deployment);
    builder.eval().then(deployment => {
      console.log(YAML.stringify(deployment.toJSON(), 4));
    });
  })
  .command('deploy', 'Deploy configuration', yargs => {
    return yargs
      .describe('d', 'Deployment name')
      .alias('d', 'deployment')
      .demand('d')
      .describe('n', 'Namespace to deploy')
      .alias('n', 'namespace')
      .describe('i', 'Resources to include in deployment')
      .alias('i', 'include')
      .describe('--context', 'Kubernetes config context to use for deployment')
      .describe('build-only', 'only build')
      .describe('restart', 'restart replication controllers')
      .describe('rolling-update', 'do a rolling update of a controller')
      .example('$0 deploy -d deployment -n namespace -i replicationcontrollers/gitlab')
      .example('$0 deploy -d deployment -n namespace -i services/mysql -- --validate=false');
  }, argv => {
    const fullPath = Util.resolvePath(argv.config);
    const config = Config.loadOrCreate(fullPath);

    if(!_.has(config.deployments, argv.deployment)) {
      console.error('Deployment with this name does not exist');
      process.exit(1);
    }

    const deployment = config.deployments[argv.deployment];
    const builder = new Builder(deployment);
    builder.eval().then(deployment => {
      console.log('Config:', deployment.specPath);

      if (!argv["build-only"]) {
        if(!_.has(deployment.namespaces, argv.namespace)) {
          console.error('Namespace with this name does not exist');
          process.exit(1);
        }

        if (argv.context) {
          console.log("Using context:", argv.context);
        }

        const kubectl = new Kubectl({
          context: argv.context,
          append: append
        });
        const deployer = new Deployer(deployment.namespaces[argv.namespace], kubectl);
        const options = {
          restart: argv.restart,
          rollingUpdate: argv['rolling-update']
        };

        return deployer.deploy(argv.include, options)
        .then(res => {
          console.log('deployment complete');
        })
        .catch(err => {
          console.error('error with deployment', err.toString());
        });
      }
    });
  })
  .command('config', 'Manage deployment', yars => {
    return yargs
      .describe('d', 'Deployment name')
      .alias('d', 'deployment')
      .demand('d')
      .describe('s', 'set argument')
      .alias('s', 'set-arg')
      .example('$0 args -d deployment --set key=value')
  }, argv => {
    const fullPath = Util.resolvePath(argv.config);
    const config = Config.loadOrCreate(fullPath);

    if(!_.has(config.deployments, argv.deployment)) {
      console.error('Deployment with this name does not exist');
      process.exit(1);
    }

    const deployment = config.deployments[argv.deployment];

    if (argv.setArg) {
      const args = parseArgs(_.isArray(argv.setArg) ? argv.setArg : [argv.setArg]);
      _.forEach(args, (value, key) => {
        if (value == '-') {
          deployment.unsetArg(key);
        } else {
          deployment.setArg(key, value);
        }
      });
    }

    config.save(fullPath);
  })
  .command('run-job <name>', 'Run distributed kubernetes job', yargs => {
    return yargs
      .describe('d', 'Deployment name')
      .alias('d', 'deployment')
      .demand('d')
      .describe('n', 'Namespace where job is defined')
      .alias('n', 'namespace')
      .describe('wait', 'Wait for job completion')
      .describe('gc', 'Garbage collect completed job')
      .implies('gc', 'wait')
      .describe('a', 'set argument')
      .alias('a', 'arg')
      .example('$0 run-job -d deployment -n namespace jobname --arg key=value');
  }, argv => {
    const fullPath = Util.resolvePath(argv.config);
    const config = Config.loadOrCreate(fullPath);

    if(!_.has(config.deployments, argv.deployment)) {
      console.error('Deployment with this name does not exist');
      process.exit(1);
    }

    const args = parseArgs(_.isArray(argv.arg) ? argv.arg : argv.arg ? [argv.arg] : {});
    const deployment = config.deployments[argv.deployment];
    const builder = new Builder(deployment);
    builder.eval(args).then(config => {
      if(!_.has(config.namespaces, argv.namespace)) {
        console.error('Namespace with this name does not exist');
        process.exit(1);
      }

      if (argv.context) {
        console.log("Using context:", argv.context);
      }

      const kubectl = new Kubectl({context: argv.context});
      const jobRunner = new JobRunner(config.namespaces[argv.namespace], kubectl);
      jobRunner.run(argv.name, {wait: argv.wait, gc: argv.gc})
      .then(result => {
      })
      .catch(err => {
        console.log('error with job processing', err.toString());
      });
    });
  })
  .demand(1)
  .help('h').alias('h', 'help')
  .example('$0 create -d name deploy.nix', 'create deployment')
  .example('$0 deploy -d name -n namespace', 'deploy resources')
  .example('$0 deploy -d name --build-only', 'only build')
  .argv;
