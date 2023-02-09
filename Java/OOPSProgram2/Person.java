/*
WhatsApp: +91-8895174939
Email: mailtopksubudhi@gmail.com
Web: www.pksubudhi.com
*/
public class Person 
{
	//Private fields
	private String name;
	private boolean hasDriverLicense;
	private int age;		// Age in years
	private int height;		// Height in inches

	// Constructors
	public Person(String name, boolean hasDriverLicense, int age, int height) 
	{
		this.name = name;
		this.hasDriverLicense = hasDriverLicense;
		this.age = age;
		this.height = height;
	}
	//Accessor Methods
	public String getName() 
	{
		return this.name;
	}
	public boolean hasDriverLicense() 
	{
		return this.hasDriverLicense;
	}
	public int getAge() 
	{
		return this.age;
	}
	public int getHeight() 
	{
		return this.height;
	}
	@Override
	public Person clone() 
	{
		Person tmp = new Person(this.name, this.hasDriverLicense, this.age, this.height);
		return tmp;
	}
	@Override
	public boolean equals(Object o) 
	{
		if(o instanceof Person) 
		{
			Person arg = (Person)o;
			if(this.name.equals(arg.name)) 
			{
				if(this.age == arg.age) 
				{
					if(this.height == arg.height) 
					{
						if(this.hasDriverLicense == arg.hasDriverLicense) 
						{
							return true;
						}
					}
				}
			}
		}
		return false;
	}
	@Override
	public String toString() 
	{
		//String licenseStatus = "has license";
		//if(!this.hasDriverLicense) licenseStatus = "no license";
		return String.format("Person [name= %10s | age= %02d | height= %02d | %s]",this.name, this.age, this.height, this.hasDriverLicense ? "has license" : "no license");
	}
}
