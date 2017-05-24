'use strict';

const _ = require('lodash');
const Promise = require('bluebird');
const assert = require('hoek').assert;

class Deployer {
  constructor(namespace, kubectl) {
    this.namespace = namespace;
    this.kubectl = kubectl;
  }

  deployResource(path, options, context) {
    if (context.deployed.has(path)) {
      return Promise.resolve();
    }

    let requirements = Promise.resolve();
    const resource = this.namespace.getResource(path);

    assert(resource, `Resource not defined: ${path}`);

    const dependencies = _.get(resource.value, ["metadata", "annotations", "x-truder.net/dependencies"]);
    if (dependencies) {
      requirements = Promise.map(dependencies.split(','), dep => {
        return this.deployResource(dep, options, context);
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
    }).tap(() => {
      context.deployed.add(path);
    });
  }

  deploy(include, options) {
    let resources;

    if (_.isEmpty(include)) {
      resources = this.namespace.resources;
    } else {
      resources = _.isArray(include) ? include : [include];
    }

    let context = {
      deployed: new Set()
    };

    return Promise.mapSeries(resources, path => this.deployResource(path, options, context));
  }
}

module.exports = Deployer;
