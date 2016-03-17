'use strict';

const _ = require('lodash');

const Namespace = require('./Namespace');

/**
 * Deploy model specifications
 */
class Deployment {
  constructor(data) {
    this.data = data;
  }

  /**
   * Gets namespaces to deploy to
   *
   * @return {Object.<string,Namespace>} Namespaces
   */
  get namespaces() {
    return _.mapValues(this.data, deployment => new Namespace(deployment));
  }
}

module.exports = Deployment;
