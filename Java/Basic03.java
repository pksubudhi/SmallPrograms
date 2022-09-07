/*
A program to display the biggest among two input integers
*/
import java.util.*;
class Basic03
{
	public static void main(String args[])
	{
		Scanner input=new Scanner(System.in);
		int x, y;
		System.out.print("Type an integer: ");
		x=input.nextInt();
		System.out.print("Type another integer: ");
		y=input.nextInt();
		if(x>y)
		{
			System.out.println(x+" is big!");
		}
		else
		{
			System.out.println(y+" is big!");
		}
	}
}