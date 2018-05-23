package com.handsontech.beans;

public class UserBean {
	private String UName = null;
	private String FName = null;
	private String LName = null;
	private int UID;
	private long mobileNumber;
	private String Email;
	private String City, State, Country, DOB;
	private int NumberOfProjects = 0;
	
	
	
	public String getDOB() {
		return DOB;
	}
	public void setDOB(String dOB) {
		DOB = dOB;
	}
	public long getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(long mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public String getEmail() {
		return Email;
	}
	public String getCity() {
		return City;
	}
	public void setCity(String city) {
		City = city;
	}
	public String getState() {
		return State;
	}
	public void setState(String state) {
		State = state;
	}
	public String getCountry() {
		return Country;
	}
	public void setCountry(String country) {
		Country = country;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getUName() {
		return UName;
	}
	public int getNumberOfProjects() {
		return NumberOfProjects;
	}
	public void setNumberOfProjects(int numberOfProjects) {
		NumberOfProjects = numberOfProjects;
	}
	public void setUName(String uName) {
		UName = uName;
	}
	public String getFName() {
		return FName;
	}
	public void setFName(String fName) {
		FName = fName;
	}
	public String getLName() {
		return LName;
	}
	public void setLName(String lName) {
		LName = lName;
	}
	public int getUID() {
		return UID;
	}
	public void setUID(int uID) {
		UID = uID;
	}
	
}
