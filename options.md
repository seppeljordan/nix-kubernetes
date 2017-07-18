# nix-kubernetes options

List of all nix-kubernetes options

## namespaces options

* `kubernetes.namespaces`:

  Attribute set of namespaces

  **Default:** {}
  **Example:** ...

* `kubernetes.namespaces.<name>.annotations`:

  Resource annotation

  **Default:** {}
  **Example:** ...

* `kubernetes.namespaces.<name>.dependencies`:

  Resource dependencies

  **Default:** []
  **Example:** ...

* `kubernetes.namespaces.<name>.labels`:

  Resource labels

  **Default:** {}
  **Example:** ...

* `kubernetes.namespaces.<name>.name`:

  Name of the resource

  **Default:** ""
  **Example:** ...

* `kubernetes.namespaces.<name>.networkPolicy.ingress.isolation`:

  Namespace network policy

  **Default:** null
  **Example:** ...

## pods options

* `kubernetes.pods`:

  Attribute set of pods

  **Default:** {}
  **Example:** ...

* `kubernetes.pods.<name>.annotations`:

  Resource annotation

  **Default:** {}
  **Example:** ...

* `kubernetes.pods.<name>.containers`:

  Pod containers

  **Default:** "..."
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.args`:

  Arguments to command

  **Default:** null
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.command`:

  Command to run

  **Default:** null
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.enable`:

  Whether to enable container

  **Default:** true
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.env`:

  Environment variables to set. This can be any value that serializes to
string. If value starts with "secret:<name>:<key>" or
"configMap:<name>:<key>" if references respected secret or config map
values.


  **Default:** {}
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.image`:

  Image to use

  **Default:** "..."
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.imagePullPolicy`:

  When to pull new container image

  **Default:** "Always"
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.limits.cpu`:

  Limit cpu for container

  **Default:** null
  **Example:** "500m"

* `kubernetes.pods.<name>.containers.<name>.limits.memory`:

  Limit memory for container

  **Default:** null
  **Example:** "128Mi"

* `kubernetes.pods.<name>.containers.<name>.livenessProbe.enable`:

  Whether to enable probe

  **Default:** false
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.livenessProbe.exec.command`:

  Command to run for check

  **Default:** null
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.livenessProbe.httpGet.path`:

  Http check path

  **Default:** null
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.livenessProbe.httpGet.port`:

  Http check port

  **Default:** 80
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.livenessProbe.initialDelaySeconds`:

  Initial delay before checking

  **Default:** 30
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.livenessProbe.tcpSocket.port`:

  Port to connect to for check

  **Default:** null
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.livenessProbe.timeoutSeconds`:

  Check timeout

  **Default:** 5
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.mounts`:

  Volumes mounted in pod

  **Default:** []
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.mounts.*.mountPath`:

  Mount path of volume

  **Default:** "..."
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.mounts.*.name`:

  Name of the volume

  **Default:** "..."
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.mounts.*.readOnly`:

  Whether to mount read only

  **Default:** false
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.mounts.*.subPath`:

  Sub path to mount

  **Default:** null
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.name`:

  Name of the container

  **Default:** ""
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.ports`:

  Ports exposed by pod

  **Default:** []
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.ports.*.containerPort`:

  Port in container

  **Default:** "..."
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.ports.*.hostPort`:

  Port on the host to bind to

  **Default:** null
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.ports.*.name`:

  Name of the port

  **Default:** null
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.ports.*.port`:

  Port to expose

  **Default:** "..."
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.ports.*.protocol`:

  Protocol to use

  **Default:** "TCP"
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.postStart.command`:

  Command to execute in post start phase

  **Default:** null
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.readinessProbe.enable`:

  Whether to enable probe

  **Default:** false
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.readinessProbe.exec.command`:

  Command to run for check

  **Default:** null
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.readinessProbe.httpGet.path`:

  Http check path

  **Default:** null
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.readinessProbe.httpGet.port`:

  Http check port

  **Default:** 80
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.readinessProbe.initialDelaySeconds`:

  Initial delay before checking

  **Default:** 30
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.readinessProbe.tcpSocket.port`:

  Port to connect to for check

  **Default:** null
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.readinessProbe.timeoutSeconds`:

  Check timeout

  **Default:** 5
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.requests.cpu`:

  Limit cpu for container

  **Default:** null
  **Example:** "500m"

* `kubernetes.pods.<name>.containers.<name>.requests.memory`:

  Limit memory for container

  **Default:** null
  **Example:** "128Mi"

* `kubernetes.pods.<name>.containers.<name>.security.capabilities.add`:

  Capabilites to add

  **Default:** []
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.security.privileged`:

  Whether to run container as privileged

  **Default:** false
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.stdin`:

  Whether to enable stdin

  **Default:** false
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.tty`:

  Whether to enable tty

  **Default:** false
  **Example:** ...

* `kubernetes.pods.<name>.containers.<name>.workdir`:

  Container working directory

  **Default:** null
  **Example:** ...

* `kubernetes.pods.<name>.dependencies`:

  Resource dependencies

  **Default:** []
  **Example:** ...

* `kubernetes.pods.<name>.hostNetwork`:

  Whether to use host networking

  **Default:** false
  **Example:** ...

* `kubernetes.pods.<name>.hostPID`:

  Whether to use host PID

  **Default:** false
  **Example:** ...

* `kubernetes.pods.<name>.imagePullSecrets`:

  Name of the secret to use for pulling docker image

  **Default:** []
  **Example:** ...

* `kubernetes.pods.<name>.initContainers`:

  Pod init containers

  **Default:** []
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.args`:

  Arguments to command

  **Default:** null
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.command`:

  Command to run

  **Default:** null
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.enable`:

  Whether to enable container

  **Default:** true
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.env`:

  Environment variables to set. This can be any value that serializes to
string. If value starts with "secret:<name>:<key>" or
"configMap:<name>:<key>" if references respected secret or config map
values.


  **Default:** {}
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.image`:

  Image to use

  **Default:** "..."
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.imagePullPolicy`:

  When to pull new container image

  **Default:** "Always"
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.limits.cpu`:

  Limit cpu for container

  **Default:** null
  **Example:** "500m"

* `kubernetes.pods.<name>.initContainers.*.limits.memory`:

  Limit memory for container

  **Default:** null
  **Example:** "128Mi"

* `kubernetes.pods.<name>.initContainers.*.livenessProbe.enable`:

  Whether to enable probe

  **Default:** false
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.livenessProbe.exec.command`:

  Command to run for check

  **Default:** null
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.livenessProbe.httpGet.path`:

  Http check path

  **Default:** null
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.livenessProbe.httpGet.port`:

  Http check port

  **Default:** 80
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.livenessProbe.initialDelaySeconds`:

  Initial delay before checking

  **Default:** 30
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.livenessProbe.tcpSocket.port`:

  Port to connect to for check

  **Default:** null
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.livenessProbe.timeoutSeconds`:

  Check timeout

  **Default:** 5
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.mounts`:

  Volumes mounted in pod

  **Default:** []
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.mounts.*.mountPath`:

  Mount path of volume

  **Default:** "..."
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.mounts.*.name`:

  Name of the volume

  **Default:** "..."
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.mounts.*.readOnly`:

  Whether to mount read only

  **Default:** false
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.mounts.*.subPath`:

  Sub path to mount

  **Default:** null
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.name`:

  Name of the container

  **Default:** ""
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.ports`:

  Ports exposed by pod

  **Default:** []
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.ports.*.containerPort`:

  Port in container

  **Default:** "..."
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.ports.*.hostPort`:

  Port on the host to bind to

  **Default:** null
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.ports.*.name`:

  Name of the port

  **Default:** null
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.ports.*.port`:

  Port to expose

  **Default:** "..."
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.ports.*.protocol`:

  Protocol to use

  **Default:** "TCP"
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.postStart.command`:

  Command to execute in post start phase

  **Default:** null
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.readinessProbe.enable`:

  Whether to enable probe

  **Default:** false
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.readinessProbe.exec.command`:

  Command to run for check

  **Default:** null
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.readinessProbe.httpGet.path`:

  Http check path

  **Default:** null
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.readinessProbe.httpGet.port`:

  Http check port

  **Default:** 80
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.readinessProbe.initialDelaySeconds`:

  Initial delay before checking

  **Default:** 30
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.readinessProbe.tcpSocket.port`:

  Port to connect to for check

  **Default:** null
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.readinessProbe.timeoutSeconds`:

  Check timeout

  **Default:** 5
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.requests.cpu`:

  Limit cpu for container

  **Default:** null
  **Example:** "500m"

* `kubernetes.pods.<name>.initContainers.*.requests.memory`:

  Limit memory for container

  **Default:** null
  **Example:** "128Mi"

* `kubernetes.pods.<name>.initContainers.*.security.capabilities.add`:

  Capabilites to add

  **Default:** []
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.security.privileged`:

  Whether to run container as privileged

  **Default:** false
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.stdin`:

  Whether to enable stdin

  **Default:** false
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.tty`:

  Whether to enable tty

  **Default:** false
  **Example:** ...

* `kubernetes.pods.<name>.initContainers.*.workdir`:

  Container working directory

  **Default:** null
  **Example:** ...

* `kubernetes.pods.<name>.labels`:

  Resource labels

  **Default:** {}
  **Example:** ...

* `kubernetes.pods.<name>.name`:

  Name of the resource

  **Default:** ""
  **Example:** ...

* `kubernetes.pods.<name>.namespace`:

  Resource namespace

  **Default:** "default"
  **Example:** ...

* `kubernetes.pods.<name>.nodeSelector`:

  Node selector where to put pod

  **Default:** {}
  **Example:** ...

* `kubernetes.pods.<name>.restartPolicy`:

  Pod restart policy

  **Default:** "Always"
  **Example:** ...

* `kubernetes.pods.<name>.securityContext.fsGroup`:

  Container filesystem group id

  **Default:** null
  **Example:** ...

* `kubernetes.pods.<name>.securityContext.runAsUser`:

  Run container as user id

  **Default:** null
  **Example:** ...

* `kubernetes.pods.<name>.serviceAccountName`:

  Service account name for this resource

  **Default:** null
  **Example:** ...

* `kubernetes.pods.<name>.volumes`:

  Pod volumes

  **Default:** {}
  **Example:** ...

* `kubernetes.pods.<name>.volumes.<name>.name`:

  Name of the volume

  **Default:** ""
  **Example:** ...

* `kubernetes.pods.<name>.volumes.<name>.options`:

  Volume options

  **Default:** {}
  **Example:** ...

* `kubernetes.pods.<name>.volumes.<name>.type`:

  Volume type

  **Default:** "..."
  **Example:** ...

## services options

* `kubernetes.services`:

  Attribute set of services

  **Default:** {}
  **Example:** ...

* `kubernetes.services.<name>.annotations`:

  Resource annotation

  **Default:** {}
  **Example:** ...

* `kubernetes.services.<name>.clusterIP`:

  Cluster IP to set

  **Default:** null
  **Example:** ...

* `kubernetes.services.<name>.dependencies`:

  Resource dependencies

  **Default:** []
  **Example:** ...

* `kubernetes.services.<name>.externalIPs`:

  List of external IPs

  **Default:** null
  **Example:** ...

* `kubernetes.services.<name>.labels`:

  Resource labels

  **Default:** {}
  **Example:** ...

* `kubernetes.services.<name>.name`:

  Name of the resource

  **Default:** ""
  **Example:** ...

* `kubernetes.services.<name>.namespace`:

  Resource namespace

  **Default:** "default"
  **Example:** ...

* `kubernetes.services.<name>.ports`:

  Ports exposed by service

  **Default:** "..."
  **Example:** ...

* `kubernetes.services.<name>.ports.*.name`:

  Name of the port

  **Default:** null
  **Example:** ...

* `kubernetes.services.<name>.ports.*.nodePort`:

  Port on the node

  **Default:** null
  **Example:** ...

* `kubernetes.services.<name>.ports.*.port`:

  Port to expose

  **Default:** "..."
  **Example:** ...

* `kubernetes.services.<name>.ports.*.protocol`:

  Protocol to use

  **Default:** "TCP"
  **Example:** ...

* `kubernetes.services.<name>.ports.*.targetPort`:

  Pod target port

  **Default:** "..."
  **Example:** ...

* `kubernetes.services.<name>.selector`:

  Service selector

  **Default:** {"name":""}
  **Example:** ...

* `kubernetes.services.<name>.type`:

  Service type (ClusterIP, NodePort, LoadBalancer)

  **Default:** "ClusterIP"
  **Example:** ...

## controllers options

* `kubernetes.controllers`:

  Attribute set of controllers

  **Default:** {}
  **Example:** ...

* `kubernetes.controllers.<name>.annotations`:

  Resource annotation

  **Default:** {}
  **Example:** ...

* `kubernetes.controllers.<name>.dependencies`:

  Resource dependencies

  **Default:** []
  **Example:** ...

* `kubernetes.controllers.<name>.enable`:

  Whether to enable controller

  **Default:** false
  **Example:** ...

* `kubernetes.controllers.<name>.labels`:

  Resource labels

  **Default:** {}
  **Example:** ...

* `kubernetes.controllers.<name>.name`:

  Name of the resource

  **Default:** ""
  **Example:** ...

* `kubernetes.controllers.<name>.namespace`:

  Resource namespace

  **Default:** "default"
  **Example:** ...

* `kubernetes.controllers.<name>.pod.annotations`:

  Pod annotation

  **Default:** {}
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers`:

  Pod containers

  **Default:** "..."
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.args`:

  Arguments to command

  **Default:** null
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.command`:

  Command to run

  **Default:** null
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.enable`:

  Whether to enable container

  **Default:** true
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.env`:

  Environment variables to set. This can be any value that serializes to
string. If value starts with "secret:<name>:<key>" or
"configMap:<name>:<key>" if references respected secret or config map
values.


  **Default:** {}
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.image`:

  Image to use

  **Default:** "..."
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.imagePullPolicy`:

  When to pull new container image

  **Default:** "Always"
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.limits.cpu`:

  Limit cpu for container

  **Default:** null
  **Example:** "500m"

* `kubernetes.controllers.<name>.pod.containers.<name>.limits.memory`:

  Limit memory for container

  **Default:** null
  **Example:** "128Mi"

* `kubernetes.controllers.<name>.pod.containers.<name>.livenessProbe.enable`:

  Whether to enable probe

  **Default:** false
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.livenessProbe.exec.command`:

  Command to run for check

  **Default:** null
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.livenessProbe.httpGet.path`:

  Http check path

  **Default:** null
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.livenessProbe.httpGet.port`:

  Http check port

  **Default:** 80
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.livenessProbe.initialDelaySeconds`:

  Initial delay before checking

  **Default:** 30
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.livenessProbe.tcpSocket.port`:

  Port to connect to for check

  **Default:** null
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.livenessProbe.timeoutSeconds`:

  Check timeout

  **Default:** 5
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.mounts`:

  Volumes mounted in pod

  **Default:** []
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.mounts.*.mountPath`:

  Mount path of volume

  **Default:** "..."
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.mounts.*.name`:

  Name of the volume

  **Default:** "..."
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.mounts.*.readOnly`:

  Whether to mount read only

  **Default:** false
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.mounts.*.subPath`:

  Sub path to mount

  **Default:** null
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.name`:

  Name of the container

  **Default:** ""
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.ports`:

  Ports exposed by pod

  **Default:** []
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.ports.*.containerPort`:

  Port in container

  **Default:** "..."
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.ports.*.hostPort`:

  Port on the host to bind to

  **Default:** null
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.ports.*.name`:

  Name of the port

  **Default:** null
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.ports.*.port`:

  Port to expose

  **Default:** "..."
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.ports.*.protocol`:

  Protocol to use

  **Default:** "TCP"
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.postStart.command`:

  Command to execute in post start phase

  **Default:** null
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.readinessProbe.enable`:

  Whether to enable probe

  **Default:** false
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.readinessProbe.exec.command`:

  Command to run for check

  **Default:** null
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.readinessProbe.httpGet.path`:

  Http check path

  **Default:** null
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.readinessProbe.httpGet.port`:

  Http check port

  **Default:** 80
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.readinessProbe.initialDelaySeconds`:

  Initial delay before checking

  **Default:** 30
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.readinessProbe.tcpSocket.port`:

  Port to connect to for check

  **Default:** null
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.readinessProbe.timeoutSeconds`:

  Check timeout

  **Default:** 5
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.requests.cpu`:

  Limit cpu for container

  **Default:** null
  **Example:** "500m"

* `kubernetes.controllers.<name>.pod.containers.<name>.requests.memory`:

  Limit memory for container

  **Default:** null
  **Example:** "128Mi"

* `kubernetes.controllers.<name>.pod.containers.<name>.security.capabilities.add`:

  Capabilites to add

  **Default:** []
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.security.privileged`:

  Whether to run container as privileged

  **Default:** false
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.stdin`:

  Whether to enable stdin

  **Default:** false
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.tty`:

  Whether to enable tty

  **Default:** false
  **Example:** ...

* `kubernetes.controllers.<name>.pod.containers.<name>.workdir`:

  Container working directory

  **Default:** null
  **Example:** ...

* `kubernetes.controllers.<name>.pod.hostNetwork`:

  Whether to use host networking

  **Default:** false
  **Example:** ...

* `kubernetes.controllers.<name>.pod.hostPID`:

  Whether to use host PID

  **Default:** false
  **Example:** ...

* `kubernetes.controllers.<name>.pod.imagePullSecrets`:

  Name of the secret to use for pulling docker image

  **Default:** []
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers`:

  Pod init containers

  **Default:** []
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.args`:

  Arguments to command

  **Default:** null
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.command`:

  Command to run

  **Default:** null
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.enable`:

  Whether to enable container

  **Default:** true
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.env`:

  Environment variables to set. This can be any value that serializes to
string. If value starts with "secret:<name>:<key>" or
"configMap:<name>:<key>" if references respected secret or config map
values.


  **Default:** {}
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.image`:

  Image to use

  **Default:** "..."
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.imagePullPolicy`:

  When to pull new container image

  **Default:** "Always"
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.limits.cpu`:

  Limit cpu for container

  **Default:** null
  **Example:** "500m"

* `kubernetes.controllers.<name>.pod.initContainers.*.limits.memory`:

  Limit memory for container

  **Default:** null
  **Example:** "128Mi"

* `kubernetes.controllers.<name>.pod.initContainers.*.livenessProbe.enable`:

  Whether to enable probe

  **Default:** false
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.livenessProbe.exec.command`:

  Command to run for check

  **Default:** null
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.livenessProbe.httpGet.path`:

  Http check path

  **Default:** null
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.livenessProbe.httpGet.port`:

  Http check port

  **Default:** 80
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.livenessProbe.initialDelaySeconds`:

  Initial delay before checking

  **Default:** 30
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.livenessProbe.tcpSocket.port`:

  Port to connect to for check

  **Default:** null
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.livenessProbe.timeoutSeconds`:

  Check timeout

  **Default:** 5
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.mounts`:

  Volumes mounted in pod

  **Default:** []
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.mounts.*.mountPath`:

  Mount path of volume

  **Default:** "..."
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.mounts.*.name`:

  Name of the volume

  **Default:** "..."
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.mounts.*.readOnly`:

  Whether to mount read only

  **Default:** false
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.mounts.*.subPath`:

  Sub path to mount

  **Default:** null
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.name`:

  Name of the container

  **Default:** ""
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.ports`:

  Ports exposed by pod

  **Default:** []
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.ports.*.containerPort`:

  Port in container

  **Default:** "..."
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.ports.*.hostPort`:

  Port on the host to bind to

  **Default:** null
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.ports.*.name`:

  Name of the port

  **Default:** null
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.ports.*.port`:

  Port to expose

  **Default:** "..."
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.ports.*.protocol`:

  Protocol to use

  **Default:** "TCP"
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.postStart.command`:

  Command to execute in post start phase

  **Default:** null
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.readinessProbe.enable`:

  Whether to enable probe

  **Default:** false
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.readinessProbe.exec.command`:

  Command to run for check

  **Default:** null
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.readinessProbe.httpGet.path`:

  Http check path

  **Default:** null
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.readinessProbe.httpGet.port`:

  Http check port

  **Default:** 80
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.readinessProbe.initialDelaySeconds`:

  Initial delay before checking

  **Default:** 30
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.readinessProbe.tcpSocket.port`:

  Port to connect to for check

  **Default:** null
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.readinessProbe.timeoutSeconds`:

  Check timeout

  **Default:** 5
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.requests.cpu`:

  Limit cpu for container

  **Default:** null
  **Example:** "500m"

* `kubernetes.controllers.<name>.pod.initContainers.*.requests.memory`:

  Limit memory for container

  **Default:** null
  **Example:** "128Mi"

* `kubernetes.controllers.<name>.pod.initContainers.*.security.capabilities.add`:

  Capabilites to add

  **Default:** []
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.security.privileged`:

  Whether to run container as privileged

  **Default:** false
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.stdin`:

  Whether to enable stdin

  **Default:** false
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.tty`:

  Whether to enable tty

  **Default:** false
  **Example:** ...

* `kubernetes.controllers.<name>.pod.initContainers.*.workdir`:

  Container working directory

  **Default:** null
  **Example:** ...

* `kubernetes.controllers.<name>.pod.labels`:

  Pod labels

  **Default:** {}
  **Example:** ...

* `kubernetes.controllers.<name>.pod.nodeSelector`:

  Node selector where to put pod

  **Default:** {}
  **Example:** ...

* `kubernetes.controllers.<name>.pod.restartPolicy`:

  Pod restart policy

  **Default:** "Always"
  **Example:** ...

* `kubernetes.controllers.<name>.pod.securityContext.fsGroup`:

  Container filesystem group id

  **Default:** null
  **Example:** ...

* `kubernetes.controllers.<name>.pod.securityContext.runAsUser`:

  Run container as user id

  **Default:** null
  **Example:** ...

* `kubernetes.controllers.<name>.pod.serviceAccountName`:

  Service account name for this resource

  **Default:** null
  **Example:** ...

* `kubernetes.controllers.<name>.pod.volumes`:

  Pod volumes

  **Default:** {}
  **Example:** ...

* `kubernetes.controllers.<name>.pod.volumes.<name>.name`:

  Name of the volume

  **Default:** ""
  **Example:** ...

* `kubernetes.controllers.<name>.pod.volumes.<name>.options`:

  Volume options

  **Default:** {}
  **Example:** ...

* `kubernetes.controllers.<name>.pod.volumes.<name>.type`:

  Volume type

  **Default:** "..."
  **Example:** ...

* `kubernetes.controllers.<name>.replicas`:

  Number of replicas to run

  **Default:** 1
  **Example:** ...

* `kubernetes.controllers.<name>.selector`:

  Pod selector

  **Default:** {"name":""}
  **Example:** ...

## deployments options

* `kubernetes.deployments`:

  Attribute set of deployments

  **Default:** {}
  **Example:** ...

* `kubernetes.deployments.<name>.annotations`:

  Resource annotation

  **Default:** {}
  **Example:** ...

* `kubernetes.deployments.<name>.dependencies`:

  Resource dependencies

  **Default:** []
  **Example:** ...

* `kubernetes.deployments.<name>.enable`:

  Whether to enable deployment

  **Default:** false
  **Example:** ...

* `kubernetes.deployments.<name>.labels`:

  Resource labels

  **Default:** {}
  **Example:** ...

* `kubernetes.deployments.<name>.name`:

  Name of the resource

  **Default:** ""
  **Example:** ...

* `kubernetes.deployments.<name>.namespace`:

  Resource namespace

  **Default:** "default"
  **Example:** ...

* `kubernetes.deployments.<name>.pod.annotations`:

  Pod annotation

  **Default:** {}
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers`:

  Pod containers

  **Default:** "..."
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.args`:

  Arguments to command

  **Default:** null
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.command`:

  Command to run

  **Default:** null
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.enable`:

  Whether to enable container

  **Default:** true
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.env`:

  Environment variables to set. This can be any value that serializes to
string. If value starts with "secret:<name>:<key>" or
"configMap:<name>:<key>" if references respected secret or config map
values.


  **Default:** {}
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.image`:

  Image to use

  **Default:** "..."
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.imagePullPolicy`:

  When to pull new container image

  **Default:** "Always"
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.limits.cpu`:

  Limit cpu for container

  **Default:** null
  **Example:** "500m"

* `kubernetes.deployments.<name>.pod.containers.<name>.limits.memory`:

  Limit memory for container

  **Default:** null
  **Example:** "128Mi"

* `kubernetes.deployments.<name>.pod.containers.<name>.livenessProbe.enable`:

  Whether to enable probe

  **Default:** false
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.livenessProbe.exec.command`:

  Command to run for check

  **Default:** null
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.livenessProbe.httpGet.path`:

  Http check path

  **Default:** null
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.livenessProbe.httpGet.port`:

  Http check port

  **Default:** 80
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.livenessProbe.initialDelaySeconds`:

  Initial delay before checking

  **Default:** 30
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.livenessProbe.tcpSocket.port`:

  Port to connect to for check

  **Default:** null
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.livenessProbe.timeoutSeconds`:

  Check timeout

  **Default:** 5
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.mounts`:

  Volumes mounted in pod

  **Default:** []
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.mounts.*.mountPath`:

  Mount path of volume

  **Default:** "..."
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.mounts.*.name`:

  Name of the volume

  **Default:** "..."
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.mounts.*.readOnly`:

  Whether to mount read only

  **Default:** false
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.mounts.*.subPath`:

  Sub path to mount

  **Default:** null
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.name`:

  Name of the container

  **Default:** ""
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.ports`:

  Ports exposed by pod

  **Default:** []
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.ports.*.containerPort`:

  Port in container

  **Default:** "..."
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.ports.*.hostPort`:

  Port on the host to bind to

  **Default:** null
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.ports.*.name`:

  Name of the port

  **Default:** null
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.ports.*.port`:

  Port to expose

  **Default:** "..."
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.ports.*.protocol`:

  Protocol to use

  **Default:** "TCP"
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.postStart.command`:

  Command to execute in post start phase

  **Default:** null
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.readinessProbe.enable`:

  Whether to enable probe

  **Default:** false
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.readinessProbe.exec.command`:

  Command to run for check

  **Default:** null
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.readinessProbe.httpGet.path`:

  Http check path

  **Default:** null
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.readinessProbe.httpGet.port`:

  Http check port

  **Default:** 80
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.readinessProbe.initialDelaySeconds`:

  Initial delay before checking

  **Default:** 30
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.readinessProbe.tcpSocket.port`:

  Port to connect to for check

  **Default:** null
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.readinessProbe.timeoutSeconds`:

  Check timeout

  **Default:** 5
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.requests.cpu`:

  Limit cpu for container

  **Default:** null
  **Example:** "500m"

* `kubernetes.deployments.<name>.pod.containers.<name>.requests.memory`:

  Limit memory for container

  **Default:** null
  **Example:** "128Mi"

* `kubernetes.deployments.<name>.pod.containers.<name>.security.capabilities.add`:

  Capabilites to add

  **Default:** []
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.security.privileged`:

  Whether to run container as privileged

  **Default:** false
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.stdin`:

  Whether to enable stdin

  **Default:** false
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.tty`:

  Whether to enable tty

  **Default:** false
  **Example:** ...

* `kubernetes.deployments.<name>.pod.containers.<name>.workdir`:

  Container working directory

  **Default:** null
  **Example:** ...

* `kubernetes.deployments.<name>.pod.hostNetwork`:

  Whether to use host networking

  **Default:** false
  **Example:** ...

* `kubernetes.deployments.<name>.pod.hostPID`:

  Whether to use host PID

  **Default:** false
  **Example:** ...

* `kubernetes.deployments.<name>.pod.imagePullSecrets`:

  Name of the secret to use for pulling docker image

  **Default:** []
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers`:

  Pod init containers

  **Default:** []
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.args`:

  Arguments to command

  **Default:** null
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.command`:

  Command to run

  **Default:** null
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.enable`:

  Whether to enable container

  **Default:** true
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.env`:

  Environment variables to set. This can be any value that serializes to
string. If value starts with "secret:<name>:<key>" or
"configMap:<name>:<key>" if references respected secret or config map
values.


  **Default:** {}
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.image`:

  Image to use

  **Default:** "..."
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.imagePullPolicy`:

  When to pull new container image

  **Default:** "Always"
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.limits.cpu`:

  Limit cpu for container

  **Default:** null
  **Example:** "500m"

* `kubernetes.deployments.<name>.pod.initContainers.*.limits.memory`:

  Limit memory for container

  **Default:** null
  **Example:** "128Mi"

* `kubernetes.deployments.<name>.pod.initContainers.*.livenessProbe.enable`:

  Whether to enable probe

  **Default:** false
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.livenessProbe.exec.command`:

  Command to run for check

  **Default:** null
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.livenessProbe.httpGet.path`:

  Http check path

  **Default:** null
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.livenessProbe.httpGet.port`:

  Http check port

  **Default:** 80
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.livenessProbe.initialDelaySeconds`:

  Initial delay before checking

  **Default:** 30
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.livenessProbe.tcpSocket.port`:

  Port to connect to for check

  **Default:** null
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.livenessProbe.timeoutSeconds`:

  Check timeout

  **Default:** 5
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.mounts`:

  Volumes mounted in pod

  **Default:** []
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.mounts.*.mountPath`:

  Mount path of volume

  **Default:** "..."
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.mounts.*.name`:

  Name of the volume

  **Default:** "..."
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.mounts.*.readOnly`:

  Whether to mount read only

  **Default:** false
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.mounts.*.subPath`:

  Sub path to mount

  **Default:** null
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.name`:

  Name of the container

  **Default:** ""
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.ports`:

  Ports exposed by pod

  **Default:** []
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.ports.*.containerPort`:

  Port in container

  **Default:** "..."
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.ports.*.hostPort`:

  Port on the host to bind to

  **Default:** null
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.ports.*.name`:

  Name of the port

  **Default:** null
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.ports.*.port`:

  Port to expose

  **Default:** "..."
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.ports.*.protocol`:

  Protocol to use

  **Default:** "TCP"
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.postStart.command`:

  Command to execute in post start phase

  **Default:** null
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.readinessProbe.enable`:

  Whether to enable probe

  **Default:** false
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.readinessProbe.exec.command`:

  Command to run for check

  **Default:** null
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.readinessProbe.httpGet.path`:

  Http check path

  **Default:** null
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.readinessProbe.httpGet.port`:

  Http check port

  **Default:** 80
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.readinessProbe.initialDelaySeconds`:

  Initial delay before checking

  **Default:** 30
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.readinessProbe.tcpSocket.port`:

  Port to connect to for check

  **Default:** null
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.readinessProbe.timeoutSeconds`:

  Check timeout

  **Default:** 5
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.requests.cpu`:

  Limit cpu for container

  **Default:** null
  **Example:** "500m"

* `kubernetes.deployments.<name>.pod.initContainers.*.requests.memory`:

  Limit memory for container

  **Default:** null
  **Example:** "128Mi"

* `kubernetes.deployments.<name>.pod.initContainers.*.security.capabilities.add`:

  Capabilites to add

  **Default:** []
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.security.privileged`:

  Whether to run container as privileged

  **Default:** false
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.stdin`:

  Whether to enable stdin

  **Default:** false
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.tty`:

  Whether to enable tty

  **Default:** false
  **Example:** ...

* `kubernetes.deployments.<name>.pod.initContainers.*.workdir`:

  Container working directory

  **Default:** null
  **Example:** ...

* `kubernetes.deployments.<name>.pod.labels`:

  Pod labels

  **Default:** {}
  **Example:** ...

* `kubernetes.deployments.<name>.pod.nodeSelector`:

  Node selector where to put pod

  **Default:** {}
  **Example:** ...

* `kubernetes.deployments.<name>.pod.restartPolicy`:

  Pod restart policy

  **Default:** "Always"
  **Example:** ...

* `kubernetes.deployments.<name>.pod.securityContext.fsGroup`:

  Container filesystem group id

  **Default:** null
  **Example:** ...

* `kubernetes.deployments.<name>.pod.securityContext.runAsUser`:

  Run container as user id

  **Default:** null
  **Example:** ...

* `kubernetes.deployments.<name>.pod.serviceAccountName`:

  Service account name for this resource

  **Default:** null
  **Example:** ...

* `kubernetes.deployments.<name>.pod.volumes`:

  Pod volumes

  **Default:** {}
  **Example:** ...

* `kubernetes.deployments.<name>.pod.volumes.<name>.name`:

  Name of the volume

  **Default:** ""
  **Example:** ...

* `kubernetes.deployments.<name>.pod.volumes.<name>.options`:

  Volume options

  **Default:** {}
  **Example:** ...

* `kubernetes.deployments.<name>.pod.volumes.<name>.type`:

  Volume type

  **Default:** "..."
  **Example:** ...

* `kubernetes.deployments.<name>.replicas`:

  Number of replicas to run

  **Default:** 1
  **Example:** ...

## daemonsets options

* `kubernetes.daemonsets`:

  Attribute set of daemonsets

  **Default:** {}
  **Example:** ...

* `kubernetes.daemonsets.<name>.annotations`:

  Resource annotation

  **Default:** {}
  **Example:** ...

* `kubernetes.daemonsets.<name>.dependencies`:

  Resource dependencies

  **Default:** []
  **Example:** ...

* `kubernetes.daemonsets.<name>.enable`:

  Whether to enable daemon set

  **Default:** false
  **Example:** ...

* `kubernetes.daemonsets.<name>.labels`:

  Resource labels

  **Default:** {}
  **Example:** ...

* `kubernetes.daemonsets.<name>.name`:

  Name of the resource

  **Default:** ""
  **Example:** ...

* `kubernetes.daemonsets.<name>.namespace`:

  Resource namespace

  **Default:** "default"
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.annotations`:

  Pod annotation

  **Default:** {}
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers`:

  Pod containers

  **Default:** "..."
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.args`:

  Arguments to command

  **Default:** null
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.command`:

  Command to run

  **Default:** null
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.enable`:

  Whether to enable container

  **Default:** true
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.env`:

  Environment variables to set. This can be any value that serializes to
string. If value starts with "secret:<name>:<key>" or
"configMap:<name>:<key>" if references respected secret or config map
values.


  **Default:** {}
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.image`:

  Image to use

  **Default:** "..."
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.imagePullPolicy`:

  When to pull new container image

  **Default:** "Always"
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.limits.cpu`:

  Limit cpu for container

  **Default:** null
  **Example:** "500m"

* `kubernetes.daemonsets.<name>.pod.containers.<name>.limits.memory`:

  Limit memory for container

  **Default:** null
  **Example:** "128Mi"

* `kubernetes.daemonsets.<name>.pod.containers.<name>.livenessProbe.enable`:

  Whether to enable probe

  **Default:** false
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.livenessProbe.exec.command`:

  Command to run for check

  **Default:** null
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.livenessProbe.httpGet.path`:

  Http check path

  **Default:** null
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.livenessProbe.httpGet.port`:

  Http check port

  **Default:** 80
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.livenessProbe.initialDelaySeconds`:

  Initial delay before checking

  **Default:** 30
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.livenessProbe.tcpSocket.port`:

  Port to connect to for check

  **Default:** null
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.livenessProbe.timeoutSeconds`:

  Check timeout

  **Default:** 5
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.mounts`:

  Volumes mounted in pod

  **Default:** []
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.mounts.*.mountPath`:

  Mount path of volume

  **Default:** "..."
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.mounts.*.name`:

  Name of the volume

  **Default:** "..."
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.mounts.*.readOnly`:

  Whether to mount read only

  **Default:** false
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.mounts.*.subPath`:

  Sub path to mount

  **Default:** null
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.name`:

  Name of the container

  **Default:** ""
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.ports`:

  Ports exposed by pod

  **Default:** []
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.ports.*.containerPort`:

  Port in container

  **Default:** "..."
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.ports.*.hostPort`:

  Port on the host to bind to

  **Default:** null
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.ports.*.name`:

  Name of the port

  **Default:** null
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.ports.*.port`:

  Port to expose

  **Default:** "..."
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.ports.*.protocol`:

  Protocol to use

  **Default:** "TCP"
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.postStart.command`:

  Command to execute in post start phase

  **Default:** null
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.readinessProbe.enable`:

  Whether to enable probe

  **Default:** false
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.readinessProbe.exec.command`:

  Command to run for check

  **Default:** null
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.readinessProbe.httpGet.path`:

  Http check path

  **Default:** null
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.readinessProbe.httpGet.port`:

  Http check port

  **Default:** 80
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.readinessProbe.initialDelaySeconds`:

  Initial delay before checking

  **Default:** 30
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.readinessProbe.tcpSocket.port`:

  Port to connect to for check

  **Default:** null
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.readinessProbe.timeoutSeconds`:

  Check timeout

  **Default:** 5
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.requests.cpu`:

  Limit cpu for container

  **Default:** null
  **Example:** "500m"

* `kubernetes.daemonsets.<name>.pod.containers.<name>.requests.memory`:

  Limit memory for container

  **Default:** null
  **Example:** "128Mi"

* `kubernetes.daemonsets.<name>.pod.containers.<name>.security.capabilities.add`:

  Capabilites to add

  **Default:** []
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.security.privileged`:

  Whether to run container as privileged

  **Default:** false
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.stdin`:

  Whether to enable stdin

  **Default:** false
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.tty`:

  Whether to enable tty

  **Default:** false
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.containers.<name>.workdir`:

  Container working directory

  **Default:** null
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.hostNetwork`:

  Whether to use host networking

  **Default:** false
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.hostPID`:

  Whether to use host PID

  **Default:** false
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.imagePullSecrets`:

  Name of the secret to use for pulling docker image

  **Default:** []
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers`:

  Pod init containers

  **Default:** []
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.args`:

  Arguments to command

  **Default:** null
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.command`:

  Command to run

  **Default:** null
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.enable`:

  Whether to enable container

  **Default:** true
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.env`:

  Environment variables to set. This can be any value that serializes to
string. If value starts with "secret:<name>:<key>" or
"configMap:<name>:<key>" if references respected secret or config map
values.


  **Default:** {}
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.image`:

  Image to use

  **Default:** "..."
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.imagePullPolicy`:

  When to pull new container image

  **Default:** "Always"
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.limits.cpu`:

  Limit cpu for container

  **Default:** null
  **Example:** "500m"

* `kubernetes.daemonsets.<name>.pod.initContainers.*.limits.memory`:

  Limit memory for container

  **Default:** null
  **Example:** "128Mi"

* `kubernetes.daemonsets.<name>.pod.initContainers.*.livenessProbe.enable`:

  Whether to enable probe

  **Default:** false
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.livenessProbe.exec.command`:

  Command to run for check

  **Default:** null
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.livenessProbe.httpGet.path`:

  Http check path

  **Default:** null
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.livenessProbe.httpGet.port`:

  Http check port

  **Default:** 80
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.livenessProbe.initialDelaySeconds`:

  Initial delay before checking

  **Default:** 30
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.livenessProbe.tcpSocket.port`:

  Port to connect to for check

  **Default:** null
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.livenessProbe.timeoutSeconds`:

  Check timeout

  **Default:** 5
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.mounts`:

  Volumes mounted in pod

  **Default:** []
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.mounts.*.mountPath`:

  Mount path of volume

  **Default:** "..."
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.mounts.*.name`:

  Name of the volume

  **Default:** "..."
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.mounts.*.readOnly`:

  Whether to mount read only

  **Default:** false
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.mounts.*.subPath`:

  Sub path to mount

  **Default:** null
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.name`:

  Name of the container

  **Default:** ""
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.ports`:

  Ports exposed by pod

  **Default:** []
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.ports.*.containerPort`:

  Port in container

  **Default:** "..."
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.ports.*.hostPort`:

  Port on the host to bind to

  **Default:** null
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.ports.*.name`:

  Name of the port

  **Default:** null
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.ports.*.port`:

  Port to expose

  **Default:** "..."
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.ports.*.protocol`:

  Protocol to use

  **Default:** "TCP"
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.postStart.command`:

  Command to execute in post start phase

  **Default:** null
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.readinessProbe.enable`:

  Whether to enable probe

  **Default:** false
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.readinessProbe.exec.command`:

  Command to run for check

  **Default:** null
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.readinessProbe.httpGet.path`:

  Http check path

  **Default:** null
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.readinessProbe.httpGet.port`:

  Http check port

  **Default:** 80
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.readinessProbe.initialDelaySeconds`:

  Initial delay before checking

  **Default:** 30
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.readinessProbe.tcpSocket.port`:

  Port to connect to for check

  **Default:** null
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.readinessProbe.timeoutSeconds`:

  Check timeout

  **Default:** 5
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.requests.cpu`:

  Limit cpu for container

  **Default:** null
  **Example:** "500m"

* `kubernetes.daemonsets.<name>.pod.initContainers.*.requests.memory`:

  Limit memory for container

  **Default:** null
  **Example:** "128Mi"

* `kubernetes.daemonsets.<name>.pod.initContainers.*.security.capabilities.add`:

  Capabilites to add

  **Default:** []
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.security.privileged`:

  Whether to run container as privileged

  **Default:** false
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.stdin`:

  Whether to enable stdin

  **Default:** false
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.tty`:

  Whether to enable tty

  **Default:** false
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.initContainers.*.workdir`:

  Container working directory

  **Default:** null
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.labels`:

  Pod labels

  **Default:** {}
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.nodeSelector`:

  Node selector where to put pod

  **Default:** {}
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.restartPolicy`:

  Pod restart policy

  **Default:** "Always"
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.securityContext.fsGroup`:

  Container filesystem group id

  **Default:** null
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.securityContext.runAsUser`:

  Run container as user id

  **Default:** null
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.serviceAccountName`:

  Service account name for this resource

  **Default:** null
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.volumes`:

  Pod volumes

  **Default:** {}
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.volumes.<name>.name`:

  Name of the volume

  **Default:** ""
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.volumes.<name>.options`:

  Volume options

  **Default:** {}
  **Example:** ...

* `kubernetes.daemonsets.<name>.pod.volumes.<name>.type`:

  Volume type

  **Default:** "..."
  **Example:** ...

## scheduledJobs options

* `kubernetes.scheduledJobs`:

  Attribute set of schedule job definitions

  **Default:** {}
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.annotations`:

  Resource annotation

  **Default:** {}
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.concurrencyPolicy`:

  How to treat concurrent executions of job

  **Default:** "Forbid"
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.dependencies`:

  Resource dependencies

  **Default:** []
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.enable`:

  Whether to enable scheduled job

  **Default:** true
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.activeDeadlineSeconds`:

  Job restart deadline

  **Default:** null
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.annotations`:

  Pod annotation

  **Default:** {}
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.labels`:

  Pod labels

  **Default:** {}
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.annotations`:

  Pod annotation

  **Default:** {}
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers`:

  Pod containers

  **Default:** "..."
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.args`:

  Arguments to command

  **Default:** null
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.command`:

  Command to run

  **Default:** null
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.enable`:

  Whether to enable container

  **Default:** true
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.env`:

  Environment variables to set. This can be any value that serializes to
string. If value starts with "secret:<name>:<key>" or
"configMap:<name>:<key>" if references respected secret or config map
values.


  **Default:** {}
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.image`:

  Image to use

  **Default:** "..."
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.imagePullPolicy`:

  When to pull new container image

  **Default:** "Always"
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.limits.cpu`:

  Limit cpu for container

  **Default:** null
  **Example:** "500m"

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.limits.memory`:

  Limit memory for container

  **Default:** null
  **Example:** "128Mi"

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.livenessProbe.enable`:

  Whether to enable probe

  **Default:** false
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.livenessProbe.exec.command`:

  Command to run for check

  **Default:** null
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.livenessProbe.httpGet.path`:

  Http check path

  **Default:** null
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.livenessProbe.httpGet.port`:

  Http check port

  **Default:** 80
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.livenessProbe.initialDelaySeconds`:

  Initial delay before checking

  **Default:** 30
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.livenessProbe.tcpSocket.port`:

  Port to connect to for check

  **Default:** null
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.livenessProbe.timeoutSeconds`:

  Check timeout

  **Default:** 5
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.mounts`:

  Volumes mounted in pod

  **Default:** []
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.mounts.*.mountPath`:

  Mount path of volume

  **Default:** "..."
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.mounts.*.name`:

  Name of the volume

  **Default:** "..."
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.mounts.*.readOnly`:

  Whether to mount read only

  **Default:** false
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.mounts.*.subPath`:

  Sub path to mount

  **Default:** null
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.name`:

  Name of the container

  **Default:** ""
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.ports`:

  Ports exposed by pod

  **Default:** []
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.ports.*.containerPort`:

  Port in container

  **Default:** "..."
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.ports.*.hostPort`:

  Port on the host to bind to

  **Default:** null
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.ports.*.name`:

  Name of the port

  **Default:** null
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.ports.*.port`:

  Port to expose

  **Default:** "..."
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.ports.*.protocol`:

  Protocol to use

  **Default:** "TCP"
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.postStart.command`:

  Command to execute in post start phase

  **Default:** null
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.readinessProbe.enable`:

  Whether to enable probe

  **Default:** false
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.readinessProbe.exec.command`:

  Command to run for check

  **Default:** null
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.readinessProbe.httpGet.path`:

  Http check path

  **Default:** null
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.readinessProbe.httpGet.port`:

  Http check port

  **Default:** 80
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.readinessProbe.initialDelaySeconds`:

  Initial delay before checking

  **Default:** 30
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.readinessProbe.tcpSocket.port`:

  Port to connect to for check

  **Default:** null
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.readinessProbe.timeoutSeconds`:

  Check timeout

  **Default:** 5
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.requests.cpu`:

  Limit cpu for container

  **Default:** null
  **Example:** "500m"

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.requests.memory`:

  Limit memory for container

  **Default:** null
  **Example:** "128Mi"

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.security.capabilities.add`:

  Capabilites to add

  **Default:** []
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.security.privileged`:

  Whether to run container as privileged

  **Default:** false
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.stdin`:

  Whether to enable stdin

  **Default:** false
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.tty`:

  Whether to enable tty

  **Default:** false
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.containers.<name>.workdir`:

  Container working directory

  **Default:** null
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.hostNetwork`:

  Whether to use host networking

  **Default:** false
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.hostPID`:

  Whether to use host PID

  **Default:** false
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.imagePullSecrets`:

  Name of the secret to use for pulling docker image

  **Default:** []
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers`:

  Pod init containers

  **Default:** []
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.args`:

  Arguments to command

  **Default:** null
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.command`:

  Command to run

  **Default:** null
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.enable`:

  Whether to enable container

  **Default:** true
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.env`:

  Environment variables to set. This can be any value that serializes to
string. If value starts with "secret:<name>:<key>" or
"configMap:<name>:<key>" if references respected secret or config map
values.


  **Default:** {}
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.image`:

  Image to use

  **Default:** "..."
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.imagePullPolicy`:

  When to pull new container image

  **Default:** "Always"
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.limits.cpu`:

  Limit cpu for container

  **Default:** null
  **Example:** "500m"

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.limits.memory`:

  Limit memory for container

  **Default:** null
  **Example:** "128Mi"

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.livenessProbe.enable`:

  Whether to enable probe

  **Default:** false
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.livenessProbe.exec.command`:

  Command to run for check

  **Default:** null
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.livenessProbe.httpGet.path`:

  Http check path

  **Default:** null
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.livenessProbe.httpGet.port`:

  Http check port

  **Default:** 80
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.livenessProbe.initialDelaySeconds`:

  Initial delay before checking

  **Default:** 30
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.livenessProbe.tcpSocket.port`:

  Port to connect to for check

  **Default:** null
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.livenessProbe.timeoutSeconds`:

  Check timeout

  **Default:** 5
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.mounts`:

  Volumes mounted in pod

  **Default:** []
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.mounts.*.mountPath`:

  Mount path of volume

  **Default:** "..."
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.mounts.*.name`:

  Name of the volume

  **Default:** "..."
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.mounts.*.readOnly`:

  Whether to mount read only

  **Default:** false
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.mounts.*.subPath`:

  Sub path to mount

  **Default:** null
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.name`:

  Name of the container

  **Default:** ""
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.ports`:

  Ports exposed by pod

  **Default:** []
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.ports.*.containerPort`:

  Port in container

  **Default:** "..."
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.ports.*.hostPort`:

  Port on the host to bind to

  **Default:** null
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.ports.*.name`:

  Name of the port

  **Default:** null
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.ports.*.port`:

  Port to expose

  **Default:** "..."
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.ports.*.protocol`:

  Protocol to use

  **Default:** "TCP"
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.postStart.command`:

  Command to execute in post start phase

  **Default:** null
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.readinessProbe.enable`:

  Whether to enable probe

  **Default:** false
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.readinessProbe.exec.command`:

  Command to run for check

  **Default:** null
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.readinessProbe.httpGet.path`:

  Http check path

  **Default:** null
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.readinessProbe.httpGet.port`:

  Http check port

  **Default:** 80
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.readinessProbe.initialDelaySeconds`:

  Initial delay before checking

  **Default:** 30
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.readinessProbe.tcpSocket.port`:

  Port to connect to for check

  **Default:** null
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.readinessProbe.timeoutSeconds`:

  Check timeout

  **Default:** 5
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.requests.cpu`:

  Limit cpu for container

  **Default:** null
  **Example:** "500m"

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.requests.memory`:

  Limit memory for container

  **Default:** null
  **Example:** "128Mi"

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.security.capabilities.add`:

  Capabilites to add

  **Default:** []
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.security.privileged`:

  Whether to run container as privileged

  **Default:** false
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.stdin`:

  Whether to enable stdin

  **Default:** false
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.tty`:

  Whether to enable tty

  **Default:** false
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.initContainers.*.workdir`:

  Container working directory

  **Default:** null
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.labels`:

  Pod labels

  **Default:** {}
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.nodeSelector`:

  Node selector where to put pod

  **Default:** {}
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.restartPolicy`:

  Pod restart policy

  **Default:** "Always"
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.securityContext.fsGroup`:

  Container filesystem group id

  **Default:** null
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.securityContext.runAsUser`:

  Run container as user id

  **Default:** null
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.serviceAccountName`:

  Service account name for this resource

  **Default:** null
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.volumes`:

  Pod volumes

  **Default:** {}
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.volumes.<name>.name`:

  Name of the volume

  **Default:** ""
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.volumes.<name>.options`:

  Volume options

  **Default:** {}
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.job.pod.volumes.<name>.type`:

  Volume type

  **Default:** "..."
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.labels`:

  Resource labels

  **Default:** {}
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.name`:

  Name of the resource

  **Default:** ""
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.namespace`:

  Resource namespace

  **Default:** "default"
  **Example:** ...

* `kubernetes.scheduledJobs.<name>.schedule`:

  job schedule

  **Default:** "..."
  **Example:** ...

## jobs options

* `kubernetes.jobs`:

  Attribute set of jobs

  **Default:** {}
  **Example:** ...

* `kubernetes.jobs.<name>.activeDeadlineSeconds`:

  Job restart deadline

  **Default:** null
  **Example:** ...

* `kubernetes.jobs.<name>.annotations`:

  Resource annotation

  **Default:** {}
  **Example:** ...

* `kubernetes.jobs.<name>.dependencies`:

  Resource dependencies

  **Default:** []
  **Example:** ...

* `kubernetes.jobs.<name>.labels`:

  Resource labels

  **Default:** {}
  **Example:** ...

* `kubernetes.jobs.<name>.name`:

  Name of the resource

  **Default:** ""
  **Example:** ...

* `kubernetes.jobs.<name>.namespace`:

  Resource namespace

  **Default:** "default"
  **Example:** ...

* `kubernetes.jobs.<name>.pod.annotations`:

  Pod annotation

  **Default:** {}
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers`:

  Pod containers

  **Default:** "..."
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.args`:

  Arguments to command

  **Default:** null
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.command`:

  Command to run

  **Default:** null
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.enable`:

  Whether to enable container

  **Default:** true
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.env`:

  Environment variables to set. This can be any value that serializes to
string. If value starts with "secret:<name>:<key>" or
"configMap:<name>:<key>" if references respected secret or config map
values.


  **Default:** {}
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.image`:

  Image to use

  **Default:** "..."
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.imagePullPolicy`:

  When to pull new container image

  **Default:** "Always"
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.limits.cpu`:

  Limit cpu for container

  **Default:** null
  **Example:** "500m"

* `kubernetes.jobs.<name>.pod.containers.<name>.limits.memory`:

  Limit memory for container

  **Default:** null
  **Example:** "128Mi"

* `kubernetes.jobs.<name>.pod.containers.<name>.livenessProbe.enable`:

  Whether to enable probe

  **Default:** false
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.livenessProbe.exec.command`:

  Command to run for check

  **Default:** null
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.livenessProbe.httpGet.path`:

  Http check path

  **Default:** null
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.livenessProbe.httpGet.port`:

  Http check port

  **Default:** 80
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.livenessProbe.initialDelaySeconds`:

  Initial delay before checking

  **Default:** 30
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.livenessProbe.tcpSocket.port`:

  Port to connect to for check

  **Default:** null
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.livenessProbe.timeoutSeconds`:

  Check timeout

  **Default:** 5
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.mounts`:

  Volumes mounted in pod

  **Default:** []
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.mounts.*.mountPath`:

  Mount path of volume

  **Default:** "..."
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.mounts.*.name`:

  Name of the volume

  **Default:** "..."
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.mounts.*.readOnly`:

  Whether to mount read only

  **Default:** false
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.mounts.*.subPath`:

  Sub path to mount

  **Default:** null
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.name`:

  Name of the container

  **Default:** ""
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.ports`:

  Ports exposed by pod

  **Default:** []
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.ports.*.containerPort`:

  Port in container

  **Default:** "..."
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.ports.*.hostPort`:

  Port on the host to bind to

  **Default:** null
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.ports.*.name`:

  Name of the port

  **Default:** null
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.ports.*.port`:

  Port to expose

  **Default:** "..."
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.ports.*.protocol`:

  Protocol to use

  **Default:** "TCP"
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.postStart.command`:

  Command to execute in post start phase

  **Default:** null
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.readinessProbe.enable`:

  Whether to enable probe

  **Default:** false
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.readinessProbe.exec.command`:

  Command to run for check

  **Default:** null
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.readinessProbe.httpGet.path`:

  Http check path

  **Default:** null
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.readinessProbe.httpGet.port`:

  Http check port

  **Default:** 80
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.readinessProbe.initialDelaySeconds`:

  Initial delay before checking

  **Default:** 30
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.readinessProbe.tcpSocket.port`:

  Port to connect to for check

  **Default:** null
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.readinessProbe.timeoutSeconds`:

  Check timeout

  **Default:** 5
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.requests.cpu`:

  Limit cpu for container

  **Default:** null
  **Example:** "500m"

* `kubernetes.jobs.<name>.pod.containers.<name>.requests.memory`:

  Limit memory for container

  **Default:** null
  **Example:** "128Mi"

* `kubernetes.jobs.<name>.pod.containers.<name>.security.capabilities.add`:

  Capabilites to add

  **Default:** []
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.security.privileged`:

  Whether to run container as privileged

  **Default:** false
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.stdin`:

  Whether to enable stdin

  **Default:** false
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.tty`:

  Whether to enable tty

  **Default:** false
  **Example:** ...

* `kubernetes.jobs.<name>.pod.containers.<name>.workdir`:

  Container working directory

  **Default:** null
  **Example:** ...

* `kubernetes.jobs.<name>.pod.hostNetwork`:

  Whether to use host networking

  **Default:** false
  **Example:** ...

* `kubernetes.jobs.<name>.pod.hostPID`:

  Whether to use host PID

  **Default:** false
  **Example:** ...

* `kubernetes.jobs.<name>.pod.imagePullSecrets`:

  Name of the secret to use for pulling docker image

  **Default:** []
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers`:

  Pod init containers

  **Default:** []
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.args`:

  Arguments to command

  **Default:** null
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.command`:

  Command to run

  **Default:** null
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.enable`:

  Whether to enable container

  **Default:** true
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.env`:

  Environment variables to set. This can be any value that serializes to
string. If value starts with "secret:<name>:<key>" or
"configMap:<name>:<key>" if references respected secret or config map
values.


  **Default:** {}
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.image`:

  Image to use

  **Default:** "..."
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.imagePullPolicy`:

  When to pull new container image

  **Default:** "Always"
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.limits.cpu`:

  Limit cpu for container

  **Default:** null
  **Example:** "500m"

* `kubernetes.jobs.<name>.pod.initContainers.*.limits.memory`:

  Limit memory for container

  **Default:** null
  **Example:** "128Mi"

* `kubernetes.jobs.<name>.pod.initContainers.*.livenessProbe.enable`:

  Whether to enable probe

  **Default:** false
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.livenessProbe.exec.command`:

  Command to run for check

  **Default:** null
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.livenessProbe.httpGet.path`:

  Http check path

  **Default:** null
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.livenessProbe.httpGet.port`:

  Http check port

  **Default:** 80
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.livenessProbe.initialDelaySeconds`:

  Initial delay before checking

  **Default:** 30
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.livenessProbe.tcpSocket.port`:

  Port to connect to for check

  **Default:** null
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.livenessProbe.timeoutSeconds`:

  Check timeout

  **Default:** 5
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.mounts`:

  Volumes mounted in pod

  **Default:** []
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.mounts.*.mountPath`:

  Mount path of volume

  **Default:** "..."
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.mounts.*.name`:

  Name of the volume

  **Default:** "..."
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.mounts.*.readOnly`:

  Whether to mount read only

  **Default:** false
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.mounts.*.subPath`:

  Sub path to mount

  **Default:** null
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.name`:

  Name of the container

  **Default:** ""
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.ports`:

  Ports exposed by pod

  **Default:** []
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.ports.*.containerPort`:

  Port in container

  **Default:** "..."
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.ports.*.hostPort`:

  Port on the host to bind to

  **Default:** null
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.ports.*.name`:

  Name of the port

  **Default:** null
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.ports.*.port`:

  Port to expose

  **Default:** "..."
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.ports.*.protocol`:

  Protocol to use

  **Default:** "TCP"
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.postStart.command`:

  Command to execute in post start phase

  **Default:** null
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.readinessProbe.enable`:

  Whether to enable probe

  **Default:** false
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.readinessProbe.exec.command`:

  Command to run for check

  **Default:** null
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.readinessProbe.httpGet.path`:

  Http check path

  **Default:** null
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.readinessProbe.httpGet.port`:

  Http check port

  **Default:** 80
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.readinessProbe.initialDelaySeconds`:

  Initial delay before checking

  **Default:** 30
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.readinessProbe.tcpSocket.port`:

  Port to connect to for check

  **Default:** null
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.readinessProbe.timeoutSeconds`:

  Check timeout

  **Default:** 5
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.requests.cpu`:

  Limit cpu for container

  **Default:** null
  **Example:** "500m"

* `kubernetes.jobs.<name>.pod.initContainers.*.requests.memory`:

  Limit memory for container

  **Default:** null
  **Example:** "128Mi"

* `kubernetes.jobs.<name>.pod.initContainers.*.security.capabilities.add`:

  Capabilites to add

  **Default:** []
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.security.privileged`:

  Whether to run container as privileged

  **Default:** false
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.stdin`:

  Whether to enable stdin

  **Default:** false
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.tty`:

  Whether to enable tty

  **Default:** false
  **Example:** ...

* `kubernetes.jobs.<name>.pod.initContainers.*.workdir`:

  Container working directory

  **Default:** null
  **Example:** ...

* `kubernetes.jobs.<name>.pod.labels`:

  Pod labels

  **Default:** {}
  **Example:** ...

* `kubernetes.jobs.<name>.pod.nodeSelector`:

  Node selector where to put pod

  **Default:** {}
  **Example:** ...

* `kubernetes.jobs.<name>.pod.restartPolicy`:

  Pod restart policy

  **Default:** "Always"
  **Example:** ...

* `kubernetes.jobs.<name>.pod.securityContext.fsGroup`:

  Container filesystem group id

  **Default:** null
  **Example:** ...

* `kubernetes.jobs.<name>.pod.securityContext.runAsUser`:

  Run container as user id

  **Default:** null
  **Example:** ...

* `kubernetes.jobs.<name>.pod.serviceAccountName`:

  Service account name for this resource

  **Default:** null
  **Example:** ...

* `kubernetes.jobs.<name>.pod.volumes`:

  Pod volumes

  **Default:** {}
  **Example:** ...

* `kubernetes.jobs.<name>.pod.volumes.<name>.name`:

  Name of the volume

  **Default:** ""
  **Example:** ...

* `kubernetes.jobs.<name>.pod.volumes.<name>.options`:

  Volume options

  **Default:** {}
  **Example:** ...

* `kubernetes.jobs.<name>.pod.volumes.<name>.type`:

  Volume type

  **Default:** "..."
  **Example:** ...

## ingress options

* `kubernetes.ingress`:

  Attribute set of ingress

  **Default:** {}
  **Example:** ...

* `kubernetes.ingress.<name>.annotations`:

  Resource annotation

  **Default:** {}
  **Example:** ...

* `kubernetes.ingress.<name>.dependencies`:

  Resource dependencies

  **Default:** []
  **Example:** ...

* `kubernetes.ingress.<name>.labels`:

  Resource labels

  **Default:** {}
  **Example:** ...

* `kubernetes.ingress.<name>.name`:

  Name of the resource

  **Default:** ""
  **Example:** ...

* `kubernetes.ingress.<name>.namespace`:

  Resource namespace

  **Default:** "default"
  **Example:** ...

* `kubernetes.ingress.<name>.rules`:

  Attribute set of rules

  **Default:** "..."
  **Example:** ...

* `kubernetes.ingress.<name>.rules.<name>.host`:

  Ingress host

  **Default:** "..."
  **Example:** ...

* `kubernetes.ingress.<name>.rules.<name>.http.paths`:

  Attribute set of paths

  **Default:** "..."
  **Example:** ...

* `kubernetes.ingress.<name>.rules.<name>.http.paths.<name>.backend.serviceName`:

  Name of the service to route to

  **Default:** "..."
  **Example:** ...

* `kubernetes.ingress.<name>.rules.<name>.http.paths.<name>.backend.servicePort`:

  Service port to route to

  **Default:** 80
  **Example:** ...

* `kubernetes.ingress.<name>.rules.<name>.http.paths.<name>.path`:

  Path to route

  **Default:** ""
  **Example:** ...

* `kubernetes.ingress.<name>.tls.hosts`:

  List of domains and sub-domains covered by certificate

  **Default:** null
  **Example:** ...

* `kubernetes.ingress.<name>.tls.secretName`:

  Name of the tls secret

  **Default:** null
  **Example:** ...

## secrets options

* `kubernetes.secrets`:

  Attribute set of secrets

  **Default:** {}
  **Example:** ...

* `kubernetes.secrets.<name>.annotations`:

  Resource annotation

  **Default:** {}
  **Example:** ...

* `kubernetes.secrets.<name>.dependencies`:

  Resource dependencies

  **Default:** []
  **Example:** ...

* `kubernetes.secrets.<name>.labels`:

  Resource labels

  **Default:** {}
  **Example:** ...

* `kubernetes.secrets.<name>.name`:

  Name of the resource

  **Default:** ""
  **Example:** ...

* `kubernetes.secrets.<name>.namespace`:

  Resource namespace

  **Default:** "default"
  **Example:** ...

* `kubernetes.secrets.<name>.secrets`:

  Files to include in secret

  **Default:** "..."
  **Example:** ...

* `kubernetes.secrets.<name>.type`:

  Files to include in secret

  **Default:** "Opaque"
  **Example:** ...

## pvc options

* `kubernetes.pvc`:

  Attribute set of persistent volume claims

  **Default:** {}
  **Example:** ...

* `kubernetes.pvc.<name>.accessModes`:

  Requested acces modes

  **Default:** ["ReadWriteOnce"]
  **Example:** ...

* `kubernetes.pvc.<name>.annotations`:

  Resource annotation

  **Default:** {}
  **Example:** ...

* `kubernetes.pvc.<name>.dependencies`:

  Resource dependencies

  **Default:** []
  **Example:** ...

* `kubernetes.pvc.<name>.labels`:

  Resource labels

  **Default:** {}
  **Example:** ...

* `kubernetes.pvc.<name>.name`:

  Name of the resource

  **Default:** ""
  **Example:** ...

* `kubernetes.pvc.<name>.namespace`:

  Resource namespace

  **Default:** "default"
  **Example:** ...

* `kubernetes.pvc.<name>.size`:

  Size of storage requested by persistent volume claim

  **Default:** "1G"
  **Example:** "10G"

## roles options

* `kubernetes.roles`:

  Attribute set of role definitions

  **Default:** {}
  **Example:** ...

* `kubernetes.roles.<name>.annotations`:

  Resource annotation

  **Default:** {}
  **Example:** ...

* `kubernetes.roles.<name>.dependencies`:

  Resource dependencies

  **Default:** []
  **Example:** ...

* `kubernetes.roles.<name>.labels`:

  Resource labels

  **Default:** {}
  **Example:** ...

* `kubernetes.roles.<name>.name`:

  Name of the resource

  **Default:** ""
  **Example:** ...

* `kubernetes.roles.<name>.namespace`:

  Resource namespace

  **Default:** "default"
  **Example:** ...

* `kubernetes.roles.<name>.rules`:

  List of role rules

  **Default:** []
  **Example:** ...

* `kubernetes.roles.<name>.rules.*.apiGroups`:

  Matches list of API groups

  **Default:** null
  **Example:** ...

* `kubernetes.roles.<name>.rules.*.nonResourceURLs`:

  matches the non-resource request paths (like
            /version and /apis)

  **Default:** null
  **Example:** ...

* `kubernetes.roles.<name>.rules.*.resources`:

  Matches list of resources that role allows

  **Default:** null
  **Example:** ...

* `kubernetes.roles.<name>.rules.*.verbs`:

  Matches list of verbs that role allows

  **Default:** null
  **Example:** ...

## clusterRoles options

* `kubernetes.clusterRoles`:

  Attribute set of cluster role definitions

  **Default:** {}
  **Example:** ...

* `kubernetes.clusterRoles.<name>.annotations`:

  Resource annotation

  **Default:** {}
  **Example:** ...

* `kubernetes.clusterRoles.<name>.dependencies`:

  Resource dependencies

  **Default:** []
  **Example:** ...

* `kubernetes.clusterRoles.<name>.labels`:

  Resource labels

  **Default:** {}
  **Example:** ...

* `kubernetes.clusterRoles.<name>.name`:

  Name of the resource

  **Default:** ""
  **Example:** ...

* `kubernetes.clusterRoles.<name>.namespace`:

  Resource namespace

  **Default:** "default"
  **Example:** ...

* `kubernetes.clusterRoles.<name>.rules`:

  List of role rules

  **Default:** []
  **Example:** ...

* `kubernetes.clusterRoles.<name>.rules.*.apiGroups`:

  Matches list of API groups

  **Default:** null
  **Example:** ...

* `kubernetes.clusterRoles.<name>.rules.*.nonResourceURLs`:

  matches the non-resource request paths (like
            /version and /apis)

  **Default:** null
  **Example:** ...

* `kubernetes.clusterRoles.<name>.rules.*.resources`:

  Matches list of resources that role allows

  **Default:** null
  **Example:** ...

* `kubernetes.clusterRoles.<name>.rules.*.verbs`:

  Matches list of verbs that role allows

  **Default:** null
  **Example:** ...

## roleBindings options

* `kubernetes.roleBindings`:

  Attribute set of role binding definitions

  **Default:** {}
  **Example:** ...

* `kubernetes.roleBindings.<name>.annotations`:

  Resource annotation

  **Default:** {}
  **Example:** ...

* `kubernetes.roleBindings.<name>.dependencies`:

  Resource dependencies

  **Default:** []
  **Example:** ...

* `kubernetes.roleBindings.<name>.labels`:

  Resource labels

  **Default:** {}
  **Example:** ...

* `kubernetes.roleBindings.<name>.name`:

  Name of the resource

  **Default:** ""
  **Example:** ...

* `kubernetes.roleBindings.<name>.namespace`:

  Resource namespace

  **Default:** "default"
  **Example:** ...

* `kubernetes.roleBindings.<name>.roleRef.apiGroup`:

  API group to use

  **Default:** "rbac.authorization.k8s.io"
  **Example:** ...

* `kubernetes.roleBindings.<name>.roleRef.kind`:

  Kind of the role binding references

  **Default:** "Role"
  **Example:** ...

* `kubernetes.roleBindings.<name>.roleRef.name`:

  Name of the referenced role

  **Default:** "..."
  **Example:** ...

* `kubernetes.roleBindings.<name>.subjects`:

  Subjects that cluster role applies to

  **Default:** []
  **Example:** ...

* `kubernetes.roleBindings.<name>.subjects.*.kind`:

  To what kind of entities binding applies

  **Default:** "User"
  **Example:** ...

* `kubernetes.roleBindings.<name>.subjects.*.name`:

  Name of the entity binding applies

  **Default:** "..."
  **Example:** ...

* `kubernetes.roleBindings.<name>.subjects.*.namespace`:

  Namespace of the subject

  **Default:** null
  **Example:** ...

## clusterRoleBindings options

* `kubernetes.clusterRoleBindings`:

  Attribute set of cluster role binding definitions

  **Default:** {}
  **Example:** ...

* `kubernetes.clusterRoleBindings.<name>.annotations`:

  Resource annotation

  **Default:** {}
  **Example:** ...

* `kubernetes.clusterRoleBindings.<name>.dependencies`:

  Resource dependencies

  **Default:** []
  **Example:** ...

* `kubernetes.clusterRoleBindings.<name>.labels`:

  Resource labels

  **Default:** {}
  **Example:** ...

* `kubernetes.clusterRoleBindings.<name>.name`:

  Name of the resource

  **Default:** ""
  **Example:** ...

* `kubernetes.clusterRoleBindings.<name>.namespace`:

  Resource namespace

  **Default:** "default"
  **Example:** ...

* `kubernetes.clusterRoleBindings.<name>.roleRef.apiGroup`:

  API group to use

  **Default:** "rbac.authorization.k8s.io"
  **Example:** ...

* `kubernetes.clusterRoleBindings.<name>.roleRef.kind`:

  Kind of the role binding references

  **Default:** "Role"
  **Example:** ...

* `kubernetes.clusterRoleBindings.<name>.roleRef.name`:

  Name of the referenced role

  **Default:** "..."
  **Example:** ...

* `kubernetes.clusterRoleBindings.<name>.subjects`:

  Subjects that cluster role applies to

  **Default:** []
  **Example:** ...

* `kubernetes.clusterRoleBindings.<name>.subjects.*.kind`:

  To what kind of entities binding applies

  **Default:** "User"
  **Example:** ...

* `kubernetes.clusterRoleBindings.<name>.subjects.*.name`:

  Name of the entity binding applies

  **Default:** "..."
  **Example:** ...

* `kubernetes.clusterRoleBindings.<name>.subjects.*.namespace`:

  Namespace of the subject

  **Default:** null
  **Example:** ...

## serviceAccounts options

* `kubernetes.serviceAccounts`:

  Attribute set of service account definitions

  **Default:** {}
  **Example:** ...

* `kubernetes.serviceAccounts.<name>.annotations`:

  Resource annotation

  **Default:** {}
  **Example:** ...

* `kubernetes.serviceAccounts.<name>.dependencies`:

  Resource dependencies

  **Default:** []
  **Example:** ...

* `kubernetes.serviceAccounts.<name>.labels`:

  Resource labels

  **Default:** {}
  **Example:** ...

* `kubernetes.serviceAccounts.<name>.name`:

  Name of the resource

  **Default:** ""
  **Example:** ...

* `kubernetes.serviceAccounts.<name>.namespace`:

  Resource namespace

  **Default:** "default"
  **Example:** ...

## configMaps options

* `kubernetes.configMaps`:

  Attribute set of config map definitions

  **Default:** {}
  **Example:** ...

* `kubernetes.configMaps.<name>.annotations`:

  Resource annotation

  **Default:** {}
  **Example:** ...

* `kubernetes.configMaps.<name>.data`:

  Configmap data

  **Default:** {}
  **Example:** ...

* `kubernetes.configMaps.<name>.dependencies`:

  Resource dependencies

  **Default:** []
  **Example:** ...

* `kubernetes.configMaps.<name>.labels`:

  Resource labels

  **Default:** {}
  **Example:** ...

* `kubernetes.configMaps.<name>.name`:

  Name of the resource

  **Default:** ""
  **Example:** ...

* `kubernetes.configMaps.<name>.namespace`:

  Resource namespace

  **Default:** "default"
  **Example:** ...

## petSets options

* `kubernetes.petSets`:

  Attribute set of petset definitions

  **Default:** {}
  **Example:** ...

* `kubernetes.petSets.<name>.annotations`:

  Resource annotation

  **Default:** {}
  **Example:** ...

* `kubernetes.petSets.<name>.dependencies`:

  Resource dependencies

  **Default:** []
  **Example:** ...

* `kubernetes.petSets.<name>.enable`:

  Whether to enable stateful set

  **Default:** false
  **Example:** ...

* `kubernetes.petSets.<name>.labels`:

  Resource labels

  **Default:** {}
  **Example:** ...

* `kubernetes.petSets.<name>.name`:

  Name of the resource

  **Default:** ""
  **Example:** ...

* `kubernetes.petSets.<name>.namespace`:

  Resource namespace

  **Default:** "default"
  **Example:** ...

* `kubernetes.petSets.<name>.pod.annotations`:

  Pod annotation

  **Default:** {}
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers`:

  Pod containers

  **Default:** "..."
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.args`:

  Arguments to command

  **Default:** null
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.command`:

  Command to run

  **Default:** null
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.enable`:

  Whether to enable container

  **Default:** true
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.env`:

  Environment variables to set. This can be any value that serializes to
string. If value starts with "secret:<name>:<key>" or
"configMap:<name>:<key>" if references respected secret or config map
values.


  **Default:** {}
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.image`:

  Image to use

  **Default:** "..."
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.imagePullPolicy`:

  When to pull new container image

  **Default:** "Always"
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.limits.cpu`:

  Limit cpu for container

  **Default:** null
  **Example:** "500m"

* `kubernetes.petSets.<name>.pod.containers.<name>.limits.memory`:

  Limit memory for container

  **Default:** null
  **Example:** "128Mi"

* `kubernetes.petSets.<name>.pod.containers.<name>.livenessProbe.enable`:

  Whether to enable probe

  **Default:** false
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.livenessProbe.exec.command`:

  Command to run for check

  **Default:** null
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.livenessProbe.httpGet.path`:

  Http check path

  **Default:** null
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.livenessProbe.httpGet.port`:

  Http check port

  **Default:** 80
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.livenessProbe.initialDelaySeconds`:

  Initial delay before checking

  **Default:** 30
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.livenessProbe.tcpSocket.port`:

  Port to connect to for check

  **Default:** null
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.livenessProbe.timeoutSeconds`:

  Check timeout

  **Default:** 5
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.mounts`:

  Volumes mounted in pod

  **Default:** []
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.mounts.*.mountPath`:

  Mount path of volume

  **Default:** "..."
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.mounts.*.name`:

  Name of the volume

  **Default:** "..."
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.mounts.*.readOnly`:

  Whether to mount read only

  **Default:** false
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.mounts.*.subPath`:

  Sub path to mount

  **Default:** null
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.name`:

  Name of the container

  **Default:** ""
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.ports`:

  Ports exposed by pod

  **Default:** []
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.ports.*.containerPort`:

  Port in container

  **Default:** "..."
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.ports.*.hostPort`:

  Port on the host to bind to

  **Default:** null
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.ports.*.name`:

  Name of the port

  **Default:** null
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.ports.*.port`:

  Port to expose

  **Default:** "..."
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.ports.*.protocol`:

  Protocol to use

  **Default:** "TCP"
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.postStart.command`:

  Command to execute in post start phase

  **Default:** null
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.readinessProbe.enable`:

  Whether to enable probe

  **Default:** false
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.readinessProbe.exec.command`:

  Command to run for check

  **Default:** null
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.readinessProbe.httpGet.path`:

  Http check path

  **Default:** null
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.readinessProbe.httpGet.port`:

  Http check port

  **Default:** 80
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.readinessProbe.initialDelaySeconds`:

  Initial delay before checking

  **Default:** 30
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.readinessProbe.tcpSocket.port`:

  Port to connect to for check

  **Default:** null
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.readinessProbe.timeoutSeconds`:

  Check timeout

  **Default:** 5
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.requests.cpu`:

  Limit cpu for container

  **Default:** null
  **Example:** "500m"

* `kubernetes.petSets.<name>.pod.containers.<name>.requests.memory`:

  Limit memory for container

  **Default:** null
  **Example:** "128Mi"

* `kubernetes.petSets.<name>.pod.containers.<name>.security.capabilities.add`:

  Capabilites to add

  **Default:** []
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.security.privileged`:

  Whether to run container as privileged

  **Default:** false
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.stdin`:

  Whether to enable stdin

  **Default:** false
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.tty`:

  Whether to enable tty

  **Default:** false
  **Example:** ...

* `kubernetes.petSets.<name>.pod.containers.<name>.workdir`:

  Container working directory

  **Default:** null
  **Example:** ...

* `kubernetes.petSets.<name>.pod.hostNetwork`:

  Whether to use host networking

  **Default:** false
  **Example:** ...

* `kubernetes.petSets.<name>.pod.hostPID`:

  Whether to use host PID

  **Default:** false
  **Example:** ...

* `kubernetes.petSets.<name>.pod.imagePullSecrets`:

  Name of the secret to use for pulling docker image

  **Default:** []
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers`:

  Pod init containers

  **Default:** []
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.args`:

  Arguments to command

  **Default:** null
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.command`:

  Command to run

  **Default:** null
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.enable`:

  Whether to enable container

  **Default:** true
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.env`:

  Environment variables to set. This can be any value that serializes to
string. If value starts with "secret:<name>:<key>" or
"configMap:<name>:<key>" if references respected secret or config map
values.


  **Default:** {}
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.image`:

  Image to use

  **Default:** "..."
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.imagePullPolicy`:

  When to pull new container image

  **Default:** "Always"
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.limits.cpu`:

  Limit cpu for container

  **Default:** null
  **Example:** "500m"

* `kubernetes.petSets.<name>.pod.initContainers.*.limits.memory`:

  Limit memory for container

  **Default:** null
  **Example:** "128Mi"

* `kubernetes.petSets.<name>.pod.initContainers.*.livenessProbe.enable`:

  Whether to enable probe

  **Default:** false
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.livenessProbe.exec.command`:

  Command to run for check

  **Default:** null
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.livenessProbe.httpGet.path`:

  Http check path

  **Default:** null
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.livenessProbe.httpGet.port`:

  Http check port

  **Default:** 80
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.livenessProbe.initialDelaySeconds`:

  Initial delay before checking

  **Default:** 30
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.livenessProbe.tcpSocket.port`:

  Port to connect to for check

  **Default:** null
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.livenessProbe.timeoutSeconds`:

  Check timeout

  **Default:** 5
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.mounts`:

  Volumes mounted in pod

  **Default:** []
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.mounts.*.mountPath`:

  Mount path of volume

  **Default:** "..."
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.mounts.*.name`:

  Name of the volume

  **Default:** "..."
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.mounts.*.readOnly`:

  Whether to mount read only

  **Default:** false
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.mounts.*.subPath`:

  Sub path to mount

  **Default:** null
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.name`:

  Name of the container

  **Default:** ""
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.ports`:

  Ports exposed by pod

  **Default:** []
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.ports.*.containerPort`:

  Port in container

  **Default:** "..."
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.ports.*.hostPort`:

  Port on the host to bind to

  **Default:** null
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.ports.*.name`:

  Name of the port

  **Default:** null
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.ports.*.port`:

  Port to expose

  **Default:** "..."
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.ports.*.protocol`:

  Protocol to use

  **Default:** "TCP"
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.postStart.command`:

  Command to execute in post start phase

  **Default:** null
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.readinessProbe.enable`:

  Whether to enable probe

  **Default:** false
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.readinessProbe.exec.command`:

  Command to run for check

  **Default:** null
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.readinessProbe.httpGet.path`:

  Http check path

  **Default:** null
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.readinessProbe.httpGet.port`:

  Http check port

  **Default:** 80
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.readinessProbe.initialDelaySeconds`:

  Initial delay before checking

  **Default:** 30
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.readinessProbe.tcpSocket.port`:

  Port to connect to for check

  **Default:** null
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.readinessProbe.timeoutSeconds`:

  Check timeout

  **Default:** 5
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.requests.cpu`:

  Limit cpu for container

  **Default:** null
  **Example:** "500m"

* `kubernetes.petSets.<name>.pod.initContainers.*.requests.memory`:

  Limit memory for container

  **Default:** null
  **Example:** "128Mi"

* `kubernetes.petSets.<name>.pod.initContainers.*.security.capabilities.add`:

  Capabilites to add

  **Default:** []
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.security.privileged`:

  Whether to run container as privileged

  **Default:** false
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.stdin`:

  Whether to enable stdin

  **Default:** false
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.tty`:

  Whether to enable tty

  **Default:** false
  **Example:** ...

* `kubernetes.petSets.<name>.pod.initContainers.*.workdir`:

  Container working directory

  **Default:** null
  **Example:** ...

* `kubernetes.petSets.<name>.pod.labels`:

  Pod labels

  **Default:** {}
  **Example:** ...

* `kubernetes.petSets.<name>.pod.nodeSelector`:

  Node selector where to put pod

  **Default:** {}
  **Example:** ...

* `kubernetes.petSets.<name>.pod.restartPolicy`:

  Pod restart policy

  **Default:** "Always"
  **Example:** ...

* `kubernetes.petSets.<name>.pod.securityContext.fsGroup`:

  Container filesystem group id

  **Default:** null
  **Example:** ...

* `kubernetes.petSets.<name>.pod.securityContext.runAsUser`:

  Run container as user id

  **Default:** null
  **Example:** ...

* `kubernetes.petSets.<name>.pod.serviceAccountName`:

  Service account name for this resource

  **Default:** null
  **Example:** ...

* `kubernetes.petSets.<name>.pod.volumes`:

  Pod volumes

  **Default:** {}
  **Example:** ...

* `kubernetes.petSets.<name>.pod.volumes.<name>.name`:

  Name of the volume

  **Default:** ""
  **Example:** ...

* `kubernetes.petSets.<name>.pod.volumes.<name>.options`:

  Volume options

  **Default:** {}
  **Example:** ...

* `kubernetes.petSets.<name>.pod.volumes.<name>.type`:

  Volume type

  **Default:** "..."
  **Example:** ...

* `kubernetes.petSets.<name>.replicas`:

  Number of stateful set replicas to run

  **Default:** 1
  **Example:** ...

* `kubernetes.petSets.<name>.serviceName`:

  Name of the governing stateful set service

  **Default:** ""
  **Example:** ...

* `kubernetes.petSets.<name>.terminationGracePeriodSeconds`:

  Number of seconds to wait for termination

  **Default:** null
  **Example:** ...

* `kubernetes.petSets.<name>.volumeClaimTemplates`:

  Volume claim templates

  **Default:** {}
  **Example:** ...

* `kubernetes.petSets.<name>.volumeClaimTemplates.<name>.accessModes`:

  Requested acces modes

  **Default:** ["ReadWriteOnce"]
  **Example:** ...

* `kubernetes.petSets.<name>.volumeClaimTemplates.<name>.annotations`:

  Resource annotation

  **Default:** {}
  **Example:** ...

* `kubernetes.petSets.<name>.volumeClaimTemplates.<name>.dependencies`:

  Resource dependencies

  **Default:** []
  **Example:** ...

* `kubernetes.petSets.<name>.volumeClaimTemplates.<name>.labels`:

  Resource labels

  **Default:** {}
  **Example:** ...

* `kubernetes.petSets.<name>.volumeClaimTemplates.<name>.name`:

  Name of the resource

  **Default:** ""
  **Example:** ...

* `kubernetes.petSets.<name>.volumeClaimTemplates.<name>.namespace`:

  Resource namespace

  **Default:** "default"
  **Example:** ...

* `kubernetes.petSets.<name>.volumeClaimTemplates.<name>.size`:

  Size of storage requested by persistent volume claim

  **Default:** "1G"
  **Example:** "10G"

## statefulSets options

* `kubernetes.statefulSets`:

  Attribute set of stateful set definitions

  **Default:** {}
  **Example:** ...

* `kubernetes.statefulSets.<name>.annotations`:

  Resource annotation

  **Default:** {}
  **Example:** ...

* `kubernetes.statefulSets.<name>.dependencies`:

  Resource dependencies

  **Default:** []
  **Example:** ...

* `kubernetes.statefulSets.<name>.enable`:

  Whether to enable stateful set

  **Default:** false
  **Example:** ...

* `kubernetes.statefulSets.<name>.labels`:

  Resource labels

  **Default:** {}
  **Example:** ...

* `kubernetes.statefulSets.<name>.name`:

  Name of the resource

  **Default:** ""
  **Example:** ...

* `kubernetes.statefulSets.<name>.namespace`:

  Resource namespace

  **Default:** "default"
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.annotations`:

  Pod annotation

  **Default:** {}
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers`:

  Pod containers

  **Default:** "..."
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.args`:

  Arguments to command

  **Default:** null
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.command`:

  Command to run

  **Default:** null
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.enable`:

  Whether to enable container

  **Default:** true
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.env`:

  Environment variables to set. This can be any value that serializes to
string. If value starts with "secret:<name>:<key>" or
"configMap:<name>:<key>" if references respected secret or config map
values.


  **Default:** {}
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.image`:

  Image to use

  **Default:** "..."
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.imagePullPolicy`:

  When to pull new container image

  **Default:** "Always"
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.limits.cpu`:

  Limit cpu for container

  **Default:** null
  **Example:** "500m"

* `kubernetes.statefulSets.<name>.pod.containers.<name>.limits.memory`:

  Limit memory for container

  **Default:** null
  **Example:** "128Mi"

* `kubernetes.statefulSets.<name>.pod.containers.<name>.livenessProbe.enable`:

  Whether to enable probe

  **Default:** false
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.livenessProbe.exec.command`:

  Command to run for check

  **Default:** null
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.livenessProbe.httpGet.path`:

  Http check path

  **Default:** null
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.livenessProbe.httpGet.port`:

  Http check port

  **Default:** 80
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.livenessProbe.initialDelaySeconds`:

  Initial delay before checking

  **Default:** 30
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.livenessProbe.tcpSocket.port`:

  Port to connect to for check

  **Default:** null
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.livenessProbe.timeoutSeconds`:

  Check timeout

  **Default:** 5
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.mounts`:

  Volumes mounted in pod

  **Default:** []
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.mounts.*.mountPath`:

  Mount path of volume

  **Default:** "..."
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.mounts.*.name`:

  Name of the volume

  **Default:** "..."
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.mounts.*.readOnly`:

  Whether to mount read only

  **Default:** false
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.mounts.*.subPath`:

  Sub path to mount

  **Default:** null
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.name`:

  Name of the container

  **Default:** ""
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.ports`:

  Ports exposed by pod

  **Default:** []
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.ports.*.containerPort`:

  Port in container

  **Default:** "..."
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.ports.*.hostPort`:

  Port on the host to bind to

  **Default:** null
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.ports.*.name`:

  Name of the port

  **Default:** null
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.ports.*.port`:

  Port to expose

  **Default:** "..."
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.ports.*.protocol`:

  Protocol to use

  **Default:** "TCP"
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.postStart.command`:

  Command to execute in post start phase

  **Default:** null
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.readinessProbe.enable`:

  Whether to enable probe

  **Default:** false
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.readinessProbe.exec.command`:

  Command to run for check

  **Default:** null
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.readinessProbe.httpGet.path`:

  Http check path

  **Default:** null
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.readinessProbe.httpGet.port`:

  Http check port

  **Default:** 80
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.readinessProbe.initialDelaySeconds`:

  Initial delay before checking

  **Default:** 30
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.readinessProbe.tcpSocket.port`:

  Port to connect to for check

  **Default:** null
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.readinessProbe.timeoutSeconds`:

  Check timeout

  **Default:** 5
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.requests.cpu`:

  Limit cpu for container

  **Default:** null
  **Example:** "500m"

* `kubernetes.statefulSets.<name>.pod.containers.<name>.requests.memory`:

  Limit memory for container

  **Default:** null
  **Example:** "128Mi"

* `kubernetes.statefulSets.<name>.pod.containers.<name>.security.capabilities.add`:

  Capabilites to add

  **Default:** []
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.security.privileged`:

  Whether to run container as privileged

  **Default:** false
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.stdin`:

  Whether to enable stdin

  **Default:** false
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.tty`:

  Whether to enable tty

  **Default:** false
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.containers.<name>.workdir`:

  Container working directory

  **Default:** null
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.hostNetwork`:

  Whether to use host networking

  **Default:** false
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.hostPID`:

  Whether to use host PID

  **Default:** false
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.imagePullSecrets`:

  Name of the secret to use for pulling docker image

  **Default:** []
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers`:

  Pod init containers

  **Default:** []
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.args`:

  Arguments to command

  **Default:** null
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.command`:

  Command to run

  **Default:** null
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.enable`:

  Whether to enable container

  **Default:** true
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.env`:

  Environment variables to set. This can be any value that serializes to
string. If value starts with "secret:<name>:<key>" or
"configMap:<name>:<key>" if references respected secret or config map
values.


  **Default:** {}
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.image`:

  Image to use

  **Default:** "..."
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.imagePullPolicy`:

  When to pull new container image

  **Default:** "Always"
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.limits.cpu`:

  Limit cpu for container

  **Default:** null
  **Example:** "500m"

* `kubernetes.statefulSets.<name>.pod.initContainers.*.limits.memory`:

  Limit memory for container

  **Default:** null
  **Example:** "128Mi"

* `kubernetes.statefulSets.<name>.pod.initContainers.*.livenessProbe.enable`:

  Whether to enable probe

  **Default:** false
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.livenessProbe.exec.command`:

  Command to run for check

  **Default:** null
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.livenessProbe.httpGet.path`:

  Http check path

  **Default:** null
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.livenessProbe.httpGet.port`:

  Http check port

  **Default:** 80
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.livenessProbe.initialDelaySeconds`:

  Initial delay before checking

  **Default:** 30
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.livenessProbe.tcpSocket.port`:

  Port to connect to for check

  **Default:** null
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.livenessProbe.timeoutSeconds`:

  Check timeout

  **Default:** 5
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.mounts`:

  Volumes mounted in pod

  **Default:** []
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.mounts.*.mountPath`:

  Mount path of volume

  **Default:** "..."
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.mounts.*.name`:

  Name of the volume

  **Default:** "..."
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.mounts.*.readOnly`:

  Whether to mount read only

  **Default:** false
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.mounts.*.subPath`:

  Sub path to mount

  **Default:** null
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.name`:

  Name of the container

  **Default:** ""
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.ports`:

  Ports exposed by pod

  **Default:** []
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.ports.*.containerPort`:

  Port in container

  **Default:** "..."
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.ports.*.hostPort`:

  Port on the host to bind to

  **Default:** null
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.ports.*.name`:

  Name of the port

  **Default:** null
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.ports.*.port`:

  Port to expose

  **Default:** "..."
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.ports.*.protocol`:

  Protocol to use

  **Default:** "TCP"
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.postStart.command`:

  Command to execute in post start phase

  **Default:** null
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.readinessProbe.enable`:

  Whether to enable probe

  **Default:** false
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.readinessProbe.exec.command`:

  Command to run for check

  **Default:** null
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.readinessProbe.httpGet.path`:

  Http check path

  **Default:** null
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.readinessProbe.httpGet.port`:

  Http check port

  **Default:** 80
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.readinessProbe.initialDelaySeconds`:

  Initial delay before checking

  **Default:** 30
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.readinessProbe.tcpSocket.port`:

  Port to connect to for check

  **Default:** null
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.readinessProbe.timeoutSeconds`:

  Check timeout

  **Default:** 5
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.requests.cpu`:

  Limit cpu for container

  **Default:** null
  **Example:** "500m"

* `kubernetes.statefulSets.<name>.pod.initContainers.*.requests.memory`:

  Limit memory for container

  **Default:** null
  **Example:** "128Mi"

* `kubernetes.statefulSets.<name>.pod.initContainers.*.security.capabilities.add`:

  Capabilites to add

  **Default:** []
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.security.privileged`:

  Whether to run container as privileged

  **Default:** false
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.stdin`:

  Whether to enable stdin

  **Default:** false
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.tty`:

  Whether to enable tty

  **Default:** false
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.initContainers.*.workdir`:

  Container working directory

  **Default:** null
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.labels`:

  Pod labels

  **Default:** {}
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.nodeSelector`:

  Node selector where to put pod

  **Default:** {}
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.restartPolicy`:

  Pod restart policy

  **Default:** "Always"
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.securityContext.fsGroup`:

  Container filesystem group id

  **Default:** null
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.securityContext.runAsUser`:

  Run container as user id

  **Default:** null
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.serviceAccountName`:

  Service account name for this resource

  **Default:** null
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.volumes`:

  Pod volumes

  **Default:** {}
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.volumes.<name>.name`:

  Name of the volume

  **Default:** ""
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.volumes.<name>.options`:

  Volume options

  **Default:** {}
  **Example:** ...

* `kubernetes.statefulSets.<name>.pod.volumes.<name>.type`:

  Volume type

  **Default:** "..."
  **Example:** ...

* `kubernetes.statefulSets.<name>.replicas`:

  Number of stateful set replicas to run

  **Default:** 1
  **Example:** ...

* `kubernetes.statefulSets.<name>.serviceName`:

  Name of the governing stateful set service

  **Default:** ""
  **Example:** ...

* `kubernetes.statefulSets.<name>.terminationGracePeriodSeconds`:

  Number of seconds to wait for termination

  **Default:** null
  **Example:** ...

* `kubernetes.statefulSets.<name>.volumeClaimTemplates`:

  Volume claim templates

  **Default:** {}
  **Example:** ...

* `kubernetes.statefulSets.<name>.volumeClaimTemplates.<name>.accessModes`:

  Requested acces modes

  **Default:** ["ReadWriteOnce"]
  **Example:** ...

* `kubernetes.statefulSets.<name>.volumeClaimTemplates.<name>.annotations`:

  Resource annotation

  **Default:** {}
  **Example:** ...

* `kubernetes.statefulSets.<name>.volumeClaimTemplates.<name>.dependencies`:

  Resource dependencies

  **Default:** []
  **Example:** ...

* `kubernetes.statefulSets.<name>.volumeClaimTemplates.<name>.labels`:

  Resource labels

  **Default:** {}
  **Example:** ...

* `kubernetes.statefulSets.<name>.volumeClaimTemplates.<name>.name`:

  Name of the resource

  **Default:** ""
  **Example:** ...

* `kubernetes.statefulSets.<name>.volumeClaimTemplates.<name>.namespace`:

  Resource namespace

  **Default:** "default"
  **Example:** ...

* `kubernetes.statefulSets.<name>.volumeClaimTemplates.<name>.size`:

  Size of storage requested by persistent volume claim

  **Default:** "1G"
  **Example:** "10G"

## networkPolicies options

* `kubernetes.networkPolicies`:

  Attribute set of network policy definitions

  **Default:** {}
  **Example:** ...

* `kubernetes.networkPolicies.<name>.annotations`:

  Resource annotation

  **Default:** {}
  **Example:** ...

* `kubernetes.networkPolicies.<name>.dependencies`:

  Resource dependencies

  **Default:** []
  **Example:** ...

* `kubernetes.networkPolicies.<name>.ingress`:

  Ingress rules

  **Default:** "..."
  **Example:** ...

* `kubernetes.networkPolicies.<name>.ingress.<name>.namespaceSelector.matchLabels`:

  Matches all pods in namespaces matched by this selector

  **Default:** null
  **Example:** ...

* `kubernetes.networkPolicies.<name>.ingress.<name>.podSelector.matchLabels`:

  Label selector which selects pods in this namespace

  **Default:** {"name":""}
  **Example:** ...

* `kubernetes.networkPolicies.<name>.ingress.<name>.ports`:

  List of ports which should be made accessible on the pods selected for this rule.

  **Default:** []
  **Example:** ...

* `kubernetes.networkPolicies.<name>.labels`:

  Resource labels

  **Default:** {}
  **Example:** ...

* `kubernetes.networkPolicies.<name>.name`:

  Name of the resource

  **Default:** ""
  **Example:** ...

* `kubernetes.networkPolicies.<name>.namespace`:

  Resource namespace

  **Default:** "default"
  **Example:** ...

* `kubernetes.networkPolicies.<name>.podSelector.matchLabels`:

  Match pod with labels

  **Default:** {}
  **Example:** ...

## customResources options

* `kubernetes.customResources`:

  Attribute set of custom resources

  **Default:** {}
  **Example:** ...

* `kubernetes.customResources.<name>.<name>.annotations`:

  Resource annotation

  **Default:** {}
  **Example:** ...

* `kubernetes.customResources.<name>.<name>.apiVersion`:

  Api version of the resource

  **Default:** "..."
  **Example:** ...

* `kubernetes.customResources.<name>.<name>.dependencies`:

  Resource dependencies

  **Default:** []
  **Example:** ...

* `kubernetes.customResources.<name>.<name>.extra`:

  Attribute set of custom resource

  **Default:** {}
  **Example:** ...

* `kubernetes.customResources.<name>.<name>.kind`:

  Kind of the resource

  **Default:** "..."
  **Example:** ...

* `kubernetes.customResources.<name>.<name>.labels`:

  Resource labels

  **Default:** {}
  **Example:** ...

* `kubernetes.customResources.<name>.<name>.name`:

  Name of the resource

  **Default:** ""
  **Example:** ...

## defaults options

* `kubernetes.defaults.allPods`:

  Default config applied to all pods

  **Default:** {}
  **Example:** ...

* `kubernetes.defaults.daemons`:

  Default config applied to daemons

  **Default:** {"pod":{}}
  **Example:** ...

* `kubernetes.defaults.deployments`:

  Default config applied to deployments

  **Default:** {"pod":{}}
  **Example:** ...

* `kubernetes.defaults.jobs`:

  Default config applied to jobs

  **Default:** {"pod":{}}
  **Example:** ...

* `kubernetes.defaults.pods`:

  Default config applied to pods

  **Default:** {}
  **Example:** ...

* `kubernetes.defaults.pvc`:

  Default config applied to persistent volume claims

  **Default:** {}
  **Example:** ...

* `kubernetes.defaults.replicationcontrollers`:

  Default config applied to replication controllers

  **Default:** {"pod":{}}
  **Example:** ...
