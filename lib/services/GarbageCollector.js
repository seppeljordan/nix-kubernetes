'use strict';

const _ = require('lodash');
const Promise = require('bluebird');
const assert = require('hoek').assert;

class GarbageCollector {
  constructor(namespace, kubectl) {
    this.namespace = namespace;
    this.kubectl = kubectl;
  }

  run() {
    return this.kubectl.listAllNamespaces(['all']).map(resource => {
      const name = `${resource.metadata.namespace}/${resource.kind}/${resource.metadata.name}`;

      if (
        _.includes(resource.metadata.namespace, this.namespace.gcNamespaces) &&
        !_.find(this.namespace.resources, name => {
          const resourceSpec = this.namespace.getResource(name).data;
          const result =
            resource.metadata.annotations['x-truder.net/kind'] === 'nix-kubernetes' &&
            resource.metadata.annotations['x-truder.net/version'] === 'v1' &&
            resourceSpec.kind === resource.kind &&
            resourceSpec.metadata.namespace === resource.metadata.namespace &&
            resourceSpec.metadata.name === resource.metadata.name;

          return result;
        })
      ) {
        console.log(`deleting resource ${name}`);
        return this.kubectl.delete(
          resource.metadata.namespace,
          resource.kind,
          resource.metadata.name
        );
      }
    });
  }
}

module.exports = GarbageCollector;
