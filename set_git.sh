export USER=wschuell &&
export REPO= &&
git remote set-url origin git@github.com:$USER/$REPO.git &&
git remote add upstream git@github.com:wschuell/template_article.git &&
git push origin master &&
git push --all
