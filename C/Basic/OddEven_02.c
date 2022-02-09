/*
WAP to read an integer and check if the input nnumber is Odd or Even.

 	P K Subudhi (WhatsApp: +91-8895174939, Mail: mailtopksubudhi@gmail.com)
 	Web: www.pksubudhi.com
 	Twitter: @pksubudhi4u
	Mid Aug'21
*/
#include<stdio.h>

int main(int argc, char *argv[])
{
	int x;							//Variable declared to store input number
	printf("Enter an integer: ");	//Prompt to take input
	scanf("%d",&x);					//Reading integer
	if(x%2==0)						//Checking of Reminder is zero ot not
	{
		printf("Even Number");		//If zero then print it as Even Number
	}
	else
	{
		printf("Odd Number");		//If not print it as Odd number
	}
}
