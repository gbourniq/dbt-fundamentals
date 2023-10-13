
-- feature of jinja
-- write logic once, reuse it with different parameters
-- packages allows to import macros developed by others

{% macro limit_data_in_dev(column_name, dev_days_of_data=3) -%}
{% if target.name == 'dev' -%}
where {{ column_name }} >= dateadd('day', - {{ dev_days_of_data }}, current_timestamp)
{% endif %}
{%- endmacro %}
