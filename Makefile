.PHONY: all deploy mkdocs clean hooks install-hooks remotes

all: deploy

deploy: mkdocs remotes
	mkdocs gh-deploy --remote-name github --force

mkdocs:
	pip3 install --user --upgrade mkdocs || \
	pip install --user --upgrade mkdocs

clean:
	git clean -fdX

hooks: install-hooks
install-hooks:
	pip3 install --user --upgrade pre-commit || \
	pip install --user --upgrade pre-commit
	pre-commit install -f --install-hooks
	cp -f git-hooks/* .git/hooks/

ORIGIN=git@opal-dhopho:dho/tech-notes.git
GITHUB=git@github.com:danielhoherd/tech-notes.git
remotes:
	git remote add origin $(ORIGIN) 2> /dev/null || \
		git remote set-url origin $(ORIGIN)
	git remote add github $(GITHUB) 2> /dev/null || \
		git remote set-url github $(GITHUB)
