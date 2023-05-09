NAME				=	inception

DOCKER_COMPOSE_PATH	=	./srcs/docker-compose.yml

all: build up

build:
	@docker compose -f $(DOCKER_COMPOSE_PATH) -p $(NAME) build --no-cache #### enable this before submission ya homar

up:
	@docker compose -f $(DOCKER_COMPOSE_PATH) -p $(NAME) up -d

down:
	@docker compose -f $(DOCKER_COMPOSE_PATH) -p $(NAME) down

clean: down

fclean: clean
	@docker compose -f $(DOCKER_COMPOSE_PATH) down -v --rmi local

re: fclean all

dockerclean:
	@docker system prune -af
