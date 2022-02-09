/*
WAP to swap two initialized numbers without taking third variable.

 	P K Subudhi (WhatsApp: +91-8895174939, Mail: mailtopksubudhi@gmail.com)
 	Web: www.pksubudhi.com Call: +91-7008124637
	Mid Aug'21
*/
#include<stdio.h>

int main(int argc, char *argv[])
{
	int x=10, y=20;							//Two Variables declared and initialized
	
	printf("Numbers are: ");				//Prompt before swapping
	printf("%d %d", x, y);					//Displaying numbers
	
	x=x+y;									//Logic to swap two numbers
	y=x-y;
	x=x-y;
	
	printf("\nAfter swapping Numbers are: ");//Prompt to after swapping
	printf("%d %d", x, y);					//Displaying numbers
}
