{% docs dbt_profiler__dim_customers  %}
| column_name            | data_type | row_count | not_null_proportion | distinct_proportion | distinct_count | is_unique | min        | max        |       avg | median |  std_dev_population |     std_dev_sample | ... |
| ---------------------- | --------- | --------- | ------------------- | ------------------- | -------------- | --------- | ---------- | ---------- | --------- | ------ | ------------------- | ------------------ | --- |
| customer_id            | number    |       102 |            1.000000 |            1.000000 |            102 |      True | 1          | 102        | 51.500000 |   51.5 | 29.4434486261375280 | 29.588849251026982 | ... |
| first_name             | text      |       102 |            1.000000 |            0.794118 |             81 |     False |            |            |           |        |                     |                    | ... |
| last_name              | text      |       102 |            1.000000 |            0.205882 |             21 |     False |            |            |           |        |                     |                    | ... |
| first_order_date       | date      |       102 |            0.607843 |            0.450980 |             46 |     False | 2018-01-01 | 2018-04-07 |           |        |                     |                    | ... |
| most_recent_order_date | date      |       102 |            0.607843 |            0.509804 |             52 |     False | 2018-01-09 | 2018-04-09 |           |        |                     |                    | ... |
| lifetime_value         | number    |       102 |            0.607843 |            0.333333 |             34 |     False | -23.0000   | 99.0000    | 17.000000 |   14.5 | 19.0246020686627770 | 19.179907519563695 | ... |
| number_of_orders       | number    |       102 |            1.000000 |            0.068627 |              7 |     False | 0          | 6          |  1.107843 |    1.0 |  1.2438621306238082 |  1.250004799990784 | ... |
{% enddocs %}
