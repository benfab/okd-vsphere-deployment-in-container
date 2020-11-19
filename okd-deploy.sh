#!/bin/bash

## Download certificate from vCenter
wget -q --no-check-certificate https://"$VC_URL"/certs/download.zip
unzip -qq download.zip
cp certs/lin/* /etc/pki/ca-trust/source/anchors
update-ca-trust extract

# Create install directory
mkdir -p /okd/okd-deploy

# Generate install-config.yaml file

cat << EOF > /okd/okd-deploy/install-config.yaml
apiVersion: v1
baseDomain: $OKD_BASE_DOMAIN
compute:
- architecture: amd64
  hyperthreading: Enabled
  name: worker
  platform: {}
  replicas: 3
controlPlane:
  architecture: amd64
  hyperthreading: Enabled
  name: master
  platform: {}
  replicas: 3
metadata:
  creationTimestamp: null
  name: test
networking:
  clusterNetwork:
  - cidr: 10.128.0.0/14
    hostPrefix: 23
  machineNetwork:
  - cidr: 10.0.0.0/16
  networkType: OVNKubernetes
  serviceNetwork:
  - 172.30.0.0/16
platform:
  vsphere:
    apiVIP: $OKD_VIP_API
    cluster: $VC_CLUSTER
    datacenter: $VC_DATACENTER
    defaultDatastore: $VC_DATASTORE
    ingressVIP: $OKD_VIP_INGRESS
    network: $VC_NETWORK
    password: $VC_PASSWORD
    username: $VC_USERNAME
    vCenter: $VC_URL
publish: External
pullSecret: $OKD_SECRET
EOF

cat /okd/okd-deploy/install-config.yaml

# deploy cluster
openshift-install create cluster --dir=/okd/okd-deploy --log-level=info 

export KUBECONFIG=/okd/okd-deploy/auth/kubeconfig 
oc version
oc cluster-info
oc get nodes


