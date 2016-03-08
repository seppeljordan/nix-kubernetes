const path = require('path');
const expandTilde = require('expand-tilde');

module.exports = {
  resolvePath: p => {
    return path.resolve(expandTilde(p));
  }
};
