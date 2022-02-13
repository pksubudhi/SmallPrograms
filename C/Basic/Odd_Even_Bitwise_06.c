/*
WAP to read an integer and check if the input nnumber is Odd or Even using bit-wise Operator

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
	
	//If the LSB is 1 then it is odd, otherwise it is even
	
	if((x & 0x1)==0)					//Checking of Reminder is zero ot not Using BIT-wise AND [ x & 0x1 ] to check last bit
	{
		printf("Even Number");		//If zero then print it as Even Number
	}
	else
	{
		printf("Odd Number");		//If not print it as Odd number
	}
}
