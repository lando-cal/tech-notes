all: deploy

clean:
	git clean -fdX

requirements:
	pip3 install --user --upgrade mkdocs || \
	pip install --user --upgrade mkdocs

deploy: requirements remotes
	mkdocs gh-deploy --remote-name github --force

hooks:
	cp -f git-hooks/* .git/hooks/

ORIGIN=git@opal-dhopho:dho/tech-notes.git
GITHUB=git@github.com:danielhoherd/tech-notes.git
remotes:
	git remote add origin $(ORIGIN) 2> /dev/null || \
		git remote set-url origin $(ORIGIN)
	git remote add github $(GITHUB) 2> /dev/null || \
		git remote set-url github $(GITHUB)

.PHONY: remotes hooks deploy clean all
