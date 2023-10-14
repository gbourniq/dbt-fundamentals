-- ad-hoc SQL files that support jinja

-- Use cases: One off queries, training ML models,
-- auditing, refactoring (e.g. compare models), etc.

-- Can be compile to SQL with dbt compile
-- Or show results with `dbt show --select <analysis_name>`

WITH orders AS (
  SELECT * FROM {{ ref('stg_orders') }}
),

daily AS (
  SELECT
    order_date,
    COUNT(*)                                                     AS num_orders,  -- noqa: LT01
  {% for order_status in ["returned", "completed", "return_pending", "shipped", "placed"] %}
    SUM(CASE WHEN status = '{{ order_status }}' THEN 1 ELSE 0 END)       AS num_{{ order_status }}_total{{ ',' if not loop.last else '' }}  -- noqa: LT01,LT02
  {% endfor %}
  FROM orders
  GROUP BY order_date
),

compared AS (
  SELECT
    *,
    LAG(num_orders) OVER (ORDER BY order_date) AS prev_num_orders
  FROM daily
)

SELECT * FROM compared
