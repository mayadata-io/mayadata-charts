Kubera
=====================


Introduction
------------

This chart bootstraps Kubera on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites
- Kubernetes 1.12.0+ with RBAC enabled.
- iSCSI PV support in the underlying infrastructure.
- Create a secret with docker registry credentials and use it during helm install as parameter for value 'dockerSecret'.

## Installing Kubera
```
helm repo add kubera https://charts.mayadata.io/
```

```
helm install --namespace <yournamespace> kubera kubera/kubera -f values.yaml
```

## Configuration

The following table lists the configurable parameters of the Kubera chart and their default values.

| Parameter                                       | Description                                   | Default                                   |
| ------------------------------------------------|-----------------------------------------------| ------------------------------------------|
| `platform`                                      | Choose your kubernetes platform          |           default                                |
| `useCustomRegistry`                     | Enable to use your custom Image registry          |           false                                |
| `imageRegistry`                         | Specify your custom Image registry          |           registry.mayadata.io                                |
| `type`                                          | Choose your installation DOP,OpenEBS or Both  |      default Both                               |
| `server.dockerSecret`                           | Docker secret for pulling the images          |      none                                 |
| `server.protocol`                               | http/https protocol for accessing the UI      |      http                                 |
| `server.url`                                    | url/IP address                    |      none                                 |
| `server.apiAuthAccessMode`                   | TBD                                           |      unrestricted                            |
| `server.serverDefaultAccessGrant`            | Allow users to sign-up and use Director without explicit approval from admin  |      true    |
| `server.apiUiEnabled`                         | Allow a rich API viewer                       |      true                                 |
| `server.setupName`| Name of the setup, should be set to Kubera unless requested otherwise by MayaData |      Kubera       |
| `server.apiAuthExternalProviderEnabled`     | Enable OAuth one click sign-in via Google and/or GitHub  |      true                         |
| `server.apiAuthExternalProviderConfigured`  | Specify supported authentication providers, e.g. githubconfig\,googleconfig |      githubconfig   |
| `server.apiAuthInternalProviderEnabled`     |  Enable local and directory authentication services  |      true                              |
| `server.apiAuthInternalProviderConfigured`  |  Types of local authentication (e.g. localAuthConfig\,adconfig ) |      localAuthConfig     |
| `server.apiAuthGithubClientId`              | GitHub Oauth client-id if github external auth provider is enabled    |   none                |
| `server.apiAuthGithubClientSecret`          | GitHub Oauth client-secret if github external auth provider is enabled   |      none         |
| `server.apiAuthGoogleClientId`              | Google Oauth client-id if Google external auth provider is enabled    |      none       |
| `server.apiAuthGoogleClientSecret`          |  Google Oauth client-secret if Google external auth provider is enabled  |      none                                 |
| `server.clusterDomain`                      | TBD                                           |      cluster.local                        |
| `server.featureSubscriptionDisable`         | TBD                                           |      true                                 |
| `server.subscriptionType`                   | TBD                                           |      none                                 |
| `server.featureBillingDisable`              | TBD                                           |      true                                 |
| `server.billingType`                        | TBD                                           |      external                             |
| `server.featureEmailDisable`     | Email feature is disabled when users' environment doesn't have dedicated mail accounts of a mailserver to send out mails via Kubera   |  true |
| `server.senderEmailAddress`         | bot email account at a mailserver to send out emails via this application   |   none              |
| `server.senderEmailPassword`                  | password of the bot email account           |      none                                 |
| `server.featureDocsDisable`                   | TBD                                         |      false                                |
| `server.docsUrl`                              | TBD                                         |      https://help.mayadata.io/hc/en-us    |
| `server.featureChatBotDisable`                | TBD                                         |      true                                 |
| `server.slackConfigBotClientId`             | TBD                                           |      none                                 |
| `server.slackConfigBotClientSecret`         | TBD                                           |      none                                 |
| `server.slackNotificationWelcomeMessage`     | TBD                                          |      none                                 |
| `server.featureKialiDisable`                  | TBD                                         |      true                                 |
| `server.featureAnalyticsDisable`              | Disable anonymous usage data collection     |      none                                 |
| `server.autoconnectLocalCluster`              | Autoconnect host cluster to openebs director |       true                                |
| `server.maxMemberCountInOneProject`           | Maximum member count in one project. Some special values -  0 -> You can add as many members as you want. 1 -> You can not add any member(Disable teaming).         |       10                                |
|                                                 |                                               |                                           |
| `mysql.storageClass`                            | storage engine/backend for MySQL              |      standard                             |
|                                                 |                                               |                                           |
| `elasticSearch.storageClass`                    | storage engine/backend for your logs storage  |      standard                             |
| `elasticSearch.replicas`                        | storage replication for logs         |      1                                    |
|                                                 |                                               |                                           |
| `cassandra.storageClass`                        | storage engine/backend for Cassandra          |      standard                             |
| `cassandra.replicas`                            | storage replication for Cassandra             |      1                                    |
|                                                 |                                               |                                           |
| `mayaStore.storageClass`                        | storage engine/backend for mayastore          |      standard                             |
|                                                 |                                               |                                           |
| `grafana.storageClass`                          | storage engine/backend for grafana            |      standard                             |
|                                                 |                                               |                                           |
| `cortex.replicationFactor`                      | TBD                                           |      1                                    |
| `cortex.timeout`                                | TBD                                           |      20s                                  |
|                                                 |                                               |                                           |
| `alertStore.replicationFactor`                  | TBD                                           |      1                                    |
-----------------------------------------------------------------------------------------------------------------------------------------------

# Type
   The `type` flag let you choose what you want to install with Kubera.    
     Default value is installDirector true, installOpenebs true which allows to install both components OpenEBS and Director.
     
    - To install Openebs only `--set type.installDirector=false`
    - To install Director only `--set type.installOpenebs=false`




# UseCustomRegistry & ImageRegistry
   The `useCustomRegistry` and `imageRegistry` flag let you use your own image registry for Kubera images. 
      
    - To use custom image registry  `--set useCustomRegistry=true`
    - To provide the name of your registry install `--set imageRegistry=registry.mayadata.io`
# Platform
   The `Platform` flag let you choose which platfrom you want to intall.
    -  Default value is for GKE, Packet
    -  SUSE value is for SUSE Kubernetes platform

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```shell
helm install -f values.yaml .
```

Once DOP pods are in running state, it can be accessible from browser using NodeIp given in URL. If ingress is used as deployment then URL is given along with NodePort(Nodeip:port)

> **Tip**: You can use the default [values.yaml](values.yaml)

> **Tip**: Initial login credentails for Administrator. Username: **Administrator** Password: **password**

    