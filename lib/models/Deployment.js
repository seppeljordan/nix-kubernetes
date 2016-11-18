'use strict';

const fs = require('fs');
const _ = require('lodash');

const Namespace = require('./Namespace');

/**
 * Deploy model specifications
 */
class Deployment {
  constructor(name, data) {
    this.name = name;
    this.data = _.defaults(data, {
      args: {}
    });
  }

  get args() {
    return this.data.args;
  }

  setArg(key, value) {
    this.data.args[key] = value;
  }

  unsetArg(key) {
    delete this.data.args[key];
  }

  get file() {
    return this.data.file;
  }

  /**
   * Gets namespaces to deploy to
   *
   * @return {Object.<string,Namespace>} Namespaces
   */
  get namespaces() {
    return _.mapValues(this.spec, deployment => new Namespace(deployment));
  }

  loadSpec(path) {
    const parsedSpec = JSON.parse(fs.readFileSync(path));
    this.spec = parsedSpec;
    this.specPath = path;
  }

  toJSON() {
    const result = {
      name: this.name,
      file: this.file,
      args: this.args
    };

    if (this.spec) {
      result.specPath = this.specPath;
    }

    return result;
  }
}

module.exports = Deployment;
