'use strict';

const path = require('path');
const fs = require('fs');
const _ = require('lodash');

const Util = require('../util');
const Deployment = require('../models/Deployment');

class Builder {
  constructor(configuration) {
    this.configuration = configuration;
  }

  get workdir() {
    return path.resolve(path.join(__dirname, '..', '..', 'nix'));
  }

  eval() {
    return Util.run(
      `nix-build --arg configuration ${this.configuration} --no-out-link ${this.workdir}/default.nix`
    ).then(result => {
      // remove new lines from file
      const path = _.trimEnd(result);

      // construct new specs model
      return Deployment.fromFile(path);
    });
  }
}

module.exports = Builder;
