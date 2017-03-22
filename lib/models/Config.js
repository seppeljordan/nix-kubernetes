'use strict';

const _ = require('lodash');
const fs = require('fs');

const Deployment = require('./Deployment');
const Util = require('../util');

class Config {
  constructor(data) {
    this.data = _.defaults(data, {
      deployments: {}
    });
  }

  get deployments() {
    return _.mapValues(
      this.data.deployments,
      (deployment, name) => new Deployment(name, deployment)
    );
  }

  updateOrCreate(name, file) {
    this.data.deployments[name] = {
      file: Util.resolvePath(file)
    };
  }

  delete(name) {
    delete this.data.deployments[name];
  }

  save(path) {
    fs.writeFileSync(path, JSON.stringify(this.data), 'utf8');
  }

  static loadOrCreate(path) {
    if (fs.existsSync(path)) {
      const content = JSON.parse(fs.readFileSync(path, 'utf8'));
      return new Config(content);
    }

    return new Config({});
  }
}

module.exports = Config;
