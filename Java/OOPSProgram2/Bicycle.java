/*
WhatsApp: +91-8895174939
Email: mailtopksubudhi@gmail.com
Web: www.pksubudhi.com
*/
public class Bicycle extends Vehicle implements Comparable<Bicycle> {
	private double weight;
	static final double ACCURACY_RANGE = 0.5;
	public Bicycle() {
		super(1, 1);
		weight = 0;
	}
	public Bicycle(Person driver) {
		super(driver, new int[] {1});
		weight = 0;
	}
	public Bicycle(Person driver, double weight) {
		super(driver, new int[] {1});
		if(weight < 0) this.weight = 0;
		else this.weight = weight;
	}
	public double getWeight() {
		return weight;
	}
	public void setWeight(double  w) {
		weight = w;
	}
	public void setDriver(Person p) throws InvalidDriverException {
		if(p.hasDriverLicense()) {
			this.personsOnBoard[0][0] = p;
		}
		else {
			throw new InvalidDriverException("Person does not have valid Driver License");
		}
	}
	@Override
	public String toString() {
		return "Bicycle [rider = " + getDriver().getName() + " | weight = " + weight + "]";
	}
	@Override
	public boolean equals(Object o) {
		if(o instanceof Bicycle) {
			Bicycle arg = (Bicycle) o;
			double weightDiff = this.weight - arg.weight;
			if (weightDiff < 0) weightDiff = -weightDiff;
			if(weightDiff <= ACCURACY_RANGE) {
				return true;
			}
		}
		return false;
	}
	@Override
	public int compareTo(Bicycle b) {
		double weightDiff = this.weight - b.weight;
		double absWeightDiff = 0;

		if(weightDiff < 0) {
			absWeightDiff = -weightDiff;
			if(absWeightDiff > ACCURACY_RANGE) {
				return -1;
			}
			else {
				return 0;
			}
		}
		else if (weightDiff > 0) {
			if(weightDiff > ACCURACY_RANGE) {
				return 1;
			}
			else {
				return 0;
			}
		}
		else {
			return 0;
		}
		
	}
	//Overriding abstract method in the parent class Vehicle
	@Override
	public boolean loadPassenger(Person p) {
		if(!isPersonInVehicle(p)) {
			if(getNumberOfAvailableSeats() > 0) {
				for(int i = 0; i < numberOfRows; i++) {
					if(getNumberOfAvailableSeatsInRow(i) > 0) {
						for(int j = 0; j < numSeatsPerRow[i] ; j++) {
							if( (i != 0) && ( j != 0 ) ){ //This is Driver Seat
								if(i == 0) {
									if(personsOnBoard[i][j] == null) {
										if((p.getAge() > 5) && (p.getHeight() > 36) ) {
											personsOnBoard[i][j] = p;
											return true;
										}
									}
								}
								else {
									if(personsOnBoard[i][j] == null) {
										personsOnBoard[i][j] = p;
										return true;
									}
								}
							}
						}
					}
				}
			}
			else {
				return false;
			}
		}
		else {
			return false;
		}
		return false;
	}
	@Override
	public int loadPassengers(Person[] peeps) {
		int count = 0;
		if(getNumberOfAvailableSeats() >= peeps.length ) {
			for(int i = 0; i < peeps.length; i++) {
				if(loadPassenger(peeps[i])) {
					count++;
				}
			}
			return peeps.length;
		}
		else {
			int i = 0;
			while((getNumberOfAvailableSeats() > 0) && (i<(peeps.length-1))) {
				if(loadPassenger(peeps[i])) {
					count++;
				}
				i++;
			}
		}
		return count;
	}
}
