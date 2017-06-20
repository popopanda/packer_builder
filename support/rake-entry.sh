#!/bin/bash

touch /workspace/ayn.gitcrypt
echo $CRYPT | base64 -d > /workspace/ayn.gitcrypt
chmod 600 /workspace/ayn.gitcrypt

cd /workspace/ayn
git-crypt unlock /workspace/ayn.gitcrypt
bundle install

for i in $@; do
   rake pkr:build:$i[$AWS_DEFAULT_REGION]
done
