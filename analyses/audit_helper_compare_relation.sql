-- {# in dbt Develop #}
-- dbt show -s analyses/audit_helper_compare_relation.sql

-- Results
-- |  IN_A | IN_B | COUNT | PERCENT_OF_TOTAL |
-- | ----- | ---- | ----- | ---------------- |
-- |  True | True |   100 |            98.04 |
-- | False | True |     2 |             1.96 |

{% set old_etl_relation=ref('dim_customers__deprecated') %}

{% set dbt_relation=ref('dim_customers') %}

-- noqa: disable=PRS
{{
  audit_helper.compare_relations(
    a_relation=old_etl_relation,
    b_relation=dbt_relation,
    primary_key="customer_id"
  )
}}
