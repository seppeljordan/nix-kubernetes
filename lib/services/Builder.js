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
    return path.resolve(path.join(__dirname, '..', 'nix'));
  }

  eval() {
    return Util.run(
      `nix-build --arg configuration ${this.configuration} ${this.workdir}/default.nix`
    ).then(result => {
      // remove new lines from file
      const path = _.trimEnd(result);

      // parse specs from built file
      const parsedSpec = JSON.parse(fs.readFileSync(path));

      // construct new specs model
      return new Deployment(parsedSpec);
    });
  }
}

module.exports = Builder;
