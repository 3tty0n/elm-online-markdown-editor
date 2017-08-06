build:
	elm-make ./src/MarkdownEditor.elm --yes --output ./src/elm.js

open: build
	open index.html

deploy:
	git branch -D gh-pages
	git checkout -b gh-pages
	elm-make ./src/MarkdownEditor.elm --yes --output ./src/elm.js
	git add index.html ./src/MarkdownEditor.elm ./assets/css/style.css elm-package.json
	git add -f ./src/elm.js
	git commit -m "deploy"
	git push -f origin gh-pages
	git checkout master
