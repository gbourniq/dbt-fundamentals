#!/usr/bin/env bash
model_name=$1
model_dir=$2

if test -z "$model_name" || test -z "$model_dir"; then
    echo "usage: update-relation-profile.sh RELATION_NAME SCHEMA"
    exit 1
fi

RUN_OPERATION_OUTPUT=$(dbt run-operation print_profile_docs --args '{"relation_name": "'$model_name'"}' --quiet)

# Extract docs block from stdout
PROFILE=$(echo "$RUN_OPERATION_OUTPUT" | awk '/{%.docs.*%}$/{flag=1} flag; /{%.enddocs.%}/{flag=0}')

output_path=$model_dir/$model_name.md
echo "$PROFILE" >$output_path
