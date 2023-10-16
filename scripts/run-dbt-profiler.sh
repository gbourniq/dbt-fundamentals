#!/usr/bin/env bash

# Inspired from https://github.com/data-mie/dbt-profiler/blob/0.8.1/update-relation-profile.sh

if ! command -v dbt &> /dev/null
then
    echo "dbt is not installed"
    exit 1
fi

echo "Running dbt profiler on dim and fct models"
model_files=$(find models -type f \( -name 'dim_*.sql' -o -name 'fct_*.sql' \) | sort)

# create an empty file to avoid dbt compile error, if the file does not exist
for file in $model_files; do
    model_name=$(basename -- "$file" | sed 's/\.[^.]*$//')
    model_docs=$(dirname -- "$file")/$model_name.md
    echo "{% docs dbt_profiler__$model_name  %}{% enddocs %}" > $model_docs
done;

for file in $model_files; do

    model_name=$(basename -- "$file" | sed 's/\.[^.]*$//')
    model_docs=$(dirname -- "$file")/$model_name.md

    echo "Generating docs for model $model_name to $model_docs"
    run_operation_output=$(dbt run-operation print_profile_docs --args '{"relation_name": "'$model_name'"}' --quiet)
    echo "$run_operation_output" > $model_docs

done;
