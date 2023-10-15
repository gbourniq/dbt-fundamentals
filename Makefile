generate-lockfile:
	poetry check && poetry export -f requirements.txt --output requirements.txt --with dev

# CI

fmt:
	python -m sqlfluff format

test:
	dbt build --exclude package:dbt_project_evaluator --fail-fast

test-slim:
	rm -rf .state && mkdir .state && mv target/manifest.json .state/manifest.json
	dbt build --exclude package:dbt_project_evaluator --fail-fast --models state:modified+ --state .state

lint:
	python -m sqlfluff lint
	python -m yamllint .

check:
	dbt build --select package:dbt_project_evaluator

test-coverage:
	dbt run-operation required_tests
	# TODO: uncomment when dbt-coverage releases a version compatible with dbt>1.5.0
	# dbt docs generate
	# dbt-coverage compute test --model-path-filter models/marts --cov-fail-under 0.5
	# dbt-coverage compute doc --model-path-filter models/marts --cov-fail-under 0.5

# TODO: automate this in CI with github autobot https://hub.getdbt.com/data-mie/dbt_profiler/latest
dbt-profiler:
	dbt run-operation print_profile_docs --args '{"relation_name": "dim_customers"}' --quiet
	echo "Copy the above output into models/marts/core/_core.md"

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
