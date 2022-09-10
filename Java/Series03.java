/*
WAP to display the following
1 4 9 16 25 36 49... for n values where n is user input



Contact: mailtopksubudhi@gmail.com
WhatsApp: +91-8895174939
website: www.pksubudhi.com
*/
import java.util.*;
class Series03
{
	public static void main (String args[])
	{
		int x;
		Scanner p=new Scanner(System.in);
		System.out.print("How many values you want to print: ");

		int n=p.nextInt();
		for(x=1;x<=n;x++)
		{
			System.out.print((x*x)+" ");
		}
	}
}