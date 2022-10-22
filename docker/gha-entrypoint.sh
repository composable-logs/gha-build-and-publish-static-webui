#!/bin/bash

echo "hello!!"

echo "PWD"
pwd

echo "ls"
ls -la .

#---

static_builder \
    --github_repository $GITHUB_REPOSITORY \
    --output_dir /github_workspace/www-root/pipeline-artifacts/ \
    --output_static_data_json /github_workspace/www-root/ui_static_data.json;
