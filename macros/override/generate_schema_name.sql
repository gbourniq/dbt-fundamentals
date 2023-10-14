-- https://getdbt.slack.com/archives/CBSQTAPLG/p1695933231660299
-- for dbt_artifacts to create tables in a custom schema
{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- if custom_schema_name is none -%}

        {{ default_schema }}

    {%- else -%}

        {{ custom_schema_name | trim }}

    {%- endif -%}

{%- endmacro %}
