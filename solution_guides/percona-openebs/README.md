# pxс-operator: A chart for installing Percona Kubernetes Operator for Percona XtraDB Cluster With OpenEBS

This chart implements the Percona XtraDB Cluster Operator deployment. [Percona XtraDB Cluster](https://www.percona.com/doc/percona-xtradb-cluster/LATEST/index.html) is a database clustering solution for MySQL. The Operator itself can be found here:
* <https://github.com/percona/percona-xtradb-cluster-operator>

## Pre-requisites
* Kubernetes 1.18+
* PV support on the underlying infrastructure - only if you are provisioning persistent volume(s).
* Helm v3

## Deployment Details
* <https://kubernetes.io/docs/concepts/workloads/controllers/deployment/>

## Chart Details
This chart will:
* deploy a PXC Operator Pod for the further MySQL XtraDB Cluster creation in K8S.

### Installing the Chart
To install the chart with the `pxc` release name using a dedicated namespace (recommended):

```sh
helm repo add percona-openebs https://charts.mayadata.io
helm install pxc-operator mayadata/percona-openebs --version 0.1.18 --namespace pxc
```

The chart can be customized using the following configurable parameters:

| Parameter                       | Description                                                                   | Default                                   |
| ------------------------------- | ------------------------------------------------------------------------------| ------------------------------------------|
| `image.repository`              | PXC Operator Container image name                                             | `percona/percona-xtradb-cluster-operator` |
| `image.tag`                     | PXC Operator Container image tag                                              | `1.9.0`                                   |
| `image.pullPolicy`              | PXC Operator Container pull policy                                            | `Always`                                  |
| `image.pullSecrets`             | PXC Operator Pod pull secret                                                  | `[]`                                      |
| `replicaCount`                  | PXC Operator Pod quantity                                                     | `1`                                       |
                                     |

Specify parameters using `--set key=value[,key=value]` argument to `helm install`

Alternatively a YAML file that can be updated with required changes on your cloned repository and run the following command within the same directory:

```sh
helm install pxc-operator -f values.yaml .
```
