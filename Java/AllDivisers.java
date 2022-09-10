/*
WAP to find all divisors of an input number


Contact: mailtopksubudhi@gmail.com
WhatsApp: +91-8895174939
website: www.pksubudhi.com
*/
import java.util.*;
class AllDivisers
{
	public static void main (String args[])
	{
		int x;
		Scanner p=new Scanner(System.in);
		System.out.print("TYpe an integer: ");
		int n=p.nextInt();

		System.out.print("Divisors are ");
		for(x=2; x<=n/2; x++)
		{
			if(n%x==0)
			{
				System.out.print(x+" ");
			}
			
		}
		
		
	}
}