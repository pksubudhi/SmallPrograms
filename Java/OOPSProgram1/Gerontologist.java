import java.util.*;
import java.lang.*;

public class Gerontologist extends Doctor {
	private boolean performsHouseCalls = true;
	private double visitFee=0.0;
	public Gerontologist(String name) {
		super(name);
	}
	public Gerontologist(String name, boolean performsHouseCalls, double fees) {
		super(name);
		this.performsHouseCalls = performsHouseCalls;
		visitFee = fees;
	}
	public boolean performsHouseCalls() {
		return this.performsHouseCalls;
	}
	public double getVisitFee() {
		return visitFee;
	}
	public void setPerformsHouseCalls(boolean performsHouseCalls) {
		this.performsHouseCalls = performsHouseCalls;
	}
	public void setVisitFee(double visitFee) {
		this.visitFee = visitFee;
	}
	public void addPatient(Patient patient) throws PatientException {
		if(isPatient(patient)) {
			super.addPatient(patient);
		}
		else {
			System.out.println("Cannot Add this patient! Age is below or equal to 65 years!");
		}
	}
	@Override
	public boolean isPatient(Patient patient) {
		if (patient.getBirthYear() > 65) {
			return true;
		}
		else {
			return false;
		}
	}
	
	@Override
	public String toString() {
		return super.toString() + String.format("\nGerontologist: %s visit fee=%02.2f",(performsHouseCalls?"performs house calls":"no house calls"), visitFee);
	}
	@Override
	public boolean equals(Object o) {
		Gerontologist arg = (Gerontologist) o;
		if(this.performsHouseCalls == arg.performsHouseCalls) {
			if(this.visitFee == arg.visitFee) {
				return true;
			}
		}
		return false;
	}
}