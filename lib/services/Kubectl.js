'use strict';

const childProcess = require('child_process');
const retry = require('bluebird-retry');
const _ = require('lodash');

const Util = require('../util');

class Kubectl {
  constructor(options) {
    this.options = options;
  }

  _exec(command, handler) {
    if (this.options.dryRun) {
      return childProcess.exec(`${command} --dry-run`, handler);
    }
    return childProcess.exec(command, handler);
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

  listAllNamespaces(types) {
    return Util.run(this._command(`get -o json ${types.join(',')} --all-namespaces`))
      .then(result => JSON.parse(result))
      .then(result => result.items)
      .catch(error => {
        if (error.toString().indexOf('not found') > -1) {
          return Promise.resolve(false);
        }

        throw error;
      });
  }

  delete(ns, type, name) {
    return Util.run(this._command(`--namespace ${ns} delete ${type} ${name}`));
  }

  deleteByLabels(ns, type, labels) {
    const selector = _.map(labels, (value, name) => `${name}=${value}`).join(',');
    return Util.run(this._command(`--namespace ${ns} delete ${type} -l ${selector}`));
  }

  wait(ns, type, name, options, condition) {
    return retry(() => {
      return this.get(ns, type, name).then(result => {
        return condition(result);
      });
    }, options);
  }

  deploy(ns, type, name, resource) {
    console.log(`deploying${this.options.dryRun ? " (dry-run)" : ""}:`, type, name);
    return new Promise((res, rej) => {
      let child;
      let handler = (error, stdout) => {
        if (error) {
          return rej(error);
        }

        res(stdout);
      };

      const append = this.options.append || '';

      child = this._exec(this._command(`--namespace ${ns} apply -f - ${append}`), handler);
      child.stdin.write(JSON.stringify(resource));
      child.stdin.end();
    });
  }

  rollingUpdate(ns, name, resource) {
    return new Promise((res, rej) => {
      let handler = (error, stdout) => {
        if (error) {
          return rej(error);
        }

        res(stdout);
      };

      const append = this.options.append || '';

      const child = this._exec(this._command(`--namespace ${ns} rolling-update ${name} -f - ${append}`), handler);

      child.stdout.on('data', data => process.stdout.write(data));

      child.stdin.write(JSON.stringify(resource));
      child.stdin.end();
    });
  }

  logs(ns, name, handler) {
    const child = childProcess.exec(this._command(`--namespace ${ns} logs -f ${name}`), handler);

    return child;
  }
}

module.exports = Kubectl;
