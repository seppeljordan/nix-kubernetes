'use strict';

const _ = require('lodash');

class Resource {
  constructor(data) {
    this.data = data;
  }

  get kind() {
    return _.get(this.data, 'kind');
  }

  get name() {
    return _.get(this.data, 'metadata.name');
  }

  get namespace() {
    return _.get(this.data, 'metadata.namespace');
  }

  get value() {
    return this.data;
  }
}

module.exports = Resource;
