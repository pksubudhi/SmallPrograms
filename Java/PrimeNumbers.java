/*
WAP to display Prime Numbers between 1000


Contact: mailtopksubudhi@gmail.com
WhatsApp: +91-8895174939
website: www.pksubudhi.com
*/

class PrimeNumbers
{
	public static void main (String args[])
	{
		int x, n;
		for(n=2; n<=1000; n++)
		{
			for(x=2; x<=n/2; x++)
			{
				if(n%x==0)
				{
					break;
				}
			
			}
		if (x>(n/2))
		System.out.print(n+" ");
		}
	}
}