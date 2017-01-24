# Pre

You'll first need to clone the AYN repo into $HOME/workspace/ayn_packer_builder/

`mkdir $HOME/workspace/ayn_packer_builder`
`git clone <repo>

## Build the image
`docker build -t packerbuilder .`

`chmod 700 amibuilder.sh`

# Run

`./amibuilder.sh ....`

During this process, multiple containers are created, building amis specified per application in parallel.  Once the rake task is completed, the containers will exit and be removed.

output are logged into logs directory within the repo. These logs are not deleted, but will be overwritten the next ami builds are invoked.

# Improvements
Clean up containers afterwards

