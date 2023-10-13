WITH payments AS (
  SELECT *
  FROM {{ ref('stg_payments') }}
),

orders AS (
  SELECT *
  FROM {{ ref('stg_orders') }}
),

final AS (
  SELECT
    p.order_id,
    o.customer_id,
    p.payment_method,
    p.status     AS payment_status,
    o.status     AS order_status,
    p.amount,
    p.created_at AS payment_date,
    o.order_date
  FROM payments AS p
  LEFT JOIN orders AS o
    USING (order_id)
)

SELECT * FROM final
