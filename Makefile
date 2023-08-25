################################################################################
#								    COLOR									   #
################################################################################

#Formatage du texte
BOLD =	\033[1m
UNDERLINE =	\033[4m
SIGNAL = \033[5m
HIGHTLIGHT = \033[7m

#Couleur du texte
BLACK = \033[030m
YELLOW = \e[38;5;226m
RED = \033[031m
GREEN = \033[032m
ORANGE = \033[033m
BLUE = \033[034m
MAGENTA = \033[035m
CYAN = \033[036m
WHITE = \033[047m
LIGHT_RED = \033[91m
LIGHT_GREEN = \033[92m
LIGHT_CYAN = \033[96m

#Couleur arriere plan
BBLACK = \033[040m
BRED = \033[041m
BGREEN = \033[042m
BORANGE = \033[043m
BBLUE = \033[044m
BMAGENTA = \033[045m
BCYAN = \033[046m
BWHITE = \033[047m

#Reset
RESET =	\033[0m

SUCCESS = [$(GREEN)Success$(RESET)]
INFO = [$(YELLOW)Info $(RESET)]

################################################################################
#								    CONFIG									   #
################################################################################

NAME	=	

CLIENT	= client

SERVER	= server

INC_DIR	=	./include/

CC	=	cc 

CFLAGS	=	-g -Wall -Wextra -Werror -I$(INC_DIR)

RM	=	rm -rf

AUTHOR	=	vnieto-j

LIBFT_PATH = ./libft

LIBFT = $(LIBFT_PATH)/libft.a

LIBS = -L$(LIBFT_PATH) -lft

################################################################################
#                                 PROGRAM'S SRCSS                               #
################################################################################

SRC_C =	./src/client.c

SRC_S =	./src/server.c

# SRCS =	$(wildcard $(SRC_DIR)*.c)

# # Tranforme les fichiers .c en .o dans chaque fichier de SRCS

# OBJS =	$(SRCS:%.c=%.o)

# %.o: %.c
# 	@$(CC) $(CFLAGS) -o $@ -c $<

################################################################################
#                             		 NAME                                      #
################################################################################

all : $(SERVER) $(CLIENT)

$(NAME): all

$(SERVER): $(LIBFT)
	@ $(CC) $(CFLAGS) $(SRC_S) $(LIBS) -o $(SERVER)
	@printf "$(SUCCESS) Server ready.\n"

$(CLIENT): $(LIBFT)
	@ $(CC) $(CFLAGS) $(SRC_C) $(LIBS) -o $(CLIENT)
	@printf "$(SUCCESS) Client ready.\n"

$(LIBFT_PATH)/libft.a :
	@printf "\t$(BOLD)$(BMAGENTA)Execution de make dans $(LIBFT_PATH)$(RESET)\n\n"
	@make -s -C $(LIBFT_PATH)

clean :
	@printf "\t$(BOLD)$(INFO)Libft clean$(RESET)\n\n"
	@make -s -C $(LIBFT_PATH) clean 
	@$(RM) $(CLIENT) $(SERVER)
	@printf "\t$(BOLD)$(SUCCESS) Client removed$(RESET)\n\n"
	@printf "\t$(BOLD)$(SUCCESS) Server removed$(RESET)\n\n"

fclean : clean
	@make -s -C $(LIBFT_PATH) fclean
	@$(RM) $(NAME) $(OBJS)

re :
	@make -s -C $(LIBFT_PATH) re
	@make fclean
	@make all

.PHONY: all clean fclean re