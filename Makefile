.PHONY: docs

generate-lockfile:
	poetry check && poetry export -f requirements.txt --output requirements.txt --with dev

# CI

fmt:
	python -m sqlfluff format

lint:
	python -m sqlfluff lint
	python -m yamllint .

test:
	@echo "Running dbt build for modified and downstream models"
	dbt build --exclude package:dbt_project_evaluator --fail-fast --models state:modified+ --state .state

test-all:
	@echo "Running dbt build for all models"
	dbt build --exclude package:dbt_project_evaluator --fail-fast

check:
	dbt build --select package:dbt_project_evaluator

test-coverage:
	dbt run-operation required_tests
	# TODO: uncomment when dbt-coverage compatible with dbt>1.5.0
	# dbt docs generate
	# dbt-coverage compute test --model-path-filter models/marts --cov-fail-under 0.5
	# dbt-coverage compute doc --model-path-filter models/marts --cov-fail-under 0.5

dbt-profiler:
	./scripts/run-dbt-profiler.sh

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
