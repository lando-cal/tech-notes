all: deploy

clean:
	git clean -fdX

deploy: clean
	mkdocs gh-deploy

hooks:
	cp -f post-commit .git/hooks/
