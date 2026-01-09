.DEFAULT_GOAL := all
.PHONY: all release clean serve

all:
	uv run mkdocs build

serve:
	uv run mkdocs serve

clean:
	rm -rf site

