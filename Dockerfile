FROM centos:centos7
MAINTAINER  Benoit Fabre benoit.fabre@dell.com

# Install required tooling
RUN yum update 
RUN yum -y install unzip \
                   wget \
                   jq \
                   && yum clean all

# Install OpenShift 4.x deployment tool 
COPY openshift-install /usr/local/bin/
COPY oc /usr/local/bin/

# Set default command
CMD ["/usr/bin/bash"]


