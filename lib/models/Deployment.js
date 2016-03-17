'use strict';

const _ = require('lodash');

/**
 * Deploy model specifications
 */
class Deployment {
  constructor(data) {
    this.data = data;
  }

  /**
   * Gets name of the namespace to deploy to
   *
   * @return {string} Name of the namespace
   */
  get namespace() {
    return this.data.options.ns;
  }

  /**
   * Gets resources
   *
   * @return {Object.<string,Resource>} Mapping betwene type/name : resource
   */
  get resources() {
    // Transform entries in type/name : resource
    return _.transform(this.data.resources, (result, element, type) => {
      _.forEach(element, (resource, name) => result.push(type + '/' + name));
    }, []);
  }

  /**
   * Gets resource by path
   *
   * @param path string Resource path in format type/name
   * @return {Resource} Resource identifed by path
   */
  getResource(path) {
    return _.get(this.resources, path);
  }
}

module.exports = Deployment;
