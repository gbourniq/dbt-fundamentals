{% docs dbt_profiler__fct_orders  %}
| column_name    | data_type | row_count | not_null_proportion | distinct_proportion | distinct_count | is_unique | min        | max        |           avg | median | std_dev_population |     std_dev_sample | ... |
| -------------- | --------- | --------- | ------------------- | ------------------- | -------------- | --------- | ---------- | ---------- | ------------- | ------ | ------------------ | ------------------ | --- |
| order_id       | number    |       120 |                   1 |            0.825000 |             99 |     False | 1          | 99         | 49.4500000000 |   49.5 | 28.501418087526800 | 28.620921421226118 | ... |
| customer_id    | number    |       120 |                   1 |            0.516667 |             62 |     False | 1          | 99         | 49.1583330000 |   51.0 | 26.495281296864917 | 26.606373108712130 | ... |
| payment_method | text      |       120 |                   1 |            0.033333 |              4 |     False |            |            |               |        |                    |                    | ... |
| payment_status | text      |       120 |                   1 |            0.016667 |              2 |     False |            |            |               |        |                    |                    | ... |
| order_status   | text      |       120 |                   1 |            0.041667 |              5 |     False |            |            |               |        |                    |                    | ... |
| amount         | number    |       120 |                   1 |            0.250000 |             30 |     False | 0.0000     | 30.0000    | 14.6916666667 |   15.0 |  9.033083483629607 |  9.070958213615858 | ... |
| payment_date   | date      |       120 |                   1 |            0.575000 |             69 |     False | 2018-01-01 | 2018-04-09 |               |        |                    |                    | ... |
| order_date     | date      |       120 |                   1 |            0.575000 |             69 |     False | 2018-01-01 | 2018-04-09 |               |        |                    |                    | ... |
{% enddocs %}
