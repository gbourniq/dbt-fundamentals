-- showcase the date_spine macro from dbt_utils package

{{ config(materialized="view") }}

{{
    dbt_utils.date_spine(
        datepart="day",
        start_date="cast('2020-01-01' as date)",
        end_date="cast('2021-01-01' as date)"
   )
}}
