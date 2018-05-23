package com.handsontech.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.handsontech.service.Database;

public class AddPlace {
	public Database db = new Database();
	
	public int checkCity(String CityName) {
		try {
			int City_ID = 0;
			ResultSet rs = db.getResultSet("Select City_ID from cities where city='"+CityName+"';");
			if(rs.first()) {
				City_ID = rs.getInt("City_ID");
				return City_ID;
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
	
		}
		return -1;
	}
	
	public int checkState(String StateName) {
		try {
			int State_ID = 0;
			ResultSet rs = db.getResultSet("Select State_Id from States where State='"+StateName+"';");
			if(rs.first()) {
				State_ID = rs.getInt("State_ID");
				return State_ID;
			}
			rs.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int checkCountry(String Country) {
		try {
			int Country_ID = 0;
			//ResultSet rs = db.getResultSet("Select Country_id, Continent from cities where Country='"+Country+"';");
			ResultSet rs = db.getResultSet("Select Country_id from Country where Country='"+Country+"';");
			if(rs.first()) {
				Country_ID = rs.getInt("Country_id");
				//Continent = rs.getInt("Continent");
				return Country_ID;
			}
			rs.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int checkContinent(String Continent) {
		try {
			int Country_ID = 0;
			ResultSet rs = db.getResultSet("Select Continent_ID from Continents where Continent='"+Continent+"';");
			if(rs.first()) {
				Country_ID = rs.getInt("Continent_ID");
				return Country_ID;
			}
			rs.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int checkAvailability(String Query) {
		try {
			ResultSet rs = db.getResultSet(Query);
			while(rs.next()) {
				int ID = rs.getInt("PID");
				return ID;
			}
			rs.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int checkPID() {
		try {
			ResultSet rs = db.getResultSet("Select Max(PID) from PlacesRelation;");
			while(rs.next()) {
				int ID = rs.getInt("Max(PID)");
				return ID+1;
			}
			rs.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public String getCityName(int City_Id) {
		try {
			ResultSet rs = db.getResultSet("Select City from cities where City_ID="+City_Id+";");
			while(rs.next()) {
				String ID = rs.getString("City");
				return ID;
			}
			rs.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public String getStateName(int StateID) {
		try {
			ResultSet rs = db.getResultSet("Select State from states where State_ID="+StateID+";");
			while(rs.next()) {
				String ID = rs.getString("State");
				return ID;
			}
			rs.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public String getCountryName(int CountryID) {
		try {
			ResultSet rs = db.getResultSet("Select Country from Country where Country_ID="+CountryID+";");
			while(rs.next()) {
				String ID = rs.getString("Country");
				return ID;
			}
			rs.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public String getContinentName(int ContinentID) {
		try {
			ResultSet rs = db.getResultSet("Select Continent from Continents where Continent_ID="+ContinentID+";");
			while(rs.next()) {
				String ID = rs.getString("Continent");
				return ID;
			}
			rs.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int getPlaceDetails(String City) {
		try {
			ResultSet rs = db.getResultSet("SELECT PID from PLACESRELATION where City_ID="+checkCity(City)+";");
			while(rs.next()) {
				int ID = rs.getInt("PID");
				return ID;
			}
			rs.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	
	
	public void finalize() {
		db.closeConnection();
	}
	
}
