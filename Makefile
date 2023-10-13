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

check-src-freshness:
	dbt source freshness


# Development

clean:
	rm -rf target dbt_packages logs

docs:
	dbt docs generate
	dbt docs serve

dbt-compile-%:
	dbt compile --select $(*)

dbt-show-%:
	dbt show --select $(*)
