generate-lockfile:
	poetry check && poetry export -f requirements.txt --output requirements.txt --with dev

fmt:
	python -m sqlfluff format

lint:
	python -m sqlfluff lint
	python -m yamllint .

test:
	echo "placeholder for testing"

clean:
	rm -rf build dist *.egg-info
