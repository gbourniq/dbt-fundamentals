-- This macro is intended to be used by CI to clean up the target schema before a dbt build
-- To run this macro, use `dbt run-operation drop_target_schema`
-- https://docs.getdbt.com/reference/dbt-jinja-functions/target
-- https://docs.getdbt.com/reference/dbt-jinja-functions

{% macro create_sample_src_tables(database=target.database) %}

{{ log('creating sample source tables in database ' ~ database, info=True) }}

{% set query %}

    -- customers table
    CREATE TABLE {{ database }}.jaffle_shop.customers(
        id integer,
        first_name varchar,
        last_name varchar
    );
    COPY INTO {{ database }}.jaffle_shop.customers (id, first_name, last_name)
        FROM 's3://dbt-tutorial-public/jaffle_shop_customers.csv'
        FILE_FORMAT = (
        TYPE = 'CSV'
        FIELD_DELIMITER = ','
        SKIP_HEADER = 1
    );

    -- orders table
    CREATE TABLE {{ database }}.jaffle_shop.orders(
        id integer,
        user_id integer,
        order_date date,
        status varchar,
        _etl_loaded_at timestamp DEFAULT CURRENT_TIMESTAMP
    );
    COPY INTO {{ database }}.jaffle_shop.orders (id, user_id, order_date, status)
        FROM 's3://dbt-tutorial-public/jaffle_shop_orders.csv'
        FILE_FORMAT = (
        TYPE = 'CSV'
        FIELD_DELIMITER = ','
        SKIP_HEADER = 1
    );

    -- payments table
    CREATE TABLE {{ database }}.stripe.payment(
        id integer,
        orderid integer,
        paymentmethod varchar,
        status varchar,
        amount integer,
        created date,
        _batched_at timestamp DEFAULT CURRENT_TIMESTAMP
    );
    COPY INTO {{ database }}.stripe.payment (id, orderid, paymentmethod, status, amount, created)
        FROM 's3://dbt-tutorial-public/stripe_payments.csv'
        FILE_FORMAT = (
        TYPE = 'CSV'
        FIELD_DELIMITER = ','
        SKIP_HEADER = 1
    );

{% endset %}

{% do run_query(query) %}

{{ log('successfully created sample source tables in database ' ~ database, info=True) }}

{% endmacro %}
