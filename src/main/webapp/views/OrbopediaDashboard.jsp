<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="com.handsontech.beans.UserBean" %>
<!DOCTYPE html>
<html>
<head>
	<% 
		UserBean UserModel = (UserBean) session.getAttribute("UserBeanObject");
	%>
	<title>Dashboard | Glance Screen</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="resources/css/w3.css">
	<style type="text/css"> 
		#sidebar{
			background-image: url('resources/Images/MaterialBack4-01.jpeg');
			background-size: 100% 100%;
			background-repeat: no-repeat;
			display: none; z-index: 5; width: 100%;
			height: 50%;
		}
		a:visited{color: black;}
		a:active{color: black;}
		a:link{text-decoration: none;}
		.scroll45{
			white-space: nowrap;
			overflow-x: auto;
			-webkit-overflow-scrolling: touch;
			-ms-overflow-style: -ms-autohiding-scrollbar;
		}
	</style>
</head>
<body>

	<!--START sidebar, SEO:-->
	<div id="sidebar" class="w3-sidebar w3-transparent w3-bar-block w3-animate-top w3-bottombar w3-border-white">
		<div style="background-color: black; opacity: 0.6;">
			<button class="w3-bar-item w3-button w3-hover-none" onclick="w3_close()"><i class="w3-text-white w3-large material-icons">close</i></button>
			<h3 style="text-align: center; color: white">Navigation</h3><hr>

			<a href="#" class="w3-button w3-text-white w3-padding w3-left w3-tooltip w3-hover-white" style="text-align: left; width: 100%; font-size: 18px;"><i class="material-icons w3-left">arrow_forward</i><span class="w3-text w3-tag w3-animate-left">You are at:</span> Glance Screen</a>

			<a href="DashboardNewProject" class="w3-button w3-text-white w3-padding w3-left w3-hover-white" style="text-align: left; width: 100%; font-size: 18px;"><i class="material-icons w3-left">arrow_forward</i> New Project</a>

			<a href="DashOpenProject.html" class="w3-button w3-text-white w3-padding w3-hover-white" style="text-align: left; width: 100%; font-size: 18px;"><i class="material-icons w3-left">arrow_forward</i> Open Project</a>
			
			<h3 style="text-align: center; color: white;">Account Settings</h3><hr>
			<a href="logout" class="w3-button w3-text-white w3-text-white w3-padding w3-hover-white" style="text-align: left; width: 100%; font-size: 18px;"><i class="material-icons w3-left">arrow_forward</i> Log Out</a>

			<a href="#" class="w3-button w3-text-white w3-padding w3-hover-white" style="text-align: left; width: 100%; font-size: 18px;"><i class="material-icons w3-left">arrow_forward</i> Delete Account</a>
		</div>
	<!--END sidebar:-->
	</div>


	<!--PAGE CONTENT-->
	<div class="w3-overlay w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" id="Overlay"></div>

	<!--TOPBAR-->
	<div class="w3-bar w3-padding-large w3-card-4 w3-teal">
		<h4 class="w3-wide w3-right w3-hide-small" style="font-family: 'Oswald', sans-serif;"><%=UserModel.getUName() %></h4>
		<i class="material-icons w3-xlarge w3-button w3-hover-none w3-right w3-hide-large w3-hide-medium">person</i>
		<a href="OrbopediaDashboard.html"><i class="material-icons w3-xlarge w3-button w3-hover-none w3-left">home</i></a>
	    <i class="material-icons w3-xlarge w3-button w3-hover-none w3-left" onclick="w3_open()">menu</i>
	</div>

	<div class="w3-container w3-animate-opacity">
		<h4 align="center" class="w3-wide">Welcome to workplace <%=UserModel.getFName() %></h4>
		<hr style="height:1px; background-color: grey">
		<h4 class="w3-wide">Workplace at a glance: </h4><br>
		<div class="scroll45">
			<table class="w3-table w3-bordered w3-hoverable">
				<tr>
					<td>Last Visited: </td>
					<td class="w3-right">Sat Jun 17</td>
				</tr>
				<tr>
					<td>Last opened project: </td>
					<td class="w3-right">Project name</td>
				</tr>
				<tr>
					<td>Projects done: </td>
					<td class="w3-right">Numbers</td>
				</tr>
				<tr>
					<td>Projects approved: </td>
					<td class="w3-right">Numbers</td>
				</tr>
			</table>
		</div>
	</div>

<script>
function w3_open() {
    document.getElementById("sidebar").style.display = "block";
    document.getElementById("Overlay").style.display = "block";
}
function w3_close() {
    document.getElementById("sidebar").style.display = "none";
    document.getElementById("Overlay").style.display = "none";
}
</script>
</body>
</html>