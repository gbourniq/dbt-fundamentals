-- This macro is intended to be used by CI to clean up the target schema before a dbt build
-- To run this macro, use `dbt run-operation drop_target_schema`
-- https://docs.getdbt.com/reference/dbt-jinja-functions/target
-- https://docs.getdbt.com/reference/dbt-jinja-functions

{% macro create_db_objects(database=target.database) %}

{{ log('creating db objects in database ' ~ database, info=True) }}

{% set query %}
    CREATE WAREHOUSE IF NOT EXISTS dbt_transform_wh_xs;
    CREATE DATABASE IF NOT EXISTS {{ database }};
    CREATE SCHEMA IF NOT EXISTS {{ database }}.jaffle_shop;
    CREATE SCHEMA IF NOT EXISTS {{ database }}.stripe;
    CREATE SCHEMA IF NOT EXISTS {{ database }}.monitoring;

{% endset %}

{% do run_query(query) %}

{{ log('successfully created db objects in database ' ~ database, info=True) }}

{% endmacro %}
