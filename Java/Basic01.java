/*
Input/Output operation in Java  using Scanner class and println() method
*/
import java.util.*;
class Basic01
{
	public static void main(String args[])
	{
		Scanner input=new Scanner(System.in);
		int x;
		System.out.println("Type an integer: ");
		x=input.nextInt();
		System.out.println("You have typed: "+x);
	}
}