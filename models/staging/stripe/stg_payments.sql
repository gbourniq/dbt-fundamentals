
SELECT
  id               AS payment_id,
  orderid          AS order_id,
  paymentmethod    AS payment_method,
  status,
  {{ cents_to_dollars(column_name='amount', decimal_places=4) }} AS amount,
  created          AS created_at

FROM {{ source('stripe', 'payment') }}
