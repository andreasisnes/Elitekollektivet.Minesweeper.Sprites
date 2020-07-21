ENV=pipenv

.PHONY: init test egg clean

all: init test egg

init:
	@$(ENV) sync
	@$(ENV) run pre-commit install

test:
	@$(ENV) run pytest --cov=minesweeper tests

egg:
	@$(ENV) run python setup.py sdist bdist_wheel

clean:
	@find . -type f -name ".mypy_cache" -print0 | xargs -r0 -- rm -r
	@find . -type d -name ".pytest_cache" -print0 | xargs -r0 -- rm -r
	@find . -type d -name "__pycache__" -print0 | xargs -r0 -- rm -r
	@find . -type d -name "*.pyc" -print0 | xargs -r0 -- rm -r
	@rm -rf *.egg-info build dist .coverage
