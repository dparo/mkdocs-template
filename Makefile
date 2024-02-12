.DEFAULT_GOAL := all
.PHONY: all release clean serve

all:
	poetry run mkdocs build

serve:
	poetry run mkdocs serve

clean:
	rm -rf site

