/*
WAP to display the following series of n values where n is user input.

1 5 14 30 55 91 ...

Explanation: Here, question says, n is user input.

Let us define them in table

i			result
-------------------
1			1
2			5
3			14	
4			30
5			55
6			91

				
Observe this logic every result is sum of square of the current i plus previous result
	i. e. result = result + (i * i) 
	
					
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
	int n, i, result = 0;
	printf("Enter an integer: ");
	scanf("%d", &n);
	for(i = 1; i <= n; i++)
	{
		result = result + (i * i);
		printf("%d ", result);
	}
	return 0;
}
