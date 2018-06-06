.DEFAULT_GOAL := help

.PHONY: help
help: ## Print Makefile help.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: deploy
deploy: remotes ## Deploy to GitHub Pages.
	pip install --upgrade pipenv
	pipenv run mkdocs gh-deploy --remote-name github --force

.PHONY: clean
clean: ## Clean the repo by deleting non-git files.
	git clean -fdX

.PHONY: install-hooks
install-hooks: ## Install git hooks.
	pip3 install --user --upgrade pre-commit || \
	pip install --user --upgrade pre-commit
	pre-commit install -f --install-hooks
	cp -f git-hooks/* .git/hooks/

ORIGIN=git@opal-dhopho:dho/tech-notes.git
GITHUB=git@github.com:danielhoherd/tech-notes.git
.PHONY: remotes
remotes: ## Create git remotes.
	git remote add origin $(ORIGIN) 2> /dev/null || \
		git remote set-url origin $(ORIGIN)
	git remote add github $(GITHUB) 2> /dev/null || \
		git remote set-url github $(GITHUB)
