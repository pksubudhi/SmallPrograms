/*

WAP to display the following series
1 4 9 16 25 36 49... for n values where n is command line argument



Contact: mailtopksubudhi@gmail.com
WhatsApp: +91-8895174939
website: www.pksubudhi.com
*/
class Series02
{
	public static void main (String args[])
	{
		int x;
		int n=Integer.parseInt(args[0]);
		for(x=1;x<=n;x++)
		{
			System.out.print((x*x)+" ");
		}
	}
}