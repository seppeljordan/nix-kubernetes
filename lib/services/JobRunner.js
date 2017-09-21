'use strict';

const _ = require('lodash');

class JobRunner {
  constructor(namespace, kubectl) {
    this.namespace = namespace;
    this.kubectl = kubectl;
  }

  /**
   * Run job with a name
   *
   * @param {string} name Name of the job to run
   * @param {object} options Options passed to job runner
   * @return {Object.<string,Namespace>} Namespaces
   */
  run(name, options) {
    const job = this.namespace.getJob(name);
    const id = (Date.now() % 100000000).toString();

    if (!job) {
      return Promise.reject(new Error('Job with that name not defined'));
    }

    const namespace = job.metadata.namespace;

    job.metadata.name = job.metadata.name + '-' + id;
    job.spec.template.metadata.labels =
      _.extend(job.spec.template.metadata.labels, {job: name});
    job.spec.template.metadata.name = job.metadata.name;

    return this.kubectl.deploy(namespace, 'job', job.metadata.name, job).then(() => {
      if (options.wait) {
        return this.kubectl.wait(namespace, 'pod', `-l job-id=${id}`, {timeout: 100000}, pods => {
          const pod = _.first(pods.items);

          if (
            _.get(pod, 'status.phase') === 'Running' ||
            _.get(pod, 'status.phase') === 'Succeeded' ||
            _.get(pod, 'status.phase') === 'Failed'
          ) {
            return pod;
          }

          return Promise.reject(new Error("retry"));
        }).then(pod => {
          const child = this.kubectl.logs(namespace, pod.metadata.name);
          child.stdout.pipe(process.stdout);

          return this.kubectl.wait(namespace, 'job', job.metadata.name, {timeout: 100000}, job => {
            if (!job.status.succeeded) {
              return Promise.reject();
            }
          }).then(() => {
            child.kill();
            console.log("job complete");
          });
        }).then(() => {
          if (options.gc) {
            return this.kubectl.delete(namespace, 'job', job.metadata.name);
          }
        });
      }
    });
  }
}

module.exports = JobRunner;
