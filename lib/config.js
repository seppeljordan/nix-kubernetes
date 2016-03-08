'use strict';

const _ = require('lodash');
const fs = require('fs');
const path = require('path');

const Util = require('./util');

class Config {
  constructor(data) {
    this.data = _.defaults(data, {
      deployments: {}
    });
  }

  get deployments() {
    return this.data.deployments;
  }

  getDeployment(name) {
    return _.get(this.data.deployments, name);
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
    fs.writeFileSync(path, JSON.stringify(this.data), 'utf8')
  }

  static loadOrCreate(path) {
    if(fs.existsSync(path)) {
      const content = JSON.parse(fs.readFileSync(path, 'utf8'));
      return new Config(content);
    }

    return new Config({});
  }
}

module.exports = Config;
