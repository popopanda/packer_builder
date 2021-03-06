#!/bin/bash
echo "Welcome to AMI Builder using Packer!"
echo
echo "To check the status, you can do docker ps"
echo "To see the output, you can do tail -f logs/packer_*.log"
echo "If you need to get the version number, you can do sed -n '/amazon.ami (v[0-9]*)/p' logs/packer_*.log"
echo
mkdir -p ./logs

function DOCKRUN {
  for i in $@; do
    docker run --rm -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
    -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
    -e ATLAS_TOKEN=$ATLAS_TOKEN \
    -e AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN \
    -e CRYPT=$GITCRYPT \
    -e AWS_DEFAULT_REGION=$AWS_REGION\
    -v $HOME/workspace/ayn:/workspace/ayn packerbuilder \
    $i > ./logs/packer_$i.log &
  done
}

if [ $# -eq 0 ]; then
  echo "There was no arguments passed, Exiting...."
  exit 0
else
  DOCKRUN $@
fi
