'use strict';

const exec = require('child_process').exec;
const retry = require('bluebird-retry');

const Util = require('../util');

class Kubectl {
  constructor(options) {
    this.options = options;
  }

  _command(args) {
    let cmd = ['kubectl'];

    if (this.options.context) {
      cmd.push(`--context ${this.options.context}`);
    }

    cmd.push(args);
    return cmd.join(' ');
  }

  exists(ns, type, name) {
    return Util.run(this._command(`--namespace ${ns} get ${type} ${name}`))
      .then(Promise.resolve(true))
      .catch(error => {
        if (error.toString().indexOf('not found') > -1) {
          return Promise.resolve(false);
        }

        throw error;
      });
  }

  get(ns, type, name) {
    return Util.run(this._command(`--namespace ${ns} get -o json ${type} ${name}`))
      .then(result => {
        return JSON.parse(result);
      })
      .catch(error => {
        if (error.toString().indexOf('not found') > -1) {
          return Promise.resolve(false);
        }

        throw error;
      });
  }

  delete(ns, type, name) {
    return Util.run(this._command(`--namespace ${ns} delete ${type} ${name}`))
  }

  wait(ns, type, name, options, condition) {
    return retry(() => {
      return this.get(ns, type, name).then(result => {
        return condition(result);
      });
    }, options);
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

        const append = this.options.append || '';

        if (exists) {
          child = exec(this._command(`--namespace ${ns} apply -f - ${append}`), handler);
        } else {
          child = exec(this._command(`--namespace ${ns} create -f - ${append}`), handler);
        }

        child.stdin.write(JSON.stringify(resource));
        child.stdin.end();
      });
    });
  }

  logs(ns, name, handler) {
    const child = exec(this._command(`--namespace ${ns} logs -f ${name}`), handler);

    return child;
  }
}

module.exports = Kubectl;
