/*
WAP to reverse an input number


Contact: mailtopksubudhi@gmail.com
WhatsApp: +91-8895174939
website: www.pksubudhi.com
*/
import java.util.*;
class ReverseNumber
{
	public static void main (String args[])
	{
		int s=0;
		Scanner p=new Scanner(System.in);
		System.out.print("Type an Integer: ");
		int n=p.nextInt();
		while(n>0)
		{
			s=(s*10)+(n%10);
			n=n/10;		
		}
		System.out.println("Reverse Numver is "+s);
	}
}