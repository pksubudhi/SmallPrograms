/*
WAP to calculate Factorial of an input number

Contact: mailtopksubudhi@gmail.com
WhatsApp: +91-8895174939
website: www.pksubudhi.com
*/
import java.util.*;
class CalcFact
{
	public static void main (String args[])
	{
		int x, y=1;
		Scanner p=new Scanner(System.in);
		System.out.print("TYpe an integer: ");
		int n=p.nextInt();
		for(x=n;x>1;x--)
		{
			y = y * x;
			
		}
		System.out.print("Factorial is "+y);
		
	}
}