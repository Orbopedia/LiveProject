
<%@ page import="java.sql.*"%>
<%@ page import="com.handsontech.service.Database" %>

<%
	try {
		System.out.print("=++++++++++++");
		Database db = new Database();
		ResultSet rs = db.getResultSet("Select Continent from Continents;");
		while (rs.next()) {
			out.println((rs.getString("Continent")));
		}
	} catch (Exception e) {
		System.out.println(e.getMessage());
	}
%>
