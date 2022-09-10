/*
WAP to check if the input number is Odd or even


Contact: mailtopksubudhi@gmail.com
WhatsApp: +91-8895174939
website: www.pksubudhi.com
*/

import java.lang.*;
import java.util.*;
class OddEven
{
	public static void main (String args[])
	{
		int x;
		Scanner inp=new Scanner(System.in);
		System.out.print("Type an integer: ");
		x=inp.nextInt();
		if(x%2==0)
		{
			System.out.println("Even");
		}
		else
		{
			System.out.println("Odd");
		}
	}
}