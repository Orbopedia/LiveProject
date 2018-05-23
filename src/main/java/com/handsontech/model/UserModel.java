package com.handsontech.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.handsontech.beans.UserBean;
import com.handsontech.service.Database;

public class UserModel {

	UserBean model = new UserBean();

	public UserBean setULFNameValues(int UID) {
		Database db = new Database();
		try {
			ResultSet rs = db.getResultSet("Select UName, LName, FName from users where UID = " + UID + ";");
			while (rs.next()) {
				model.setFName(rs.getString("FName"));
				model.setFName(rs.getString("LName"));
				model.setFName(rs.getString("UName"));
				model.setUID(UID);
			}
		} catch (SQLException e) {
			return null;
		}
		return model;
	}

	public UserBean setAllValues(int UID) {
		if (UID >= 0) {
			Database db = new Database();
			try {
				ResultSet rs = db.getResultSet("Select * from users where UID = " + UID + ";");
				while (rs.next()) {
					model.setFName(rs.getString("FName"));
					model.setLName(rs.getString("LName"));
					model.setUName(rs.getString("UserName"));
					model.setUID(UID);
					model.setEmail(rs.getString("Email"));
					model.setMobileNumber(rs.getLong("ph_no"));
					model.setDOB(rs.getString("DOB"));
				}
				rs.close();
				ResultSet rs2 = db.getResultSet("Select Count(UID) from UserCreation where UID = " + UID + ";");
				while (rs2.next()) {
					model.setNumberOfProjects(rs2.getInt("Count(UID)"));
				}
				rs2.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				return null;
			}
		}else {
			return null;
		}
		return model;
	}

}
