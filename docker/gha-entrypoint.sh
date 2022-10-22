#!/bin/bash

echo "-------------------------------------------------------"
echo " - GITHUB_REPOSITORY              : ${GITHUB_REPOSITORY}"
echo " - PYNB_DAG_RUNNER_DEPENDENCY     : ${INPUT_A_PARAMETER}"
echo " - pynb_dag_runner_ref            : ${INPUT_PYNB_DAG_RUNNER_REF}"
echo "-------------------------------------------------------"

set -eux

whoami

cd /home/host_user/

pip install --no-cache-dir --user ${INPUT_PYNB_DAG_RUNNER_REF}

echo "-------------------------------------------------------"

static_builder \
    --github_repository $GITHUB_REPOSITORY \
    --output_dir /github_workspace/www-root/pipeline-artifacts/ \
    --output_static_data_json /github_workspace/www-root/ui_static_data.json;

echo "--- done ---"
