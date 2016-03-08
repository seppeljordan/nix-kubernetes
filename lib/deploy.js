'use strict';

const exec = require('child_process').exec;
const _ = require('lodash');

const Util = require('./util');

class Deployer {
  constructor(configuration) {
    this.configuration = configuration;
  }

  get ns() {
    return this.configuration.namespace.metadata.name;
  }

  exists(type, name) {
    return Util.run(`kubectl --namespace ${this.ns} get ${type} ${name}`)
      .then(Promise.resolve(true))
      .catch(error => {
        if (error.toString().indexOf('not found') > -1){
          return Promise.resolve(false);
        }

        throw error;
      });
  }

  deployResource(type, name, resource) {
    console.log('deploying:', type, name);
    return this.exists(type, name).then(exists => {
      return new Promise((res, rej) => {
        let child;
        let handler = (error, stdout, stderr) => {
          if (error) return rej(error);
          res(stdout);
        };

        if (exists) {
          child = exec(`kubectl --namespace ${this.ns} apply -f -`, handler);
        } else {
          child = exec(`kubectl --namespace ${this.ns} create -f -`, handler);
        }

        child.stdin.write(JSON.stringify(resource));
        child.stdin.end();
      });
    });
  }

  deploy() {
    let deploy = (resources, type) => {
      return Promise.all(_.map(resources, (resource, name) => {
        return this.deployResource(type, name, resource);
      }));
    };

    return Promise.all([
      this.deployResource('namespace', this.configuration.namespace.metadata.name, this.configuration.namespace),
      deploy(this.configuration.replicationcontrollers, 'replicationcontroller'),
      deploy(this.configuration.services, 'service'),
      deploy(this.configuration.secrets, 'secret'),
      deploy(this.configuration.pvc, 'pvc')
    ]);
  }
}

module.exports = Deployer;
