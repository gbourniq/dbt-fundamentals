# dbt-demo

https://courses.getdbt.com/courses
https://docs.getdbt.com

repository for the dbt course

## Materialization in dbt

Materialization defines how dbt builds the models (select statements).

* Tables: Copy of the data from upstream into a NEW table.
  * Higher build time and more storage usage, but shorter query time
  * If new record added in upstream stable, model/table is rebuilt from scratch.
* Views: No copy, data remains in the upstream table, and the query is run every time we do a select on the view.
  * Quicker build time and less storage usage, but longer query time
  * If new record added in upstream stable, it will be part of the view/query, but slower.
* Ephemeral: Brings CTE into downstream models (another select statement), but no persistent storage, do not exist in the DB.
  * Can be used if too many CTEs in a model, and it makes sense to break it down, or that the CTE can be reused
  in other downstream models, but we don't want to store the data.
  Help reduces the amount of tables in the WH, but harder to debug, cannot be queried directly.
* Incremental: Only brings in new records in upstream tables, do not rebuild the table from scratch
* Snapshot: Look at changed records, if anything changes, bring the updated records as a NEW row - no loss of information
  * Used for type 2 slowly changing dimension tables: https://docs.getdbt.com/docs/build/snapshots
  * Preserve the history of changing fields (e.g. dobjects, sec master)
  * Snapshots: https://courses.getdbt.com/courses/take/advanced-materializations/lessons/30195287-implementing-snapshots
  * Usually applied on source tables

Generally, start with a view, when it takes too long to query, "upgrade" the model to a table.
When the table takes too long to build, consider upgrading to an incremental table.
Upgrading to an incremental table is not straightforward, follow the [dbt documentation](https://courses.getdbt.com/courses/take/advanced-materializations/lessons/30195285-incremental-models)
