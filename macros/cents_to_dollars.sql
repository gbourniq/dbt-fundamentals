-- feature of jinja
-- write logic once, reuse it with different parameters
-- packages allows to import macros developed by others

{% macro cents_to_dollars(column_name, decimal_places=2) -%}
    round(1.0 * {{ column_name }} / 100, {{ decimal_places }})
{%- endmacro %}-
