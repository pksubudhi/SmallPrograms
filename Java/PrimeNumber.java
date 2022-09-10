/*
WAP to find whether a number is prime or not


Contact: mailtopksubudhi@gmail.com
WhatsApp: +91-8895174939
website: www.pksubudhi.com
*/
import java.util.*;
class PrimeNumber
{
	public static void main (String args[])
	{
		int x;
		Scanner p=new Scanner(System.in);
		System.out.print("Type an Integer: ");
		int n=p.nextInt();
		for(x=2; x<=n/2; x++)
		{
			if(n%x==0)
			{
				break;
			}
			
		}
		if (x>(n/2))
		System.out.println(n+" is a prime number");
		else
		System.out.println(n+" is not a prime number");	
	}
}