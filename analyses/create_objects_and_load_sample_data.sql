-- SQL file to load the sample data into snowflake
-- https://docs.getdbt.com/quickstarts/snowflake?step=3
-- This would represent the "Extract" part of the pipeline,
-- where raw data is loaded into the data warehouse

-- WH, databases and schemas
CREATE WAREHOUSE dbt_transform_wh_xs;
CREATE DATABASE raw;
CREATE DATABASE analytics;
CREATE SCHEMA raw.jaffle_shop;
CREATE SCHEMA raw.stripe;
CREATE SCHEMA raw.monitoring;


-- customers table
CREATE TABLE raw.jaffle_shop.customers
(
  id integer,
  first_name varchar,
  last_name varchar
);
COPY INTO raw.jaffle_shop.customers (id, first_name, last_name)
FROM 's3://dbt-tutorial-public/jaffle_shop_customers.csv'
FILE_FORMAT = (
  TYPE = 'CSV'
  FIELD_DELIMITER = ','
  SKIP_HEADER = 1
);

-- orders table
CREATE TABLE raw.jaffle_shop.orders
(
  id integer,
  user_id integer,
  order_date date,
  status varchar,
  _etl_loaded_at timestamp DEFAULT CURRENT_TIMESTAMP
);
COPY INTO raw.jaffle_shop.orders (id, user_id, order_date, status)
FROM 's3://dbt-tutorial-public/jaffle_shop_orders.csv'
FILE_FORMAT = (
  TYPE = 'CSV'
  FIELD_DELIMITER = ','
  SKIP_HEADER = 1
);

-- payments table
CREATE TABLE raw.stripe.payment
(
  id integer,
  orderid integer,
  paymentmethod varchar,
  status varchar,
  amount integer,
  created date,
  _batched_at timestamp DEFAULT CURRENT_TIMESTAMP
);
COPY INTO raw.stripe.payment (id, orderid, paymentmethod, status, amount, created)
FROM 's3://dbt-tutorial-public/stripe_payments.csv'
FILE_FORMAT = (
  TYPE = 'CSV'
  FIELD_DELIMITER = ','
  SKIP_HEADER = 1
);

-- Check tables loaded
SELECT * FROM raw.jaffle_shop.customers;
SELECT * FROM raw.jaffle_shop.orders;
SELECT * FROM raw.stripe.payment;
