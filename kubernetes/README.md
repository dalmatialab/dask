# Dask

This repo contains Dask Helm chart for deploying on Kubernetes.

## Installation

Nodes where Dask worker components needs to be deployed must be labeled. To label node use:

    $ kubectl label nodes node-list daskworker=true

Where:

 - `node-list` are nodes to label

To disable node selector just set `nodeselector` for worker in `values.yaml` to `{}`.  

Before installation fill `values.yaml` and to install Helm chart run:

    $ helm install some-chart-name --namespace=some-namespace-name --create-namespace path-to-chart-directory

Where:

- `some-chart-name` is Helm chart name
- `some-namespace-name` is optional argument that defines Kubernetes and Helm namespace where chart will be installed
- `path-to-chart-directory` is chart directory

## Values

Possible values to configure inside `values.yaml` are: 

 - `image/name` - defines Dask image name
 - `image/tag` - defines Dask image tag
 - `serviceName` - defines Kubernetes service name for component
 - `replicas` - defines number of Pods (integer)
 - `nodeSelector` - defines node selector
 - `nodePort` - defines service port where service can be accessed outside cluster
 - `env` - defines environment variables for component
 - `resources/requests` - defines component minimum resources per one replica
 - `mounts` - defines volumes and volumeMounts for component accourding to Kubernetes documentation
 - `portDashboard` - defines worker dashboard port

**NOTE** It is recommended to mount one shared directory for workers because all workers must have access to external files you use (e.g reading csv file into dask dataframe). Nodeport in `scheduler/webui` section defines nodeport for scheduler web user-interface.

## Uninstallation

To full uninstall run:

    $ helm del some-chart-name -n some-namespace-name

Where:

- `some-chart-name` is Helm chart name for uninstall.
- `some-namespace-name` is optional argument that defines Helm namespace where chart is installed.
