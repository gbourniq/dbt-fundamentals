-- This macro is intended to be used by CI to clean up the target schema before a dbt build
-- To run this macro, use `dbt run-operation drop_target_schema`
-- https://docs.getdbt.com/reference/dbt-jinja-functions/target
-- https://docs.getdbt.com/reference/dbt-jinja-functions

{% macro cleanup_db_objects(database=target.database) %}

{{ log('deleting database ' ~ database, info=True) }}

{% set query %}

    DROP DATABASE IF EXISTS {{ database }};

{% endset %}

{% do run_query(query) %}

{{ log('successfully deleted database ' ~ database, info=True) }}

{% endmacro %}
