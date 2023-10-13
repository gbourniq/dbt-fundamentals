generate-lockfile:
	poetry check && poetry export -f requirements.txt --output requirements.txt --with dev

fmt:
	python -m sqlfluff format

lint:
	python -m sqlfluff lint
	python -m yamllint .

test:
	dbt build

clean:
	rm -rf target dbt_packages logs

docs:
	dbt docs generate
	dbt docs serve

check-src-freshness:
	dbt source freshness
