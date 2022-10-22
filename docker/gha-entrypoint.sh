#!/bin/bash

echo "-------------------------------------------------------"
echo " - GITHUB_REPOSITORY              : $GITHUB_REPOSITORY "
echo " - PYNB_DAG_RUNNER_DEPENDENCY     : $GITHUB_REPOSITORY "
echo "-------------------------------------------------------"

set -eux

pip install --user pynb-dag-runner-snapshot


echo "-------------------------------------------------------"

static_builder \
    --github_repository $GITHUB_REPOSITORY \
    --output_dir /github_workspace/www-root/pipeline-artifacts/ \
    --output_static_data_json /github_workspace/www-root/ui_static_data.json;

echo "--- done ---"
