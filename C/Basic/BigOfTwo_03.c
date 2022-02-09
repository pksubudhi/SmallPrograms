/*
WAP to read two integers and display the biggest one.

 	P K Subudhi (WhatsApp: +91-8895174939, Mail: mailtopksubudhi@gmail.com)
 	Web: www.pksubudhi.com
 	Twitter: @pksubudhi4u
	Mid Aug'21
*/
#include<stdio.h>

int main(int argc, char *argv[])
{
	int x, y;								//Variables declared to store input number
	
	printf("Enter an integer: ");			//Prompt to take input
	scanf("%d",&x);							//Reading integer
	
	printf("Enter another integer: ");		//Prompt to take anotherinput
	scanf("%d",&x);							//Reading second integer
		
	if(x>y)									//Checking if x is bigger than y
	{
		printf("%d is biggest one",x);		//Displaying x is bigger
	}
	else
	{
		printf("%d is biggest one",y);		//Otherwise displaying y is bigger
	}
}
