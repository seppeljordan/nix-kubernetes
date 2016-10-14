'use strict';

const _ = require('lodash');
const Promise = require('bluebird');
const assert = require('hoek').assert;

class Deployer {
  constructor(namespace, kubectl) {
    this.namespace = namespace;
    this.kubectl = kubectl;
  }

  deployResource(path, options) {
    let requirements = Promise.resolve();
    const resource = this.namespace.getResource(path);

    assert(resource, "Resource not defined");

    const dependencies = _.get(resource.value, ["metadata", "annotations", "x-truder.net/dependencies"]);
    if (dependencies) {
      requirements = Promise.map(dependencies.split(','), dep => {
        return this.deployResource(dep, options);
      });
    }

    return requirements.then(() => {
      if (options.rollingUpdate && resource.type === 'replicationcontrollers') {
        return this.kubectl.rollingUpdate(resource.namespace, options.rollingUpdate, resource.value);
      }

      return this.kubectl.deploy(resource.namespace, resource.kind, resource.name, resource.value);
    }).then(() => {
      if (options.restart && resource.type === 'replicationcontrollers') {
        return this.kubectl.deleteByLabels(resource.name, 'pod', resource.value.spec.selector);
      }
    });
  }

  deploy(include, options) {
    let resources;

    if (_.isEmpty(include)) {
      resources = _.keys(this.namespace.resources);
    } else {
      resources = _.isArray(include) ? include : [include];
    }

    return Promise.mapSeries(resources, path => this.deployResource(path, options));
  }
}

module.exports = Deployer;
