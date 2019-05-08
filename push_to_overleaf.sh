bash pull_from_overleaf.sh
git push && git checkout overleaf && git merge master && git push overleaf overleaf:master
git checkout master
