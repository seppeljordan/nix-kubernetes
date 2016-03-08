'use strict';

const exec = require('child_process').exec;
const path = require('path');
const fs = require('fs');
const _ = require('lodash');

class Builder {
  constructor(configuration) {
    this.configuration = configuration;
  }

  get workdir() {
    return path.resolve(path.join(__dirname, '..', 'nix'));
  }

  eval() {
    return new Promise((res, rej) => {
      exec(
        `nix-build --arg configuration ${this.configuration} ${this.workdir}/default.nix`,
        (error, stdout, stderr) => {
          if (error) return rej(stderr);
          res(stdout);
        }
      );
    }).then(result => {
      debugger
      const path = _.trimEnd(result);
      return JSON.parse(fs.readFileSync(path));
    });
  }
}

module.exports = Builder;
