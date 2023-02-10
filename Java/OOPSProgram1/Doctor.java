import java.lang.*;
import java.util.*;

public class Doctor implements SeesPatients, Comparable<Doctor> {
	private static int numDoctors = 0;
	private String name;
	private int licenseNumber;
	private Patient[] patients;
	private int numberOfPatients;
	public Doctor(String name) {
		this.name = name;
		patients = new Patient[MAX_PATIENTS];
		licenseNumber = (++numDoctors);
		numberOfPatients = 0;
	}
	public static int getNumDoctors() {
		return numDoctors;
	}
	public int getLicenseNumber() {
		return licenseNumber;
	}
	public String getName() {
		return name;
	}
	public int getNumberOfPatients() {
		return numberOfPatients;
	}
	public String getPatientsAsString() {
		String str="";
		if (numberOfPatients > 0) {
			int index;
			str = "patients= ";
			for(index = 0 ; index < numberOfPatients-1; index ++) {
				str = str + patients[index].toString() + ", ";
			}
			str = str + patients[index].toString();
		}
		return str;
	}
	public boolean isPatient(Patient patient) {
		boolean flag=false;
		if(numberOfPatients > 0) {
			for(int index=0; index < numberOfPatients; index++) {
				if(patients[index].equals(patient)) {
					flag=true;
				}
			}
		}
		return flag;
	}
	public Patient[] getPatients() {
		return patients;
	}
	public void addPatient(Patient patient) throws PatientException {
			if(numberOfPatients < MAX_PATIENTS) {
				patients[numberOfPatients++] = patient;
			}
			else {
				throw new PatientException("Patient Limit is full! Unable to add a Patient");
			}
	}
	@Override
	public String toString() {
		return String.format("Doctor: name= %20s | license number= %06d | %s", name, licenseNumber, getPatientsAsString());
	}
	@Override
	public boolean equals(Object o) {
		if( o instanceof Doctor) {
			Doctor arg = (Doctor) o;
			if(this.name.equals(arg.name)) {
				if(this.licenseNumber == arg.licenseNumber) {
					if(this.numberOfPatients == arg.numberOfPatients) {
						if(Arrays.deepEquals(this.patients, arg.patients)) {
							return true;
						}
					}
				}
			}
		}
		return false;
	}
	@Override
	public int compareTo(Doctor arg) {
		if(this.numberOfPatients > arg.numberOfPatients) {
			return 1;
		}
		else if(this.numberOfPatients < arg.numberOfPatients) {
			return -1;
		}
		else {
			return 0;
		}
		
	}
}