/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atoi.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: viny <viny@student.42.fr>                  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/12/07 13:44:48 by vnieto-j          #+#    #+#             */
/*   Updated: 2023/08/25 16:19:59 by viny             ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../include/libft.h"

int	ft_atoi(const char *TheString)
{
	int	i;
	int	resultat;
	int	signe;

	i = 0;
	resultat = 0;
	signe = 1;
	while (TheString[i] == 32 || (TheString[i] >= 9 && TheString[i] <= 13))
		i++;
	if (TheString[i] == '-' || TheString[i] == '+')
	{
		if (TheString[i] == '-')
			signe = signe * -1;
		i++;
	}
	while (TheString[i] >= 48 && TheString[i] <= 57)
	{
		resultat = resultat * 10 + TheString[i] - 48;
		i++;
	}
	return (resultat * signe);
}
