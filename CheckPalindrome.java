/*
WAP to check if input integer is Palindrome or not


Contact: mailtopksubudhi@gmail.com
WhatsApp: +91-8895174939
website: www.pksubudhi.com
*/
import java.util.*;
class CheckPalindrome
{
	public static void main (String args[])
	{
		int s=0, temp;
		Scanner p=new Scanner(System.in);
		System.out.print("Type an Integer: ");
		int n=p.nextInt();
		temp=n;
		while(n>0)
		{
			s=(s*10)+(n%10);
			n=n/10;		
		}
		if(temp==s)
		{
			System.out.println("Palindrome");
		}
		else
		{
			System.out.println("Not Palindrome");
		}
	}
}