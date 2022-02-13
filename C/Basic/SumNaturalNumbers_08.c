/*
WAP to display initial 10 natural numbers side by side. i.e.

	1 2 3 4 5 6 7 8 9 10
	
	P K Subudhi (WhatsApp: +91-8895174939, Mail: mailtopksubudhi@gmail.com)
 	Web: www.pksubudhi.com Call: +91-7008124637
	Mid Aug'21
	
*/
#include<stdio.h>
int main(int argc, char *argv[])
{
	int sum=0;
	int n;
	printf("Enter value of n: ");
	scanf("%d",&n);
	int i;
	for(i=1;i<=n;i++)
	{
		sum+=i;
	}
	printf("Sum is %d", sum);
}

