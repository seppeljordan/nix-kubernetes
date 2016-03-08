'use strict';

const exec = require('child_process').exec;
const path = require('path');
const fs = require('fs');
const _ = require('lodash');

const Util = require('./util');

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
      const path = _.trimEnd(result);
      return JSON.parse(fs.readFileSync(path));
    });
  }
}

module.exports = Builder;
