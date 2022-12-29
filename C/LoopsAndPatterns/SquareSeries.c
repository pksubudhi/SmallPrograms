/*
WAP to display the square series of n values where n is user input.

Explanation: Here, question says, n is user input.
			We have to display square series from 1 to n
				e.g. 1 4 9 16 25 ...
				
Topic: for loop
Sub-topic: series

Coded by: P K Subudhi
		WhatsApp: +91-8895174939
		Email: mailtopksubudhi@gmail.com
		Website: www.pksubudhi.com
*/
#include<stdio.h>

int main()
{
	int n, i;
	printf("Enter an integer: ");
	scanf("%d", &n);
	for(i = 1; i <= n; i++)
	{
		printf("%d ", (i * i));
	}
	return 0;
}
