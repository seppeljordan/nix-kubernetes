'use strict';

const fs = require('fs');
const _ = require('lodash');

const Namespace = require('./Namespace');

/**
 * Deploy model specifications
 */
class Deployment {
  constructor(data, path) {
    this.data = data;
    this.path = path;
  }

  /**
   * Gets namespaces to deploy to
   *
   * @return {Object.<string,Namespace>} Namespaces
   */
  get namespaces() {
    return _.mapValues(this.data, deployment => new Namespace(deployment));
  }

  static fromFile(path) {
    const parsedSpec = JSON.parse(fs.readFileSync(path));
    return new Deployment(parsedSpec, path);
  }
}

module.exports = Deployment;
