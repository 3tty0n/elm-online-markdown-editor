git branch -D gh-pages
git checkout -b gh-pages
make
git add -p .
git add -f elm.js
git push -f origin gh-pages
