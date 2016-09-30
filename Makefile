all: deploy

clean:
	git clean -fdX

deploy: clean
	mkdocs gh-deploy
