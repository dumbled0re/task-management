docker_build:
	docker-compose -f docker/docker-compose.yml --env-file docker/.env build

docker_up:
	docker-compose -f docker/docker-compose.yml --env-file docker/.env up -d

docker_down:
	docker-compose -f docker/docker-compose.yml --env-file docker/.env down