
if [ ! $(git rev-parse --verify overleaf) ]; then
	echo "Please provide overleaf git repository URL:"
	read URL
	git remote add overleaf $URL
fi
git checkout overleaf && git pull overleaf master
git checkout master
