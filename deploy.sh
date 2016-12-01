git branch -D gh-pages
git checkout -b gh-pages
make
git add index.html Markdown.elm style.css elm-package.json
git add -f elm.js
git commit -m "deploy"
git push -f origin gh-pages
