package com.handsontech.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.handsontech.service.Database;

public class City {
	
	public int getId() {
		return pid;
	}
	public void setId(int pid) {
		this.pid = pid;
	}
	public String getCityName() {
		return CityName;
	}
	public void setCityName(String cityName) {
		CityName = cityName;
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
	public String getContinent() {
		return Continent;
	}
	public void setContinent(String continent) {
		Continent = continent;
	}
	//---------------Database Queries 
	
	public int getPID(int CityCode) throws SQLException{
		Database db = new Database();
		ResultSet rs = db.getResultSet("Select PID from placesRelation where City_Id="+CityCode+";");
		int PID = 0;
		if(rs.next()) {
			PID = rs.getInt("PID");
		}
		rs.close();
		return PID;
	}
	
	public String getCountry(int CountryCode) throws SQLException{
		Database db = new Database();
		ResultSet rs = db.getResultSet("Select Country from Coutnry where Country_Id="+CountryCode+";");
		String Country = null;
		if(rs.next()) {
			Country = rs.getString("Country");
		}
		rs.close();
		return Country;
	}
	
	public String getCity(int PlaceCode) throws SQLException{
		Database db = new Database();
		ResultSet rs = db.getResultSet("Select City from Cities where City_Id IN (Select City_ID from PlacesRelation where PID="+PlaceCode+");");
		String City = null;
		if(rs.next()){
			City = rs.getString("City");
		}
		rs.close();
		return City;
	}
	
	public String getState(int StateCode) throws SQLException{
		Database db = new Database();
		ResultSet rs = db.getResultSet("Select State from States where State_Id="+StateCode+";");
		String Satate = null;
		if(rs.next()) {
			State = rs.getString("State");;
		}
		rs.close();
		return State;
	}
	
	public String getContinent(int ContinentCode) throws SQLException{
		Database db = new Database();
		ResultSet rs = db.getResultSet("Select Continent from Continents where State_Id="+ContinentCode+";)");
		String Continent = null;
		if(rs.next()) {
			Continent = rs.getString("Continent");;
		}
		rs.close();
		return Continent;
	}
	
	public String getJSONPath() throws SQLException{
		Database dbase = new Database();
		ResultSet rs= dbase.getResultSet("Select Location from metadata where name='JSONFile';");
		String Location = null;
		if(rs.next()) {
			Location = rs.getString("Location");
		}
		rs.close();
		return Location;
	}
	
	
	public String getTextPath() throws SQLException{
		Database dbase = new Database();
		ResultSet rs= dbase.getResultSet("Select Location from metadata where name='PlaceAboutText';");
		String Location = null;
		if(rs.next()) {
			Location = rs.getString("Location");
		}
		rs.close();
		return Location;
	}
	
	
	public String getImagePath() throws SQLException{
		Database dbase = new Database();
		ResultSet rs= dbase.getResultSet("Select Location from metadata where name='PlaceImages';");
		String Location = null;
		if(rs.next()) {
			Location = rs.getString("Location");
		}
		rs.close();
		return Location;
	}
	
	public String getTagLine(int PID) throws SQLException{
		Database dbase = new Database();
		ResultSet rs= dbase.getResultSet("Select TagLine from Placedata where PID="+PID+";");
		String Tagline = null;
		if(rs.next()) {
			Tagline = rs.getString("TagLine");
		}
		rs.close();
		return Tagline;
	}
	
	private int pid;
	private String CityName = null;
	private String State;
	private String Country;
	private String Continent;
}
