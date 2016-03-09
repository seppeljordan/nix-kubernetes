'use strict';

const exec = require('child_process').exec;
const _ = require('lodash');
const Promise = require('bluebird');

const Util = require('./util');

class Deployer {
  constructor(configuration) {
    this.configuration = configuration;
  }

  exists(ns, type, name) {
    return Util.run(`kubectl --namespace ${ns} get ${type} ${name}`)
      .then(Promise.resolve(true))
      .catch(error => {
        if (error.toString().indexOf('not found') > -1){
          return Promise.resolve(false);
        }

        throw error;
      });
  }

  deployResource(ns, type, name, resource) {
    console.log('deploying:', type, name);
    return this.exists(ns, type, name).then(exists => {
      return new Promise((res, rej) => {
        let child;
        let handler = (error, stdout, stderr) => {
          if (error) return rej(error);
          res(stdout);
        };

        if (exists) {
          child = exec(`kubectl --namespace ${ns} apply -f -`, handler);
        } else {
          child = exec(`kubectl --namespace ${this.ns} create -f -`, handler);
        }

        child.stdin.write(JSON.stringify(resource));
        child.stdin.end();
      });
    });
  }

  deploy() {
    let deploy = (ns, resources, type) => {
      return Promise.all(_.map(resources, (resource, name) => {
        return this.deployResource(ns, type, name, resource);
      }));
    };

    return Promise.mapSeries(_.toPairs(this.configuration), param => {
      const name = param[0], conf = param[1];
      const ns = conf.namespace.metadata.name;
      console.log('deploying namespace', name);
      return Promise.all([
        this.deployResource(ns, 'namespace', conf.namespace.metadata.name, conf.namespace),
        deploy(ns, conf.replicationcontrollers, 'replicationcontroller'),
        deploy(ns, conf.services, 'service'),
        deploy(ns, conf.secrets, 'secret'),
        deploy(ns, conf.pvc, 'pvc')
      ]);
    });
  }
}

module.exports = Deployer;
