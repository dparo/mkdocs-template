.DEFAULT_GOAL := all
.PHONY: all release clean serve plantuml-server

all:
	uv run mkdocs build

serve:
	uv run mkdocs serve

clean:
	rm -rf site

plantuml-server:
	docker run -d -p 8080:8080 plantuml/plantuml-server:jetty
