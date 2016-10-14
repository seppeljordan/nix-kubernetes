'use strict';

const _ = require('lodash');

const Resource = require('./resource');

/**
 * Namespace model specifications
 */
class Namespace {
  constructor(data) {
    this.data = data;
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
    const type = path.split('/')[0];
    const name = path.split('/')[1];

    const resource = _.get(this.data.resources, [type, name]);

    if (!resource) return;

    return new Resource(resource);
  }

  /**
   * Gets job by name
   *
   * @param name string Name of the job
   * @return {Object} job kubernetes resource
   */
  getJob(name) {
    return _.get(this.data.jobs, name);
  }
}

module.exports = Namespace;
