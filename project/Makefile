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

update: clear_data create_data 
	docker-compose -p $(NAME) -f $(SRCS) up -d 

clean:  clear_data
	docker-compose -p $(NAME) -f $(SRCS) down --rmi all -v


fclean:  clear_data
	docker-compose -p $(NAME) -f $(SRCS) down --rmi all -v
	docker network prune -f
	docker system prune -a

clear_data:
	sudo rm -rf ~/data/*

create_data:
	mkdir -p ~/data/wp_data && mkdir -p ~/data/db_data

re:	fclean all

.PHONY: all up clean fclean re start stop  logs clear_data create_data
