/*
WhatsApp: +91-8895174939
Email: mailtopksubudhi@gmail.com
Web: www.pksubudhi.com
*/
public class Car extends Vehicle implements Comparable<Car>, Announcements {
	private int numDoors;
	private int numWindows;
	public Car(int numDoors, int numWindows) {
		super(2,2);
		this.numDoors = numDoors;
		this.numWindows = numWindows;
	}
	public Car(int numDoors, int numWindows, int numSeatsPerRow) {
		super(2, numSeatsPerRow);
		this.numDoors = numDoors;
		this.numWindows = numWindows;
	}
	public Car(int numDoors, int numWindows, int[] numSeatsPerRow) {
		super(numSeatsPerRow);
		this.numDoors = numDoors;
		this.numWindows = numWindows;
	}
	public Car(int numDoors, int numWindows, Person driver, int[] numSeatsPerRow) {
		super(driver, numSeatsPerRow);
		this.numDoors = numDoors;
		this.numWindows = numWindows;
	}
	public boolean canOpenDoor(Person p) {
		if(isPersonInVehicle(p)) {
			if(p.getAge() > 5) {
				int[] seatPosition = getLocationOfPersonInVehicle(p);
				int rowPosition = seatPosition[0];
				if (numDoors >= (rowPosition * 2) ) {
					int totSeatsInThisRow = numSeatsPerRow[seatPosition[0]];
					if( (seatPosition[1] == 0) || (seatPosition[1] == (totSeatsInThisRow-1)) ) {
						return true;
					}
					else {
						return false;
					}
				}
				else {
					return false;
				}
			}
			else {
				return false;
			}
		}
		else {
			return false;
		}
	}
	
	public boolean canOpenWindow(Person p) {
		if(isPersonInVehicle(p)) {
			if(p.getAge() > 2) {
				int[] seatPosition = getLocationOfPersonInVehicle(p);
				int rowPosition = seatPosition[0];
				if (numWindows >= (rowPosition * 2) ) {
					int totSeatsInThisRow = numSeatsPerRow[seatPosition[0]];
					if( (seatPosition[1] == 0) || (seatPosition[1] == (totSeatsInThisRow-1)) ) {
						return true;
					}
					else {
						return false;
					}
				}
				else {
					return false;
				}
			}
			else {
				return false;
			}
		}
		else {
			return false;
		}
	}
	
	public int getNumDoors() {
		return numDoors;
	}
	public int getNumWindows() {
		return numWindows;
	}
	
	//Overring methods
	@Override
	public boolean equals(Object o) {
		if(o instanceof Car) {
			Car arg = (Car) o;
			if(this.numDoors == arg.numDoors) {
				if(this.numWindows == arg.numWindows) {
					if(this.numberOfRows == arg.numberOfRows) {
						if(this.maxSeatsPerRow == arg.maxSeatsPerRow) {
							for(int i = 0; i < arg.numberOfRows; i++) {
								if(this.numSeatsPerRow[i] != arg.numSeatsPerRow[i]) {
									return false;
								}
							}
							return true;
						}
					}
				}
			}
		}
		return false;
	}
	
	@Override
	public String toString() {
		String numSeats = "[ ";
		int i, j;
		for(i = 0; i < numSeatsPerRow.length-1; i++) {
			numSeats = numSeats + numSeatsPerRow[i] + ", ";
		}
		numSeats = numSeats + numSeatsPerRow[i] + " ]";

		String nameOfPeople = "";
		Person temp;
		for(i = 0; i < personsOnBoard.length; i++) {
			for(j = 0; j < personsOnBoard[i].length; j++) {
				temp =getPersonInSeat(i, j);
				if(temp != null) {
					if( i < personsOnBoard.length-1) {
						nameOfPeople = nameOfPeople + temp.getName() + ", ";	
					}
					else {
						if(j < personsOnBoard[i].length-1) {
							nameOfPeople = nameOfPeople + temp.getName() + ", ";
						}
						else {
							nameOfPeople = nameOfPeople + temp.getName();
						}
					}
				}
				else {
					if( i < personsOnBoard.length-1) {
						nameOfPeople = nameOfPeople + "EMPTY " + ", ";
					}
					else {
						if(j < personsOnBoard[i].length-1) {
							nameOfPeople = nameOfPeople + "EMPTY " + ", ";
						}
						else {
							nameOfPeople = nameOfPeople + "EMPTY ";
						}
					}
				}
			}
		}
		return String.format("Car: number of doors = %02d | number of windows = %02d | number of rows = %02d | seats per row = %s | names of people on board = %s\n", numDoors, numWindows, numberOfRows, numSeats, nameOfPeople);
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

	//Overriding compareTo() method in Comparable inferface which is implemented
	@Override
	public int compareTo(Car arg) {
		int totSeat = 0, totSeatInArg = 0;
		for(int i = 0; i < this.numSeatsPerRow.length; i++) {
			totSeat = totSeat + this.numSeatsPerRow[i];
		}
		for(int i = 0; i < arg.numSeatsPerRow.length; i++) {
			totSeatInArg = totSeatInArg + arg.numSeatsPerRow[i];
		}
		if(totSeat == totSeatInArg) {
			return 0;
		}
		else if(totSeat < totSeatInArg) {
			return -1;
		}
		else {
			return 1;
		}
	}

	//Overriding methods in the implemented interface Announcement
	@Override
	public String departure() {
		return "All Aborad\n";
	}
	@Override
	public String arrival() {
		return "Everyone Out\n";
	}
	@Override
	public String doNotDisturbTheDriver() {
		return "No Backseat Driving\n";
	}
}
