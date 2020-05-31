MayaData Helm Repository
===============================

You can install OEP DB Helm charts using this simple command line : 
    helm repo add directoronprem 'https://charts.mayadata.io/'
    helm install dop directoronprem/oep-charts-internal --set server.url=<Node_IP> -n director
    or
    helm install dop -f directoronprem/oep-charts-internal values.yaml
    or
    helm install --repo=https://charts.mayadata.io/ dop -f values .yaml

