.PHONY: minify push clean generate update_configs all

all: clean generate push set_perms

generate:
	hugo

push:
	rsync -avz -e "ssh -p 2202" --delete public/ root@duisk:/var/www/market.nacdlow.com > rsync.log

set_perms:
	ssh root@duisk -p 2202 "chown -R www-data:www-data /var/www/; chmod -R 755 /var/www"

clean:
	$(RM) -rf public/
	$(RM) rsync.log
