'use strict';

const exec = require('child_process').exec;

const Util = require('./util');

class Kubectl {
  exists(ns, type, name) {
    return Util.run(`kubectl --namespace ${ns} get ${type} ${name}`)
      .then(Promise.resolve(true))
      .catch(error => {
        if (error.toString().indexOf('not found') > -1) {
          return Promise.resolve(false);
        }

        throw error;
      });
  }

  deploy(ns, type, name, resource) {
    console.log('deploying:', type, name);
    return this.exists(ns, type, name).then(exists => {
      return new Promise((res, rej) => {
        let child;
        let handler = (error, stdout) => {
          if (error) {
            return rej(error);
          }

          res(stdout);
        };

        if (exists) {
          child = exec(`kubectl --namespace ${ns} apply -f -`, handler);
        } else {
          child = exec(`kubectl --namespace ${ns} create -f -`, handler);
        }

        child.stdin.write(JSON.stringify(resource));
        child.stdin.end();
      });
    });
  }
}

module.exports = Kubectl;
