/*
WhatsApp: +91-8895174939
Email: mailtopksubudhi@gmail.com
Web: www.pksubudhi.com
*/
public abstract class Vehicle{
	protected Person[][] personsOnBoard;
	protected int numberOfRows;
	protected int maxSeatsPerRow;
	protected int[] numSeatsPerRow;

	//Constructors
	public Vehicle(int numRows, int numSeatsPerRow) {
		this.numberOfRows = numRows;
		this.personsOnBoard = new Person[numRows][];
		this.numSeatsPerRow = new int[numRows];
		for(int i=0; i < numRows; i++) {
			this.numSeatsPerRow[i] = numSeatsPerRow;
			this.personsOnBoard[i] = new Person[numSeatsPerRow];
		}
		
	}
	public Vehicle(int[] numSeatsPerRow) {
		this.numberOfRows=numSeatsPerRow.length;
		this.personsOnBoard = new Person[numSeatsPerRow.length][];
		this.numSeatsPerRow = new int[numSeatsPerRow.length];
		for(int i=0; i < numSeatsPerRow.length; i++) {
			this.numSeatsPerRow[i] = numSeatsPerRow[i];
			this.personsOnBoard[i] = new Person[numSeatsPerRow[i]];
		}
	}
	public Vehicle(Person driver, int[] numSeatsperRow) {
		this.numberOfRows=numSeatsPerRow.length;
		this.personsOnBoard = new Person[numSeatsPerRow.length][];
		this.numSeatsPerRow = new int[numSeatsPerRow.length];
		for(int i = 0; i < numSeatsPerRow.length; i++) {
			this.numSeatsPerRow[i] = numSeatsPerRow[i];
			this.personsOnBoard[i] = new Person[numSeatsPerRow[i]];
		}
		this.personsOnBoard[0][0] = driver;
	}

	//Abstract methods must be implemented in the child class
	public abstract boolean loadPassenger(Person p);
	public abstract int loadPassengers(Person[] peeps);

	//Method to set a driver who has valid driver license
	public void setDriver(Person p) throws InvalidDriverException {
		if(p.hasDriverLicense()) {
			this.personsOnBoard[0][0] = p;
		}
		else {
			throw new InvalidDriverException("Person does not have valid Driver License");
		}
	}
	
	//Returning Driver if available
	public Person getDriver() {
		return personsOnBoard[0][0];
	}

	public boolean hasDriver() {
		if(personsOnBoard[0][0] != null) {
			return true;
		}
		else {
			return false;
		}
	}
	//Returns count of seats that has null (no person available)
	public int getNumberOfAvailableSeats() {
		int count = 0;
		for(int i = 0; i < personsOnBoard.length; i++) {
			for(int j = 0; j < personsOnBoard[i].length; j++) {
				if(personsOnBoard[i][j] == null) {
					count++;
				}
			}
		}
		return count;
	}
	//Returning available seats in a given row
	public int getNumberOfAvailableSeatsInRow(int row) {
		int count = 0;
		if(row >= personsOnBoard.length) {
			return -1;
		}
		else {
			for(int i = 0; i < personsOnBoard[row].length; i++) {
				if(personsOnBoard[row][i] == null) {
					count++;
				}
			}
		}
		return count;
	}
	
	public int getNumberOfPeopleOnBoard() {
		int count = 0;
		for(int i = 0; i < personsOnBoard.length; i++) {
			for(int j = 0; j < personsOnBoard[i].length; j++) {
				if(personsOnBoard[i][j] != null) {
					count++;
				}
			}
		}
		return count;
	}
	
	public int getNumberOfPeopleInRow(int row) {
		int count = 0;
		if( (row >= personsOnBoard.length) || (row < 0)) {
			return -1;
		}
		else {
			for(int i = 0; i < personsOnBoard[row].length; i++) {
				if(personsOnBoard[row][i] != null) {
					count++;
				}
			}
		}
		return count;
	}
	
	public Person getPersonInSeat(int row, int col) {
		return personsOnBoard[row][col];
	}
	
	public int[] getLocationOfPersonInVehicle(Person p) {
		int[] seatPosition = new int[2];
		seatPosition[0] = -1;
		seatPosition[1] = -1;
		for(int i = 0; i < personsOnBoard.length; i++) {
			for(int j = 0; j<personsOnBoard[i].length; j++) {
				if(personsOnBoard[i][j].equals(p)) {
					seatPosition[0] = i;
					seatPosition[1] = j;
					return seatPosition;
				}
			}
		}
		return seatPosition;
	}
	
	public Person[] getPeopleInRow(int row) {
		Person[] availablePersons = null;
		if((row <= 0) || (row >= personsOnBoard.length)) {
			return null;
		}
		else {
			int count = 0;
			for(int i = 0; i < personsOnBoard[row].length; i++) {
				if(personsOnBoard[row][i] != null) {
					count++;
				}
			}
			if(count > 0) {
				availablePersons = new Person[count];
				int index=0;
				for(int i = 0; i < personsOnBoard[row].length; i++) {
					if(personsOnBoard[row][i] != null) {
						availablePersons[index++] = personsOnBoard[row][i].clone();
					}
				}
			}
			else {
				return null;
			}
		}
		return availablePersons;
	}
	
	public Person[][] getPeopleOnBoard() {
		Person[][] availablePersons = new Person[personsOnBoard.length][];
		for(int i = 0; i < personsOnBoard.length; i++) {
			availablePersons[i] = new Person[personsOnBoard[i].length];
			for(int j = 0; j < personsOnBoard[i].length; j++) {
				availablePersons[i][j] = personsOnBoard[i][j].clone();
			}
		}
		return availablePersons;
	}
	
	public boolean isPersonInVehicle(Person p) {
		for(int i = 0; i < personsOnBoard.length ; i++) {
			for(int j = 0; j < personsOnBoard[i].length; j++) {
				if(personsOnBoard[i][j].equals(p)) {
					return true;
				}
			}
		}
		return false;
	}
	public boolean isPersonDriver(Person p) {
		if(personsOnBoard[0][0] != null) {
			if(personsOnBoard[0][0].equals(p)) {
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
}
