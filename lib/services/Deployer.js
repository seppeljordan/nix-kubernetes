'use strict';

const _ = require('lodash');
const Promise = require('bluebird');
const assert = require('hoek').assert;

class Deployer {
  constructor(deployment, kubectl) {
    this.deployment = deployment;
    this.kubectl = kubectl;
  }

  deployResource(path) {
    let requirements = Promise.resolve();
    const resource = this.deployment.getResource(path);

    assert(resource, "Resource not defined");

    const dependencies = _.get(resource.value, ["metadata", "annotations", "x-truder.net/dependencies"]);
    if (dependencies) {
      requirements = Promise.map(dependencies.split(','), dep => {
        return this.deployResource(dep);
      });
    }

    return requirements.then(() => {
      return this.kubectl.deploy(this.deployment.namespace, resource.type, resource.name, resource.value);
    });
  }

  deploy(include, options) {
    if (_.isEmpty(include)) {
      const resources = _.omit(this.deployment.resources, ['jobs']);
      return Promise.mapSeries(resources, path => this.deployResource(path));
    }

    include = _.isArray(include) ? include : [include];

    return Promise.mapSeries(include, path => this.deployResource(path));
  }
}

module.exports = Deployer;
