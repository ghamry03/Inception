NAME				=	inception

DOCKER_CMD 			= 	docker compose -f $(DOCKER_COMPOSE_PATH) -p $(NAME)

DOCKER_COMPOSE_PATH	=	./srcs/docker-compose.yml

mariadb: ### tmpp
	@$(DOCKER_CMD) up -d --force-recreate --build mariadb

all: build up

build:
	@$(DOCKER_CMD) build --no-cache #### enable this before submission ya homar

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
