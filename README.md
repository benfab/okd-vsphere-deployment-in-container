# okd-vsphere-deployment-in-container
This repo helps to execute reproducible OKD 4.x deployments on vSphere from a CI/CD pipeline by executing all deployment steps in one container.

It follows the OpenShift guide: https://docs.openshift.com/container-platform/4.6/installing/installing_vsphere/installing-vsphere-installer-provisioned.html

# Requirements 

- Docker engine 
- vSphere environments

# Deploy

1. Populate the env_file with the appropriate variables

2. Run the container on Docker engine using the following command:
`docker run --env-file=env_file -v  ${PWD}:/tmp benfab/okd-vsphere-deployment-in-container /tmp/okd-deployment.sh`  

3. If needed OKD install files are available on the parent directory.  

**Note:** This container has to be deployed as part of a CI/CD pipeline task.
