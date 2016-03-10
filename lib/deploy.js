'use strict';

const _ = require('lodash');
const Promise = require('bluebird');
const assert = require('hoek').assert;

class Deployer {
  constructor(configuration, kubectl) {
    this.configuration = configuration;
    this.kubectl = kubectl;
  }

  get ns() {
    return this.configuration.namespace.metadata.name;
  }

  get resources() {
    const elements = _.omit(this.configuration, 'namespace');
    return _.transform(elements, (result, element, type) => {
      _.forEach(element, (resource, name) => result.push(type + '/' + name));
    }, []);
  }

  getResource(path) {
    const type = path.split('/')[0];
    const name = path.split('/')[1];

    return {
      type: type, name: name,
      value: _.get(this.configuration, [type, name])
    };
  }

  deployResource(path) {
    let requirements = Promise.resolve();
    const resource = this.getResource(path);

    assert(resource, "Resource not defined");

    const dependencies = _.get(resource.value, ["metadata", "annotations", "x-truder.net/dependencies"]);
    if (dependencies) {
      requirements = Promise.map(dependencies.split(','), dep => {
        return this.deployResource(dep);
      });
    }

    return requirements.then(() => {
      return this.kubectl.deploy(this.ns, resource.type, resource.name, resource.value);
    });
  }

  deploy(include, options) {
    if (_.isEmpty(include)) {
      return Promise.mapSeries(this.resources, path => this.deployResource(path));
    }

    include = _.isArray(include) ? include : [include];

    return Promise.mapSeries(include, path => this.deployResource(path));
  }

  prepare() {
    return this.kubectl.deploy(
      this.ns, "namespace", this.ns, this.configuration.namespace
    );
  }
}

module.exports = Deployer;
