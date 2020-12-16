Kubera Enterprise
=====================

Introduction
------------

This chart bootstraps Kubera Enterprise on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.
###### NOTE: Please refer [here](https://github.com/mayadata-io/kubera-charts/blob/master/kubera-classic/README.md) to install Kubera Classic.

## Prerequisites
- Kubernetes 1.12.0+ with RBAC enabled.
- Default storageclass 

## Installing Kubera Enterprise
```
helm repo add kubera https://charts.mayadata.io/

helm install --namespace <yournamespace> kubera kubera/kubera-enterprise -f values.yaml
```

## Kubera Enterprise Configuration

The following table lists the configurable parameters of the Kubera enterprise and their default values.


| Parameter                                       | Description                                   | Default                                   |
|-------------------------------------------------|-----------------------------------------------|-------------------------------------------|
| `platform`                                      | Choose your kubernetes platform               |           `default`                       |
| `imagePullSecret`                               | Image pull secret for kubera enterprise images|           `kubera-img-pull-secret`        |
| `domain`                                        | Domain name for kubera enterprise             |           `""`                            |
| `scheme`                                        | Scheme for kubera enterprise http/https       |           `http`                          |
| `image.registry`                                | Image registry name kubera enterprise         |           `docker.io`                     |
| `image.organization`                            | Image registry organization name              |           `mayadataio`                    |
| `image.tag`                                     | Image tag for kubera enterprise images        |           `ci`                            |
|                                                 |                                               |                                           |
-----------------------------------------------------------------------------------------------------------------------------------------------

## MongoDB Configuration

| Parameter                                 | Description                                                                                                | Default                                                      |
|-------------------------------------------|------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------|
| `mongodb.image.registry`                          | MongoDB image registry                                                                                     | `docker.io`                                                  |
| `mongodb.image.repository`                        | MongoDB image name                                                                                         | `bitnami/mongodb`                                            |
| `mongodb.image.tag`                               | MongoDB image tag                                                                                          | `4.4.1-debian-10-r13`                                                 |
| `mongodb.global.imagePullSecrets`                       | Specify docker-registry secret names as an array                                                           | `[]`      |
| `mongodb.global.storageClass`                       | storageClass for mongodb                                                           | `""`      |
-----------------------------------------------------------------------------------------------------------------------------------------------

## Ingress Nginx Configuration

| Parameter                                 | Description                                                                                                | Default                                                      |
|-------------------------------------------|------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------|
| `ingress-nginx.controller.image.repository`                          | Ingress Nginx image repo registry                                                                                     | `k8s.gcr.io/ingress-nginx/controller`                                                  |
| `ingress-nginx.controller.image.tag`                               | Ingress Nginx image tag tag                                                                                          | `v0.40.2`                                                 |
| `ingress-nginx.imagePullSecrets`                       | Image pull secret(s) for nginx controller image                                                           | `[]`      |
| `ingress-nginx.controller.kind`                               | Ingress Nginx controller kind DaemonSet / Deployment                                                                                         | `Deployment`                                                 |
| `ingress-nginx.controller.service.kind`                               | Ingress Nginx controller service kind LoadBalancer / NodePort                                                                                         | `NodePort`                                                 |
| `ingress-nginx.controller.service.nodePorts.http`                               | Ingress Nginx controller service http port                                                                                         | `30080`                                                 |
| `ingress-nginx.controller.service.nodePorts.https`                               | Ingress Nginx controller service https port                                                                                        | `30443`                                                 |
-----------------------------------------------------------------------------------------------------------------------------------------------

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```shell
helm install -f values.yaml .
```

> **Tip**: Initial login credentails for Admin. Username: **admin** Password: **kubera**
    
