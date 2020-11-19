# okd-vsphere-deployment-in-container
This repo helps to execute reproducible OKD 4.x deployments on vSphere from a CI/CD pipeline by executing all deployment steps in one container.

It follows the OpenShift guide: https://docs.openshift.com/container-platform/4.6/installing/installing_vsphere/installing-vsphere-installer-provisioned.html

# Requirements 

- Docker engine 
- vSphere environment

# Deploy OKD cluster

1. Populate the env_file with the appropriate variables

2. Run the container on Docker engine using the following command: 

`cd okd-vsphere-deployment-in-container`  
`docker run --env-file=env_file -v ${PWD}:/okd benfab/okd-vsphere-deployment-in-container /okd/okd-deploy.sh`

The OKD install directory /okd-deploy is automatically created and can be reused to point to the deployment state and config.  

# Destroy OKD cluster

`docker run --privileged --env-file=env_file -v ${PWD}:/okd benfab/okd-vsphere-deployment-in-container /okd/okd-destroy.sh`

**Note:** This container aims to be run as part of a CI/CD pipeline task.




