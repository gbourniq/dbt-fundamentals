generate-lockfile:
	poetry check && poetry lock && poetry export -f requirements.txt --output requirements.txt --with dev

fmt:
	echo "placeholder for formatting"

lint:
	echo "placeholder for linting"

test:
	echo "placeholder for testing"

clean:
	rm -rf build dist *.egg-info
