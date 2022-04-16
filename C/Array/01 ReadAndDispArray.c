/******************
*
* Array declaration, element input and output
*
* Author: P K Subudhi Contact: +91-8895174939, Email: mailtopksubudhi@gmail.com
* Website: www.pksubudhi.com
*
*********************/

#include<stdio.h>

int main()
{
	int arr[10];				//Declaring array of fixed size
	int i;
	printf("Type 10 integer: ");
	for(i=0;i<10;i++)
	{
		scanf("%d",&arr[i]);
		
	}
	printf("\nArray Content: ");
	for(i=0;i<10;i++)
	{
		printf("%d ", arr[i]);
	}
	return 0;
}
