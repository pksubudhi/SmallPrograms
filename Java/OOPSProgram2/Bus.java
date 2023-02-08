public class Bus extends Car {
	public Bus(int[] numSeatsPerRow) {
		super(2, (2 * numSeatsPerRow.length) - 1, numSeatsPerRow);
	}
	public Bus(Person driver, int[] numSeatsPerRow) {
		super(2, (2 * numSeatsPerRow.length) - 1, driver, numSeatsPerRow);
	}
	public boolean canOpenDoor(Person p) {
		if(personsOnBoard[0][0].equals(p)) {
			return true;
		}
		int[] personPosition = null;
		personPosition = getLocationOfPersonInVehicle(p);
		Person[] lastPopRow = null;
		Person[] temp = null;
		for(int i = 0; i<numberOfRows; i++) {
			temp = getPeopleInRow(i);
			if(temp != null) {
				lastPopRow =  temp;
			}
		}

		for(int i = 0; i < lastPopRow.length; i++) {
			if(lastPopRow[i].equals(p)) {
				if((p.getAge() > 5) && (p.getHeight() > 40) ) {
					return true;
				}
			}
		}
		return false;
	}
	public boolean canOpenWindow(Person p) {
		if((super.canOpenWindow(p)) && (p.getAge() > 5)) {
			return true;
		}
		else {
			return false;
		}
	}
	
	@Override
	public String toString() {
		return "Bus is an extension of " + super.toString();
	}
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
