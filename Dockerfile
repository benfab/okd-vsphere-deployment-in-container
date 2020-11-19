FROM centos:centos7
MAINTAINER  Benoit Fabre benoit.fabre@dell.com

# Install required tooling
RUN yum update -y
RUN yum install -y unzip \
                   wget \
                   jq \
                   && yum clean all

# Install openshift-installer
RUN curl -k -Lo openshift-install.tar.gz https://github.com/openshift/okd/releases/download/4.5.0-0.okd-2020-10-15-235428/openshift-install-linux-4.5.0-0.okd-2020-10-15-235428.tar.gz \
    && tar xvf openshift-install.tar.gz \
    && mv openshift-install /usr/local/bin/ \
    && chmod 0755 /usr/local/bin/openshift-install \
    && rm openshift-install.tar.gz

# Install oc client 
RUN curl -k -Lo oc.tar.gz https://mirror.openshift.com/pub/openshift-v4/clients/oc/4.5/linux/oc.tar.gz \
    && tar xvf oc.tar.gz \
    && mv oc /usr/local/bin/ \
    && chmod 0755 /usr/local/bin/oc \
    && rm oc.tar.gz

# Install helm
RUN curl -k -Lo helm.tar.gz https://get.helm.sh/helm-v3.4.1-linux-amd64.tar.gz \
    && tar xvf helm.tar.gz \
    && mv linux-amd64/helm /usr/local/bin/ \
    && chmod 0755 /usr/local/bin/helm \
    && rm helm.tar.gz

# Set default command
CMD ["/usr/bin/bash"]


