package com.handsontech.beans;

import java.sql.Date;

import com.handsontech.model.AddPlace;

public class ProjectBean {
	
	private String pCity, pState, pCountry, pContinent, Image;
	private Date PcreationDate;
	int City_ID, State_ID, Country_ID, Continent_ID, PID;
	AddPlace addPlace = new AddPlace();
	
	public int getPID() {
		return PID;
	}
	public void setPID(int pID) {
		PID = pID;
	}
	public int getCity_ID() {
		return City_ID;
	}
	public void setCity_ID(int city_ID) {
		City_ID = city_ID;
		setpCity(addPlace.getCityName(city_ID));
	}
	public int getState_ID() {
		return State_ID;
	}
	public void setState_ID(int state_ID) {
		State_ID = state_ID;
		setpState(addPlace.getStateName(state_ID));
	}
	public int getCountry_ID() {
		return Country_ID;
	}
	public void setCountry_ID(int country_ID) {
		Country_ID = country_ID;
		setpCountry(addPlace.getCountryName(country_ID));
	}
	public int getContinent_ID() {
		return Continent_ID;
	}
	public void setContinent_ID(int continent_ID) {
		Continent_ID = continent_ID;
		setpContinent(addPlace.getCountryName(continent_ID));
	}
	public String getpCity() {
		return pCity;
	}
	public void setpCity(String pCity) {
		this.pCity = pCity;
	}
	public String getpState() {
		return pState;
	}
	public void setpState(String pState) {
		this.pState = pState;
	}
	public String getpCountry() {
		return pCountry;
	}
	public void setpCountry(String pCountry) {
		this.pCountry = pCountry;
	}
	public String getpContinent() {
		return pContinent;
	}
	public void setpContinent(String pContinent) {
		this.pContinent = pContinent;
	}
	public String getImage() {
		return Image;
	}
	public void setImage(String image) {
		Image = image;
	}
	public Date getPcreationDate() {
		return PcreationDate;
	}
	public void setPcreationDate(Date pcreationDate) {
		PcreationDate = pcreationDate;
	}
}
