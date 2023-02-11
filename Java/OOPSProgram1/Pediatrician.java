import java.util.*;
import java.lang.*;

public class Pediatrician extends Doctor {
	private boolean hasPrivatePractice = false;
	private String hospitalName="";
	public Pediatrician(String name) {
		super(name);
	}
	public Pediatrician(String name, boolean hasPrivatePractice, String hospitalName) {
		super(name);
		this.hasPrivatePractice = hasPrivatePractice;
		this.hospitalName = hospitalName;
	}
	public boolean hasPrivatePractice() {
		return this.hasPrivatePractice;
	}
	public String getHospitalName() {
		return hospitalName;
	}
	public void setHospitalName(String str) {
		this.hospitalName = str;
	}
	public void addPatient(Patient patient) throws PatientException {
		if(isPatient(patient)) {
			super.addPatient(patient);
		}
		else {
			System.out.println("Cannot Add this patient! Age exceeds 18 years!");
		}
	}
	@Override
	public boolean isPatient(Patient patient) {
		if (patient.getBirthYear() <= 18) {
			return true;
		}
		else {
			return false;
		}
	}
	
	@Override
	public String toString() {
		return super.toString() + String.format("Pediatrician: %s | hospital name=%15s",(hasPrivatePractice? "has private practice" : "does not have private practice"), hospitalName);
	}
	@Override
	public boolean equals(Object o) {
		Pediatrician arg = (Pediatrician) o;

		if(this.hasPrivatePractice == arg.hasPrivatePractice) {
			if(this.hospitalName.equals(arg.hospitalName)) {
				return true;
			}
		}
		return false;
	}
}