composer-install-zend: down-clear clear-backend-folder pull build up zend-composer-new

clear-backend-folder:
	sudo rm -rf ./backend && mkdir backend

zend-composer-new:
	docker compose run --rm backend-php-cli composer create-project zendframework/zend-expressive-skeleton .

init: down-clear pull build up app-init

restart:
	docker compose restart

up:
	docker compose up -d

down:
	docker compose down --remove-orphans

pull:
	docker compose pull

build:
	docker compose build --pull

down-clear:
	docker compose down --remove-orphans --volumes

app-init: composer-install

migrate:
	docker compose run --rm backend-php-cli php artisan migrate

conf-clear:
	docker compose run --rm backend-php-cli php artisan config:clear

composer-install:
	docker compose run --rm backend-php-cli composer install

composer-dump:
	docker compose run --rm backend-php-cli composer dump-autoload