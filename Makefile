all: deploy

clean:
	mkdocs gh-deploy --clean

deploy: clean
	mkdocs gh-deploy
