package com.handsontech.service;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class Database implements DatabaseGlobal{
	
	public Connection getConnection() {
		try {
			Class.forName(DRIVER);
			Connection conn = DriverManager.getConnection(CONNECTION_URL, USERNAME, PASSWORD);
			return conn;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Statement getStatement() {
		try {
			return getConnection().createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public ResultSet getResultSet(String query) {
			try {
				return getStatement().executeQuery(query);
			}catch(SQLException e) {
				e.printStackTrace();
			}
		return null;
	}
	
	public int executeUpdate(String query) {
		try {
			return getStatement().executeUpdate(query);
		}catch(SQLException e) {
			e.printStackTrace();
		}
	return 0;
	}
	
	public void closeConnection() {
		try {
			getStatement().close();
			getConnection().close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	
	static public void DatabaseConnect(String query) {
		try {
			Class.forName(DRIVER);
			Connection conn = DriverManager.getConnection(CONNECTION_URL, USERNAME, PASSWORD);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()) {
				System.out.println(rs.getString("uname"));
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
}
