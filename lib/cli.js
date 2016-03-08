#!/usr/bin/env node

const yargs = require('yargs');
const _ = require('lodash');
const Table = require('cli-table2');

const Config = require('./config');
const Builder = require('./build');
const Util = require('./util');

var argv = yargs
  .usage('Usage: $0 <command> [options]')
  .default('c', '~/.kube/nix-kubernetes.json')
  .alias('c', 'config').global('c')
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
  })
  .command('deploy', 'Deploy configuration', yargs => {
    return yargs
      .demand('d')
      .alias('d', 'deployment')
      .describe('d', 'Deployment name')
      .alias('i', 'include')
      .describe('i', 'Resources to include in deployment')
      .example('$0 deploy -d deployment -i dev.services.mysql');
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
  .demand(1)
  .help('h').alias('h', 'help')
  .argv;
