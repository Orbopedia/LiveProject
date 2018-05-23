<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Orbopedia:Create Account</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/w3.css'/>">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Dancing+Script"
	rel="stylesheet">
<script src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"
	type="text/javascript"></script>
<script type="text/javascript"
	src="<c:url value='/resources/materialize/js/materialize.min.js'/>"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/materialize/css/materialize.min.css'/>">
<style type="text/css">
input::-webkit-input-placeholder {
	color: grey;
}
</style>
</head>
<body>
	<div class="navbar-fixed" style="z-index: 1000">
		<nav class="teal">
		<div class="nav-wrapper">
			<a href="#!" class="brand-logo white-text center"
				style="text-shadow: 1px 1px 2px black;">Orbopedia</a>
			<ul id="slide-out" class="side-nav">
				<li><div class="user-view">
						<div class="background">
							<img src="../media/indianFlag.jpg"
								style="width: 100%; height: 100%;" alt="">
						</div>
						<a href="#!user"><img class="circle" src="../media/rahul.jpg"
							alt=""></a> <a href="#!name"><span class="black-text name">Rahul
								Trivedi</span></a> <a href="#!email"><span class="black-text email">rahultrivedi180@gmail.com</span></a>
					</div></li>
				<li><a href="#!"><i class="material-icons">cloud</i>First
						Link With Icon</a></li>
				<li><a href="#!">Second Link</a></li>
				<li><div class="divider"></div></li>
				<li><a class="subheader">Subheader</a></li>
				<li><a class="waves-effect" href="#!">Third Link With Waves</a></li>
			</ul>
			<a href="#" data-activates="slide-out"
				class="button-collapse show-on-large"><i class="material-icons">menu</i></a>
		</div>
		</nav>
	</div>
	<div style="" class="container">
		<div class="row hide-on-med-and-down">
			<div id="form_div">
				<form:form action="AddPlace" id="PlaceForm" method="POST"
					enctype="multipart/form-data">

					<div class="input-field col s12">
						<p>Tag line:</p>
						<input type="text" name="Tagline" placeholder="Tag line"
							class="validate">
					</div>

					<!-- <div> -->
					<div class="input-field col s12">
						<p>Select continent:</p>
						<select name="inputContinent" id="inputContinent">
							<option value="" disabled selected>Choose your option</option>
						</select>
					</div>

					<div class="input-field col s12">
						<p>Select country:</p>
						<select name="inputCountry" id="inputCountry">
							<option value="" disabled selected>Choose your option</option>
						</select>
					</div>

					<div class="input-field col s12">
						<p>Select state:</p>
						<select name="inputState" id="inputState">
							<option value="" disabled selected>Choose your option</option>
						</select>
					</div>

					<div class="input-field col s12">
						<p>Select city:</p>
						<select name="inputCity" id="inputCity">
							<option value="" disabled selected>Choose your option</option>
						</select>
					</div>


					<div class="input-field col s12">
						<p>Description :</p>
						<input type="file" name="files" accept=".txt">
						<text style="color: grey;">*Upload txt file word limit is
						500.</text>
					</div>

					<div class="input-field col s12">
						<p>Cover Image :</p>
						<input type="file" name="files" accept="image/*">
					</div>

					<div class="input-field col s12">
						<p>Images :</p>
						<input type="file" name="files" accept="application/zip" />
						<text style="color: grey;">*Upload Zip files.</text>
					</div>

					<!-- </div> -->

					<div id="file_div">
						<div>
							<div class="input-field col s12">
								<p>Places to Visit:</p>
								<input type="text" name="VisitText" placeholder="describe image"
									class="validate">
							</div>
							<input type="file" name="VisitImage"> <input
								type="button" class="w3-button w3-teal" onclick="add_file();"
								value="ADD MORE">
						</div>
					</div>

					<div class="input-field col s12">
						<p>Youtube Link:</p>
						<input type="text" placeholder="Youtube link" name="youtubeLink"
							class="validate">
					</div>

					<div class="row">
						<div class="col l6">
							<button
								class="w3-button waves-effect waves-light teal white-text left"
								type="submit">Submit</button>
						</div>
						<div class="col l6">
							<button
								class="w3-button waves-effect waves-light teal white-text right"
								type="reset">Reset</button>
						</div>
					</div>

				</form:form>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			$(function() {
				$.ajax({
					url : "LoadContinent",
					type : "GET",
					data : {
						val : ""
					},
					dataType : "json",
					success : function(data) {
						$.each(data, function(key, value){
							$('#inputContinent').append("<option value="+value+">"+value+"</option>");
						})
						$('#inputContinent').material_select('destroy');  
						$('#inputContinent').material_select();
					}
				});
			});
		});
		
		$("#inputContinent").change(function() {
			$(function() {
				$.ajax({
					url : "LoadCountry",
					type : "GET",
					data : {
						val : $('#inputContinent').val()
					},
					dataType : "json",
					success : function(data) {
						$.each(data, function(key, value){
							$('#inputCountry').append("<option value="+value+">"+value+"</option>");
						})
						$('#inputCountry').material_select('destroy');  
						$('#inputCountry').material_select();
					}
				});
			});
		});
		
		$("#inputCountry").change(function() {
			$(function() {
				$.ajax({
					url : "LoadState",
					type : "GET",
					data : {
						val : $('#inputCountry').val()
					},
					dataType : "json",
					success : function(data) {
						$.each(data, function(key, value){
							$('#inputState').append("<option value="+value+">"+value+"</option>");
						})
						$('#inputState').material_select('destroy');  
						$('#inputState').material_select();
					}
				});
			});
		});
		
		$("#inputState").change(function() {
			$(function() {
				$.ajax({
					url : "LoadCity",
					type : "GET",
					data : {
						val : $('#inputState').val()
					},
					dataType : "json",
					success : function(data) {
						$.each(data, function(key, value){
							$('#inputCity').append("<option value="+value+">"+value+"</option>");
						})
						$('#inputCity').material_select('destroy');  
						$('#inputCity').material_select();
					}
				});
			});
		});

		$(".button-collapse").sideNav();
		$('select').material_select();
		function add_file() {
			$("#file_div")
					.append(
							"<div class='w3-animate-top'><div class='input-field col s12'><p>Add Place to Visit:</p><input type='text' name='VisitText' placeholder='describe image' class='validate'></div><input type='file' name='VisitImage'><input type='button' class='w3-button w3-teal' onclick='add_file();' value='ADD MORE'><input type='button' class='w3-button w3-teal' onclick='remove_file(this);' value='Remove'></div>");
		}
		function remove_file(ele) {
			$(ele).parent().remove();
		}
	</script>
</body>
</html>