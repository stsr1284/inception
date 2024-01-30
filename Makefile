VOLUME_DIR	:=	/Users/donghak/data
DOCKER_COMPOSE	:=	docker-compose
DOCKER_COMPOSE_FILE	:=	./srcs/docker-compose.yml
PROJECT_NAME	:=	Inception
NETWORK_NAME := network-inception

all:
	@mkdir -p $(VOLUME_DIR)/db
	@mkdir -p $(VOLUME_DIR)/wordpress
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up --build

logs:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) logs

up:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up

down:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down

clean: down
	docker system prune -f --all

fclean: clean
	@rm -rf $(VOLUME_DIR)/db/*
	@rm -rf $(VOLUME_DIR)/wordpress/*
	@docker volume rm $$(docker volume ls -q)

re: fclean all

.PHONY: re, fclean, clean, down, up, all