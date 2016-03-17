'use strict';

class JobRunner {
  constructor(configuration, kubectl) {
    this.configuration = configuration;
    this.kubect = kubectl;
  }
}

module.exports = JobRunner;
