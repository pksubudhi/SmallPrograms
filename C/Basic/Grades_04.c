/*
WAP that read input mark and display corresponding Grade (or Invalid)
	If marks < 0 or marks > 100 then Invalid
	F Grade: 0 - 29
	C Grade: 30 - 50
	B Grade: 51 - 75
	A Grade: 76 - 100
	
	P K Subudhi (WhatsApp: +91-8895174939, Mail: mailtopksubudhi@gmail.com)
 	Web: www.pksubudhi.com Call: +91-7008124637
 	Twitter: @pksubudhi4u
	Mid Aug'21
	
*/
#include<stdio.h>
int main(int argc, char *argv[])
{
	int marks;
	printf("Enter Marks of the student: ");
	scanf("%d", &marks);
	if(marks>=0)
	{
		if(marks<=29)
		{
			printf("F Grade!");
		}
		else
		{
			if(marks<=50)
			{
				printf("C Grade!");
			}
			else
			{
				if(marks<=75)
				{
					printf("B Grade!");
				}
				else
				{
					if(marks<=100)
					{
						printf("A Grade!");
					}
					else
					{
						printf("Invalid Mark!");
					}
				}
			}
		}
	}
	else
	{
		printf("Invalid Mark!");
	}
}
