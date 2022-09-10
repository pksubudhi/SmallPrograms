/*
WAP to find the biggest among two integers where numbers are passed as command line argument


Contact: mailtopksubudhi@gmail.com
WhatsApp: +91-8895174939
website: www.pksubudhi.com
*/
class BigOfTwo
{
	public static void main (String args[])
	{
		int x, y;
		x=Integer.parseInt(args[0]);
		y=Integer.parseInt(args[1]);
		if(x>y)
		{
			System.out.println(x+" is Big");
		}
		else
		{
			System.out.println(y+" is Big");
		}
	}
}