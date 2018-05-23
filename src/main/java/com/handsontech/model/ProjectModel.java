package com.handsontech.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.handsontech.beans.ProjectBean;
import com.handsontech.service.Database;

public class ProjectModel {
	
	public ArrayList<ProjectBean> setData(int UID) {
		ArrayList<ProjectBean> list = new ArrayList<ProjectBean>();
			Database db = new Database();
			AddPlace addPlace = new AddPlace();
			try {
				ResultSet rs = db.getResultSet("SELECT PID,Date FROM USERCREATION where UID="+UID+";");
				while(rs.next()) {
					int PID = rs.getInt("PID");
					ProjectBean bean = setPlaceData(PID);
					bean.setPcreationDate(rs.getDate("Date"));
					list.add(bean);
					System.out.println("PID id : " + PID);
				}
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return list;
	}
	
	public ProjectBean setPlaceData(int PID) {
		ArrayList<ProjectBean> list = new ArrayList<ProjectBean>();
			Database db = new Database();
			ProjectBean bean = new ProjectBean();
			try {
				ResultSet rs = db.getResultSet("SELECT * FROM PlacesRelation where PID="+PID+";");
				while(rs.next()) {
					bean.setCity_ID(rs.getInt("City_ID"));
					bean.setState_ID(rs.getInt("State_ID"));
					bean.setCountry_ID(rs.getInt("Country_ID"));
					bean.setContinent_ID(rs.getInt("Continent_ID"));
					System.out.println(bean.getCity_ID() + "  " + bean.getpCity());
					bean.setPID(PID);
				}
				rs.close();
				
				ResultSet rs2 = db.getResultSet("SELECT CoverImage FROM PlaceData where PID="+PID+";");
				while(rs2.next()) {
					bean.setImage(rs2.getString("CoverImage"));
				}
				rs2.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return bean;
	}
}
