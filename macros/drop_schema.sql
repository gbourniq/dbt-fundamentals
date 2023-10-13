-- This macro is intended to be used by CI to clean up the target schema before a dbt build
-- To run this macro, use `dbt run-operation drop_target_schema`
-- https://docs.getdbt.com/reference/dbt-jinja-functions/target
-- https://docs.getdbt.com/reference/dbt-jinja-functions

{% macro drop_schema(schema=target.schema) %}

{{ log('dropping schema ' ~ target.database ~ '.' ~ schema, info=True) }}

{% set query %}
    drop schema {{ target.database }}.{{ schema }}
{% endset %}

{% do run_query(query) %}

{{ log('successfully dropped schema ' ~ target.database ~ '.' ~ schema, info=True) }}

{% endmacro %}
