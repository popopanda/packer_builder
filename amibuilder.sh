#!/bin/bash
echo "Welcome to AMI Builder using Packer!"
echo

function DOCKRUN {
  docker run --rm -e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
  -e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} \
  -e ATLAS_TOKEN=${ATLAS_TOKEN} \
  -e CRYPT=${GITCRYPT} \
  -e AYN_BRANCH=${AYN_BRANCH} \
  -e SERVICE=${SERVICE}
  -e AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION} quay.io/fundingcircle/packerbuilder
}

DOCKRUN

