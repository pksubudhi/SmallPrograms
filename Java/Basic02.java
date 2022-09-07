/*
Reading an integer and checking if it is Odd or Even
*/
import java.util.*;
class Basic02
{
	public static void main(String args[])
	{
		Scanner input=new Scanner(System.in);
		int x;
		System.out.println("Type an integer: ");
		x=input.nextInt();
		if(x%2==0)
		{
			System.out.println("Even Number!");
		}
		else
		{
			System.out.println("Odd Number!");
		}
	}
}