echo "Deploying to production";
rsync -av --delete --exclude=".git" --exclude=".gitignore" --exclude="deploy.sh" --exclude=".idea" ./ root@joindin.feryn.eu:/var/www/joindin.feryn.eu/
