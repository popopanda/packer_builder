#!/bin/bash

cd /workspace/ayn
bundle install

for i in $@; do
   rake pkr:build:$i
done
