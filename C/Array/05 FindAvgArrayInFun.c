/******************
*
* Read Array element and get average of array elements through a separate function
*
* Author: P K Subudhi Contact: +91-8895174939, Email: mailtopksubudhi@gmail.com
* Website: www.pksubudhi.com
*
*********************/

#include<stdio.h>

float avg(int *arr, int n);
int main()
{
	int arr[1000];	// An array of very big size
	int i;
	int n;
	printf("Type how many element you want to store? ");
	scanf("%d", &n);
	printf("\nType %d integer: ", n);
	for(i=0;i<n;i++)
	{
		scanf("%d",&arr[i]);
		
	}
	printf("\nArray Content: ");
	for(i=0;i<n;i++)
	{
		printf("%d ", arr[i]);
	}
	printf("\nAvg of array elements is %f",avg(arr, n));
	return 0;
}
float avg(int *arr, int n)
{
	int sum=0;
	int i;
	for(i=0;i<n;i++)
	{
		sum+=arr[i];
	}
	return (float)sum/n;
}
