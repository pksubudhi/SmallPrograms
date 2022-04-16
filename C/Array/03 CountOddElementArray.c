/******************
*
* Working with Initialized array, counting odd elements
*
* Author: P K Subudhi Contact: +91-8895174939, Email: mailtopksubudhi@gmail.com
* Website: www.pksubudhi.com
*
*********************/

#include<stdio.h>

int main()
{
	int arr[]={4,7,2,4,8,5,1,3,8,6};				//Declaring array with initialization
	int i, count=0;
	
	for(i=0;i<10;i++)
	{
		if(arr[i]%2==1)
		{
			count++;
		}
		
	}
	printf("\nArray Content: ");
	for(i=0;i<10;i++)
	{
		printf("%d ", arr[i]);
	}
	printf("\nThere are %d odd elements", count);
	return 0;
}
