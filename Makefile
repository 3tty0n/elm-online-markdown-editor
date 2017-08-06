build:
	elm-make ./src/MarkdownEditor.elm --yes --output ./src/elm.js

deploy:
	git branch -D gh-pages
	git checkout -b gh-pages
	elm-make MarkdownEditor.elm --yes --output elm.js
	git add index.html MarkdownEditor.elm style.css elm-package.json
	git add -f elm.js
	git commit -m "deploy"
	git push -f origin gh-pages
