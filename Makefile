NAME				=	inception

DOCKER_CMD 			= 	docker compose -f $(DOCKER_COMPOSE_PATH) -p $(NAME)

DOCKER_COMPOSE_PATH	=	./srcs/docker-compose.yml

all: build up

build:
	@mkdir -p /home/ommohame/data/wordpress /home/ommohame/data/mariadb
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
