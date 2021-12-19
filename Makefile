init: docker-down-clear docker-pull docker-build-pull docker-up app-init
down: docker-down-clear

docker-up:
	docker-compose up -d

docker-down-clear:
	docker-compose down -v --remove-orphans

docker-pull:
	docker-compose pull

docker-build-pull:
	docker-compose build --pull

# docker-compose up --build -d - пересборка всех образов и из них перезапустились контейнеры

app-init: composer-install

composer-install:
	docker-compose run --rm php-cli composer install

test:
	docker-compose run --rm php-cli composer test
