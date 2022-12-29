/*
WAP to display the following series of n values where n is user input.

1 3 11 13 29 31 ...

Explanation: Here, question says, n is user input.

Let us define them in table

i			result
-------------------
1			1		odd 	+ previous i
2			3		even	- previous i
3			11		odd
4			33		even
5			29		odd
6			31		even 

				
Observe this logic every result is sum of square of the current i plus/minus previous i on current i odd or even respectively
	i. e. result = (i * i) + (i - 1) if i is odd (please not: if current i is odd then previous i must be odd)
		otherwise
		  result = (i * i) - (i - 1) if i is even
	
					
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
		if ( i % 2)
		{
			printf("%d ", (i * i) + (i - 1));
		}
		else
		{
			printf("%d ", (i * i) - (i - 1));
		}
		
	}
	return 0;
}
