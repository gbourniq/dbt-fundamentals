-- Singular test on stg_payments
-- Refunds have a negative amount, so the total amount should always be >= 0.
-- Therefore return records where this isn't true to make the test fail.
SELECT
  order_id,
  SUM(amount) AS total_amount
FROM {{ ref('stg_payments') }}
GROUP BY order_id
HAVING NOT (total_amount >= 0)
