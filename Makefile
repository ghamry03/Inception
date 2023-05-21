NAME				=	inception

DOCKER_CMD 			= 	docker compose -f $(DOCKER_COMPOSE_PATH) -p $(NAME)

DOCKER_COMPOSE_PATH	=	./srcs/docker-compose.yml

all: build up

build:
	@$(DOCKER_CMD) build --no-cache

up:
	@$(DOCKER_CMD) up -d

down:
	@$(DOCKER_CMD) down

clean: down

fclean: clean
	@docker compose -f $(DOCKER_COMPOSE_PATH) down -v --rmi local

re: fclean all

dockerclean:
	@docker system prune -af

evaluation:
	@docker stop $(shell docker ps -qa)
	@docker rm $(shell docker ps -qa);
	@docker rmi -f $(shell docker images -qa);
	@docker volume rm $(shell docker volume ls -q);
	@docker network rm $(shell docker network ls -q ) 2> /dev/null
