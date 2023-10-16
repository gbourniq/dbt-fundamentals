# Changelog

<!--next-version-placeholder-->

## v0.1.0 (2023-10-16)

### Feature

* Add --fail-fast and --store-failures flags to dbt build ([`6d58d11`](https://github.com/gbourniq/dbt-fundamentals/commit/6d58d116b16ff9c964fa7a9f8445f2f57c8febb8))
* Add dbt_project_evaluator check in CI ([`a89c8dd`](https://github.com/gbourniq/dbt-fundamentals/commit/a89c8dd43cae1e589434a365a12cd4afc10bf464))
* Add dbt_expectations and refactors ([`3d66743`](https://github.com/gbourniq/dbt-fundamentals/commit/3d66743bf7f6e2aa3f07f26bf1e5dc5690b61397))
* Add dbt_profiler for the dim_customers model (manual for now) - to do in CI ([`7a0a50e`](https://github.com/gbourniq/dbt-fundamentals/commit/7a0a50e4b41d8ea9e1dbe91b661c471d8c060e76))
* Add `dbt_artifacts.upload_results` on-run-end macro ([`c241156`](https://github.com/gbourniq/dbt-fundamentals/commit/c241156a3901d86d0a4377c8328ddfe757afbe21))
* Minor improvements ([`6b48d3d`](https://github.com/gbourniq/dbt-fundamentals/commit/6b48d3d581734e2021a05b1f7b766b38dc5fb65c))
* Add sql script to load sample data into the wh ([`b2ecd4e`](https://github.com/gbourniq/dbt-fundamentals/commit/b2ecd4e604d6e524ba895fa9320650fc4413631b))
* Add clean_stale_models macro ([`0a137fb`](https://github.com/gbourniq/dbt-fundamentals/commit/0a137fb7e41261bf489902ac03015bd822bcea9d))
* Add dbt_utils package ([`8bae075`](https://github.com/gbourniq/dbt-fundamentals/commit/8bae0757da9e5a6c85e8927d894f23c4e3ae9f0c))
* Set sqlfluff templater to dbt ([`e7187b4`](https://github.com/gbourniq/dbt-fundamentals/commit/e7187b44be7df32edeab09a1cf7ed06a00009ab0))
* Add macros for conversion and limit records in dev/testing ([`e3b001a`](https://github.com/gbourniq/dbt-fundamentals/commit/e3b001a9dc620399dd63e72c9896ec7a2ac0dae8))
* Add internediate pivoted orders model and jinja templating ([`89e920d`](https://github.com/gbourniq/dbt-fundamentals/commit/89e920df9ee110fb09e93beab888d97f486795ae))
* Add analysis and seeds ([`e4ed191`](https://github.com/gbourniq/dbt-fundamentals/commit/e4ed191f00c273c816142bbebf4f7e2a22788e6d))
* Add models to ingest and aggregate stripe fact data (modelling part 2) ([`ef66e14`](https://github.com/gbourniq/dbt-fundamentals/commit/ef66e14977e9c3fd78bd55d00ca1bce34ce7cd95))
* Complete dbt cloud and snowflake quickstart + dbt test in gha ([`cf9249b`](https://github.com/gbourniq/dbt-fundamentals/commit/cf9249b56c96351d5fa9e14d69239b2166a9e18d))
* Initial commit from dbt cloud ([`0f5d0b2`](https://github.com/gbourniq/dbt-fundamentals/commit/0f5d0b237579017dc5ff506c62d3b6f0247af708))

### Fix

* Remove dbt-coverage, not compatible with latest version of dbt required for the --store-failures flag ([`9612a2a`](https://github.com/gbourniq/dbt-fundamentals/commit/9612a2ae52f4dd243725d88bc9a57e8cd0368a09))
* Formatting ([`20adb56`](https://github.com/gbourniq/dbt-fundamentals/commit/20adb563b88468715b8f7a8ac73ba767862bec18))
* Update deps ([`f84dcc3`](https://github.com/gbourniq/dbt-fundamentals/commit/f84dcc330d632582176c8a0e4646b01576a5fb29))
* Remove vscode settings ([`6c62d32`](https://github.com/gbourniq/dbt-fundamentals/commit/6c62d32e37366e23fc80b06de4439c6f7de88c41))

### Documentation

* Add repo setup instructions ([`c8c42eb`](https://github.com/gbourniq/dbt-fundamentals/commit/c8c42eb4d8d4f3d8e438b8ca5d0f11db72f6e62b))
* Add link to dbt-jinja-functions ([`4568185`](https://github.com/gbourniq/dbt-fundamentals/commit/456818571d882a0d4fafc2c07679cb02093da812))
* Add docs block for better documentation of the order_status column ([`53b60b4`](https://github.com/gbourniq/dbt-fundamentals/commit/53b60b4b10e68f49b96cb3439b2bf14f030882de))
