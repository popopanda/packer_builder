#!/bin/bash

set -xe

mkdir -p /root/.ssh/
touch /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa
# echo ${SSH_KEY} > /root/.ssh/id_rsa
ssh-keyscan -H github.com >> ~/.ssh/known_hosts

mkdir -p /workspace
git clone git@github.com:FundingCircle/ayn.git --depth=1 --branch=${AYN_BRANCH} /workspace/ayn

echo ${GIT_CRYPT} | base64 --decode > /workspace/ayn.gitcrypt
chmod 0600 /workspace/ayn.gitcrypt
cd /workspace/ayn
git-crypt unlock /workspace/ayn.gitcrypt

bundle install

rake pkr:build:${SERVICE}[${AWS_DEFAULT_REGION}]

