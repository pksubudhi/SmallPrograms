/*
WAP to display the following series of n values where n is user input.

1 5 11 19 29 41 ...

Explanation: Here, question says, n is user input.

Let us define them in table

i			result
-------------------
1			1
2			5
3			11	
4			19
5			29
6			41

				
Observe this logic every result is sum of square of the current i plus previous i
	i. e. result = (i * i) + (i - 1)
	
					
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
		printf("%d ", (i * i) + (i - 1));
	}
	return 0;
}
