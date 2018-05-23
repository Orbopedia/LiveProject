package com.handsontech.service;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class DataDao {
	private Statement connection;
	private Database db;
	public DataDao() throws Exception {
		db = new Database();
		connection = db.getStatement();
	}

	public ArrayList<String> getFrameWork(String frameWork) {
		ArrayList<String> list = new ArrayList<String>();
		try {

			ResultSet rs = connection.executeQuery("Select Continent from Continents;");
			while (rs.next()) {
				String data = rs.getString("Continent");
				list.add(data);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}

	public ArrayList<String> getCountryWork(String frameWork) {
		ArrayList<String> list = new ArrayList<String>();
		try {

			ResultSet rs = connection
					.executeQuery("Select Country from Country where Continents in(Select Continent_Id from continents where Continent='" + frameWork + "');");
			while (rs.next()) {
				String data = rs.getString("Country");
				list.add(data);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}
	
	public ArrayList<String> getStateWork(String frameWork) {
		ArrayList<String> list = new ArrayList<String>();
		try {

			ResultSet rs = connection.executeQuery("Select State from States where CountryId in (Select Country_Id from Country where Country='" + frameWork + "');");
			//ResultSet rs = connection.executeQuery("Select State from States;");

			while (rs.next()) {
				String data = rs.getString("state");
				list.add(data);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}
	
	public ArrayList<String> getCityWork(String frameWork) {
		ArrayList<String> list = new ArrayList<String>();
		try {

			ResultSet rs = connection
					.executeQuery("Select City from Cities where StateId in (Select State_Id from States where State='" + frameWork + "');");
			while (rs.next()) {
				String data = rs.getString("City");
				list.add(data);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}
	
	@Override
	public void finalize(){
		db.closeConnection();
	}
	
}
