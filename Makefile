# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ccoste <ccoste@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/14 10:35:37 by ccoste            #+#    #+#              #
#    Updated: 2023/04/14 10:57:42 by ccoste           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = so_long

SRC = srcs/main.c

OBJ = $(SRC:.c=.o)

LIBFT_DIR = libft
LIBFT = libft/libft.a

MINILIBX_DIR = minilibx-linux
MINILIBX = minilibx-linux/libmlx_Linux.a minilibx-linux/libmlx.a

CC = cc

CFLAGS = -Wall -Wextra -Werror
FLAGS = -lX11 -lXext

all : LIBFT $(NAME)

$(NAME): $(LIBFT) $(MINILIBX) $(OBJ)
	$(CC) $(CFLAGS) -o $(NAME) $(OBJ) $(LIBFT) $(MINILIBX) $(FLAGS)

LIBFT :
	$(MAKE) -C $(LIBFT_DIR)

$(MINILIBX) :
	$(MAKE) -C $(MINILIBX_DIR)

%.o: (SRC)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(MAKE) clean -C $(LIBFT_DIR)
	rm -f $(OBJ)

fclean: clean
	$(MAKE) fclean -C $(LIBFT_DIR)
	rm -f $(NAME) $(MINILIBX)

re: fclean all

.PHONY: all clean fclean re
