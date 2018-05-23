<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Dashboard | New Project</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script>
	$(document).ready(function() {
		$(function() {
			$("#inputContinent").autocomplete({
				source : function(request, response) {
					$.ajax({
						url : "LoadContinent",
						type : "GET",
						data : {
							term : request.term
						},
						dataType : "json",
						success : function(data) {
							response(data);
						} 
					});
				}
			});

			$("#inputCountry").autocomplete({
				source : function(request, response) {
					$.ajax({
						url : "LoadCountry",
						type : "GET",
						data : {
							val : $('#inputContinent').val()
						},
						dataType : "json",
						success : function(data) {
							response(data);
						}
					});
				}
			});

			$("#inputState").autocomplete({
				source : function(request, response) {
					$.ajax({
						url : "LoadState",
						type : "GET",
						data : {
							val : $('#inputCountry').val()
						},
						dataType : "json",
						success : function(data) {
							response(data);
						}
					});
				}
			});

			$("#inputCity").autocomplete({
				source : function(request, response) {
					$.ajax({
						url : "LoadCity",
						type : "GET",
						data : {
							val : $('#inputState').val()
						},
						dataType : "json",
						success : function(data) {
							response(data);
						}
					});
				}
			});

		});
	});
</script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">

<link rel="stylesheet" type="text/css"
	href='<c:url value="/resources/css/w3.css"/>'>
<style type="text/css">
#sidebar {
	background-image: url('Images/MaterialBack4-01.jpeg');
	background-size: 100% 100%;
	background-repeat: no-repeat;
	display: none;
	z-index: 5;
	width: 100%;
	height: 50%;
}

a:visited {
	color: black;
}

a:active {
	color: black;
}

a:link {
	text-decoration: none;
}

* { .border-radius (0) !important;
	
}

#field {
	margin-bottom: 20px;
}

.scroll45 {
	white-space: nowrap;
	overflow-x: auto;
	-webkit-overflow-scrolling: touch;
	-ms-overflow-style: -ms-autohiding-scrollbar;
}
</style>
</head>
<body>
	<!--START sidebar, SEO:-->
	<div id="sidebar"
		class="w3-sidebar w3-transparent w3-bar-block w3-animate-top w3-bottombar w3-border-white">
		<div style="background-color: black; opacity: 0.6;">
			<button class="w3-bar-item w3-button w3-hover-none"
				onclick="w3_close()">
				<i class="w3-text-white w3-large material-icons">close</i>
			</button>
			<h3 style="text-align: center; color: white">Navigation</h3>
			<hr>

			<a href="Dashboard.html"
				class="w3-button w3-text-white w3-padding w3-left w3-hover-white"
				style="text-align: left; width: 100%; font-size: 18px;"><i
				class="material-icons w3-left">arrow_forward</i> Glance Screen</a> <a
				href="#"
				class="w3-button w3-text-white w3-padding w3-left w3-tooltip w3-hover-white"
				style="text-align: left; width: 100%; font-size: 18px;"><i
				class="material-icons w3-left">arrow_forward</i><span
				class="w3-text w3-tag w3-animate-left">You are at:</span> New
				Project</a> <a href="DashOpenProject.html"
				class="w3-button w3-text-white w3-padding w3-hover-white"
				style="text-align: left; width: 100%; font-size: 18px;"><i
				class="material-icons w3-left">arrow_forward</i> Open Project</a>

			<h3 style="text-align: center; color: white;">Account Settings</h3>
			<hr>
			<a href="#"
				class="w3-button w3-text-white w3-text-white w3-padding w3-hover-white"
				style="text-align: left; width: 100%; font-size: 18px;"><i
				class="material-icons w3-left">arrow_forward</i> Log Out</a> <a href="#"
				class="w3-button w3-text-white w3-padding w3-hover-white"
				style="text-align: left; width: 100%; font-size: 18px;"><i
				class="material-icons w3-left">arrow_forward</i> Delete Account</a>
		</div>
		<!--END sidebar:-->
	</div>

	<!--PAGE CONTENT-->
	<div class="w3-overlay w3-animate-opacity" onclick="w3_close()"
		style="cursor: pointer" id="Overlay"></div>

	<!--TOPBAR-->
	<div class="w3-bar w3-padding-large w3-card-4 w3-teal">
		<h4 class="w3-wide w3-right w3-hide-small"
			style="font-family: 'Oswald', sans-serif;">UserName</h4>
		<i
			class="material-icons w3-xlarge w3-button w3-hover-none w3-right w3-hide-large w3-hide-medium">person</i>
		<a href="HomePage.html"><i
			class="material-icons w3-xlarge w3-button w3-hover-none w3-left">home</i></a>
		<i class="material-icons w3-xlarge w3-button w3-hover-none w3-left"
			onclick="w3_open()">menu</i>
	</div>
	<form:form action="AddPlace" id="PlaceForm" method="POST"
		enctype="multipart/form-data">
		<div>
			<!--style="background-image: url('Images/TajMahal.jpg'); background-size: 100% 100%;"-->
			<!--Content-->
			<div>
				<!--class="w3-container" style="background-color: black; opacity: 0.6; color: white;"-->
				<div class="scroll45">
					<h3 class="w3-wide">Add place:</h3>
					<br>
					<table class="w3-table">
						<tr>
							<td><h4>What a place is:</h4></td>
							<td><select name="placeType"
								style="width: 100%; height: 40px; outline: none;"
								onfocus="sendInfo()">
									<!-- border: 1px solid white; box-shadow: 1px 1px 1px white;background: transparent; color: white;-->
									<option value="City" class="w3-padding w3-black">City</option>
									<option value="State" class="w3-padding w3-black">State</option>
									<option value="Country" class="w3-padding w3-black">Country</option>
									<option value="Continent" class="w3-padding w3-black">Continent</option>
							</select></td>
						</tr>
						<tr>
							<td><h4>Tag line:</h4></td>
							<td><input id="frm" name="Tagline" type="text"
								placeholder="Tagline" class="w3-padding"
								style="width: 100%; outline: none;"></td>
							<!--background: transparent; color: white; border: 1px solid white; box-shadow: 1px 1px 1px white;-->
						</tr>
						<tr>
							<td><h4>Place Continent:</h4></td>
							<td><div class="search-container">
									<div class="ui-widget">
										<input id="inputContinent" name="inputContinent" type="text"
											placeholder="Ex: Continent" class="search w3-padding"
											style="width: 100%; outline: none;">
									</div>
								</div></td>
							<!--border: 1px solid white; background: transparent; color: white; box-shadow: 1px 1px 1px white;-->
						</tr>
						<tr>
							<td><h4>Place Country:</h4></td>
							<td><div class="search-container">
									<div class="ui-widget">
										<input id="inputCountry" name="inputCountry" type="text"
											placeholder="Ex: Country" class="search w3-padding"
											style="width: 100%; outline: none;">
									</div>
								</div></td>
							<!--border: 1px solid white; background: transparent; color: white; box-shadow: 1px 1px 1px white;-->
						</tr>
						<tr>
							<td><h4>Place State:</h4></td>
							<td><div class="search-container">
									<div class="ui-widget">
										<input id="inputState" name="inputState" type="text"
											placeholder="Ex: State" class="search w3-padding"
											style="width: 100%; outline: none;">
									</div>
								</div></td>
							<!--border: 1px solid white; background: transparent; color: white; box-shadow: 1px 1px 1px white;-->
						</tr>
						<tr>
							<td><h4>Place City:</h4></td>
							<td><div class="search-container">
									<div class="ui-widget">
										<input id="inputCity" name="inputCity" type="text"
											placeholder="Ex: City" class="search w3-padding"
											style="width: 100%; outline: none;">
									</div>
								</div></td>
							<!--border: 1px solid white; background: transparent; color: white; box-shadow: 1px 1px 1px white;-->
						</tr>
						<tr>
							<td><h4>Cover image:</h4></td>
							<td><input type="file" name="files" accept="image/*"></td>
						</tr>
						<tr>
							<td><h4>Discription:</h4></td>
							<td><input type="file" name="files" accept=".txt"><br>
								<text style="color: grey;">*Upload text files. Character
								limit: 500</text></td>
						</tr>
						<tr>
							<td><h4>Images:</h4></td>
							<td><input type="file" name="files" accept="application/zip" />
								<text style="color: grey;">*Upload Zip files.</text></td>
						</tr>
						<tr>
							<td><h4>Youtube video Link:</h4></td>
							<td><input type="text" name="youtubeLink"
								placeholder="Ex: Youtube Link" class="w3-padding"
								style="width: 100%; outline: none;"></td>
							<!--border: 1px solid white; background: transparent; color: white; box-shadow: 1px 1px 1px white;-->
						</tr>
					</table>
				</div>

				<table style="width: 100%;">
					<tr>
						<td><input type="submit" value="Publish"
							class="w3-button w3-black w3-xlarge w3-card-4"
							style="width: 100%"></td>
						<td><input type="reset"
							class="w3-button w3-black w3-xlarge w3-card-4"
							style="width: 100%"></td>
					</tr>
				</table>
			</div>
		</div>
	</form:form>
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