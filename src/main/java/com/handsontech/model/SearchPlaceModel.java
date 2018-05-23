package com.handsontech.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.handsontech.service.Database;

public class SearchPlaceModel {
	public Database db = new Database();

	public ArrayList<Pair> getAllCities(String CityInitial) {
		ArrayList<Pair> hm = new ArrayList<Pair>();
		try {
			ResultSet rs = db.getResultSet("Select * from cities where city like '%"+CityInitial+"%' Order by City Limit 6;");
			while(rs.next()) {
				Pair pair = new Pair(rs.getInt("City_ID"), rs.getInt("StateID"), rs.getString("city"));
				hm.add(pair);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return hm;
	}
	
	
	
	public class Pair{
		public int CityId, StateId;
		public String CityName;
		Pair(int CityId, int StateId, String CityName){
			this.CityId = CityId;
			this.StateId = StateId;
			this.CityName = CityName;
		}
	}
}
