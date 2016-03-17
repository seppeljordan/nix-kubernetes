#!/usr/bin/env node

const yargs = require('yargs');
const _ = require('lodash');
const Table = require('cli-table2');

const Util = require('./util');
const Config = require('./models/Config');
const Builder = require('./services/Builder');
const Deployer = require('./services/Deployer');
const JobRunner = require('./services/JobRunner');
const Kubectl = require('./services/Kubectl');

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
      table.push([name, deployment.file]);
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
    const builder = new Builder(deployment.file);
    builder.eval().then(configuration => {
      console.log(configuration);
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
      .example('$0 deploy -d deployment -n namespace -i replicationcontrollers/gitlab');
  }, argv => {
    const fullPath = Util.resolvePath(argv.config);
    const config = Config.loadOrCreate(fullPath);

    if(!_.has(config.deployments, argv.deployment)) {
      console.error('Deployment with this name does not exist');
      process.exit(1);
    }

    const deployment = config.deployments[argv.deployment];
    const builder = new Builder(deployment.file);
    builder.eval().then(config => {
      if (!argv["build-only"]) {
        if(!_.has(config.namespaces, argv.namespace)) {
          console.error('Namespace with this name does not exist');
          process.exit(1);
        }

        if (argv.context) {
          console.log("Using context:", argv.context);
        }

        const kubectl = new Kubectl({context: argv.context});
        const deployer = new Deployer(config.namespaces[argv.namespace], kubectl);
        return deployer.deploy(argv.include)
        .then(res => {
          console.log('deployment complete');
        })
        .catch(err => {
          console.error('error with deployment', err.toString());
        });
      }
    });
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
      .example('$0 run-job -d deployment -n namespace jobname');
  }, argv => {
    const fullPath = Util.resolvePath(argv.config);
    const config = Config.loadOrCreate(fullPath);

    if(!_.has(config.deployments, argv.deployment)) {
      console.error('Deployment with this name does not exist');
      process.exit(1);
    }

    const deployment = config.deployments[argv.deployment];
    const builder = new Builder(deployment.file);
    builder.eval().then(config => {
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
