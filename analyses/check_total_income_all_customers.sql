-- ad-hoc SQL files that support jinja

-- Use cases: One off queries, training ML models,
-- auditing, refactoring (e.g. compare models), etc.

-- Can be compile to SQL with dbt compile
-- Or show results with `dbt show --select <analysis_name>`

-- Check results of dbt fundamentals course exercise
SELECT SUM(lifetime_value) FROM {{ ref('dim_customers') }}
