SELECT
  customer_id,
  first_name,
  last_name

FROM {{ ref('jaffle_shop', 'sd_additional_customers1') }}
