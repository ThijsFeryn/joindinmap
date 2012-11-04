echo "Deploying to production";
rsync -av --delete ./public/ root@joindin.feryn.eu:/var/www/joindin.feryn.eu/