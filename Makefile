all: deploy

clean:
	git clean -fdX

deploy: clean
	mkdocs gh-deploy --remote-name github

hooks:
	cp -f git-hooks/* .git/hooks/

remotes:
	git remote add origin git@opal-dhopho:dho/tech-notes.git 2> /dev/null || \
		git remote set-url origin git@opal-dhopho:dho/tech-notes.git
	git remote add github git@github.com:danielhoherd/tech-notes.git 2> /dev/null || \
		git remote set-url github git@github.com:danielhoherd/tech-notes.git

.PHONY: remotes hooks deploy clean all
