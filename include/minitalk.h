# ifndef    MINITALK_H
#  define  MINITALK_H

//librairie des signaux
//#include <signal.h>
#include "../libft/include/libft.h"
#include <signal.h>
#include <stdio.h>
#include <string.h>

void	send_signal(int pid, unsigned char character);
void	handle_signal(int signal);

#endif