all: deploy

clean:
	git clean -fdX

deploy: clean
	mkdocs gh-deploy

hooks:
	cp -f git-hooks/* .git/hooks/
