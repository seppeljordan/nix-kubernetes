{
  scheduledJobs = {
    kubernetes.scheduledJobs.everyminute = {
      schedule = "0/1 * * * ?";
      job.pod.restartPolicy = "OnFailure";
      job.pod.containers.hello = {
        image = "busybox";
        args = "date; echo Hello from the Kubernetes cluster";
      };
    };
  };
}
