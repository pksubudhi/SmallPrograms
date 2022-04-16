/******************
*
* Read Array element and get sum of all element
*
* Author: P K Subudhi Contact: +91-8895174939, Email: mailtopksubudhi@gmail.com
* Website: www.pksubudhi.com
*
*********************/

#include<stdio.h>

int main()
{
	int arr[10];
	int i, sum=0;
	printf("Type 10 integer: ");
	for(i=0;i<10;i++)
	{
		scanf("%d",&arr[i]);
		sum+=arr[i];
	}
	printf("\nArray Content: ");
	for(i=0;i<10;i++)
	{
		printf("%d ", arr[i]);
	}
	printf("\nSum of all array element is %d",sum);
	return 0;
}
