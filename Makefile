generate-lockfile:
	poetry check && poetry export -f requirements.txt --output requirements.txt --with dev

# CI

fmt:
	python -m sqlfluff format

lint:
	python -m sqlfluff lint
	python -m yamllint .

drop-target-schema:
	dbt run-operation drop_schema

test:
	dbt build

# TODO: automate this in CI with github autobot https://hub.getdbt.com/data-mie/dbt_profiler/latest
dbt-profiler:
	dbt run-operation print_profile_docs --args '{"relation_name": "dim_customers"}' --quiet
	echo "Copy the above output into models/marts/core/dbt_profiler__dim_customers.md"

check-src-freshness:
	dbt source freshness


# Development

clean:
	dbt clean
	rm -rf logs

docs:
	dbt docs generate
	dbt docs serve

dbt-compile-%:
	dbt compile --select $(*)

dbt-show-%:
	dbt show --select $(*)

clean-stale-models:
	dbt run-operation clean_stale_models \
		--args "database: raw" \
		--args "schema: jaffle_shop" \
		--args "days: 1" \
		--args "dry_run: True"
