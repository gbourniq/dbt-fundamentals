{% docs dbt_profiler__dim_customers__deprecated  %}
| column_name            | data_type | row_count | not_null_proportion | distinct_proportion | distinct_count | is_unique | min        | max        |   avg | median |  std_dev_population |     std_dev_sample | ... |
| ---------------------- | --------- | --------- | ------------------- | ------------------- | -------------- | --------- | ---------- | ---------- | ----- | ------ | ------------------- | ------------------ | --- |
| customer_id            | number    |       100 |                1.00 |                1.00 |            100 |      True | 1          | 100        | 50.50 |   50.5 | 28.8660700477221200 | 29.011491981626865 | ... |
| first_name             | text      |       100 |                1.00 |                0.79 |             79 |     False |            |            |       |        |                     |                    | ... |
| last_name              | text      |       100 |                1.00 |                0.19 |             19 |     False |            |            |       |        |                     |                    | ... |
| first_order_date       | date      |       100 |                0.62 |                0.46 |             46 |     False | 2018-01-01 | 2018-04-07 |       |        |                     |                    | ... |
| most_recent_order_date | date      |       100 |                0.62 |                0.52 |             52 |     False | 2018-01-09 | 2018-04-09 |       |        |                     |                    | ... |
| lifetime_value         | number    |       100 |                0.62 |                0.34 |             34 |     False | -23.0000   | 99.0000    | 17.00 |   14.5 | 19.0246020686627770 | 19.179907519563695 | ... |
| number_of_orders       | number    |       100 |                1.00 |                0.07 |              7 |     False | 0          | 6          |  1.13 |    1.0 |  1.2462343278854102 |  1.252512674586569 | ... |
{% enddocs %}
