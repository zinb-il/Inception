NAME=inception

SRCS=srcs/docker-compose.yml

$(NAME): create_data
	docker-compose -p $(NAME) -f $(SRCS) up -d --build
	sudo apt install -y filezilla

start:
	docker-compose -p $(NAME) -f $(SRCS) start

stop:
	docker-compose -p $(NAME) -f $(SRCS) stop

logs:
	docker-compose -p $(NAME) -f $(SRCS) logs

all: $(NAME)

update:
	docker-compose -p $(NAME) -f $(SRCS) up -d 

down:	
	docker-compose -p $(NAME) -f $(SRCS) down

clean:  clear_data
	docker-compose -p $(NAME) -f $(SRCS) down -v


fclean:  clear_data
	docker-compose -p $(NAME) -f $(SRCS) down -v --rmi all
	docker network prune -f
	docker system prune -a

clear_data:
	sudo rm -rf ~/data/*

create_data:
	mkdir -p ~/data/wp_data && mkdir -p ~/data/db_data

re:	fclean all

.PHONY: all up clean fclean re start stop  logs clear_data create_data
