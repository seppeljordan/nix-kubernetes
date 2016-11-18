'use strict';

const path = require('path');
const fs = require('fs');
const tmp = require('tmp');
const _ = require('lodash');

const Util = require('../util');
const Deployment = require('../models/Deployment');

class Builder {
  constructor(deployment) {
    this.deployment = deployment;
  }

  get workdir() {
    return path.resolve(path.join(__dirname, '..', '..', 'nix'));
  }

  eval(args = {}) {
    const tmpFile = tmp.fileSync();
    fs.write(tmpFile.fd, JSON.stringify(_.extend(this.deployment.args, args)));
    return Util.run(
      `nix-build --arg configuration ${this.deployment.file} --arg args ${tmpFile.name} --no-out-link ${this.workdir}/default.nix`
    ).then(result => {
      tmpFile.removeCallback();

      // remove new lines from file
      const path = _.trimEnd(result);

      this.deployment.loadSpec(path);

      // construct new specs model
      return this.deployment;
    });
  }
}

module.exports = Builder;
