-- Get staging tables

WITH customers AS (
  SELECT * FROM (
    SELECT * FROM {{ ref('stg_customers') }}
    UNION
    SELECT * FROM {{ ref('additional_customers') }}
  )
),

orders AS (

  SELECT * FROM {{ ref('fct_orders') }}

),

-- Aggregate orders by customer_id
customer_orders AS (

  SELECT
    customer_id,

    MIN(order_date) AS first_order_date,
    MAX(order_date) AS most_recent_order_date,
    COUNT(order_id) AS number_of_orders,
    SUM(
      CASE
        WHEN order_status = 'completed' THEN amount
        WHEN order_status = 'returned' THEN -amount
        WHEN order_status = 'return_pending' THEN 0
        WHEN order_status = 'shipped' THEN 0
        WHEN order_status = 'placed' THEN 0
        ELSE 0
      END
    )               AS lifetime_value

  FROM orders
  WHERE payment_status = 'success'

  GROUP BY customer_id

),

-- Final table, join customers and customer_orders
final AS (

  SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    co.first_order_date,
    co.most_recent_order_date,
    co.lifetime_value,
    COALESCE(co.number_of_orders, 0) AS number_of_orders

  FROM customers AS c

  LEFT JOIN customer_orders AS co
    USING (customer_id)

)

SELECT * FROM final
