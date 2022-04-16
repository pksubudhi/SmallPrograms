/******************
*
* Read Array element of size n and find out the smallest in the input array
*
* Author: P K Subudhi Contact: +91-8895174939, Email: mailtopksubudhi@gmail.com
* Website: www.pksubudhi.com
*
*********************/

#include<stdio.h>

int main()
{
	int arr[1000];			//Declaring an array of maximum size
	int i, small;
	int n;
	printf("How many elements you want to keep in the array? ");
	scanf("%d", &n);
	printf("\nType %d integer: ", n);
	for(i=0;i<n;i++)
	{
		scanf("%d",&arr[i]);
	}
	small=arr[0];
	for(i=1;i<n;i++)
	{
		if(small>arr[i])
		{
			small=arr[i];
		}
	}
	printf("\nSmallest array in the array element is %d",small);
	return 0;
}
