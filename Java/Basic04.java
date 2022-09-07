/*
Biggest among 3 integers
*/
import java.util.*;
class Basic04
{
	public static void main(String args[])
	{
		int x=5, y=9, z=3;
		int d;
		System.out.println("Numbers are: "+x+", "+y+", "+z);
		d=x;
		if(y>d)
		{
			d=y;
		}
		if(z>d)
		{
			d=z;
		}
		System.out.println(d+" is biggest!");
	}
}