
SELECT
  id      AS order_id,
  user_id AS customer_id,
  order_date,
  status

FROM {{ source('jaffle_shop', 'orders') }}

  {{ limit_data_in_dev(column_name='order_date', dev_days_of_data=365 * 10) }}  -- get last 10 years of data for tests to pass
