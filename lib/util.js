const path = require('path');
const expandTilde = require('expand-tilde');
const exec = require('child_process').exec;
const Promise = require('bluebird');

module.exports = {
  resolvePath: p => {
    return path.resolve(expandTilde(p));
  },

  run: command => {
    return new Promise((res, rej) => {
      exec(command, {maxBuffer: 1024 * 1000}, (error, stdout) => {
        if (error) {
          return rej(error);
        }

        res(stdout);
      });
    });
  }
};
