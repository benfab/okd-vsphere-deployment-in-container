#!/bin/bash

## Download certificate from vCenter
wget -q --no-check-certificate https://"$VC_URL"/certs/download.zip
unzip -qq download.zip
cp certs/lin/* /etc/pki/ca-trust/source/anchors
update-ca-trust extract

# destroy cluster
openshift-install destroy cluster  --dir=/okd/okd-deploy  --log-level=info



