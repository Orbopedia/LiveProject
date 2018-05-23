<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="../css/w3.css">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Dancing+Script" rel="stylesheet">
	<script src="../js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="../materialize/js/materialize.min.js"></script>
	<link rel="stylesheet" type="text/css" href="../materialize/css/materialize.min.css">
	<style type="text/css">
		input::-webkit-input-placeholder{s
			color:grey;
		}
	</style>
	
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
</head>
<body>
	<div class="navbar-fixed" style="z-index: 1000">
	  <nav class="teal">
	    <div class="nav-wrapper">
	      <a href="#!" class="brand-logo white-text center" style="text-shadow:1px 1px 2px black;">Orbopedia</a>
	      <ul id="slide-out" class="side-nav">
	         <li><div class="user-view">
	           <div class="background">
	             <img src="../media/indianFlag.jpg" style="width: 100%; height: 100%;">
	           </div>
	           <a href="#!user"><img class="circle" src="../media/rahul.jpg"></a>
	           <a href="#!name"><span class="black-text name">Rahul Trivedi</span></a>
	           <a href="#!email"><span class="black-text email">rahultrivedi180@gmail.com</span></a>
	         </div></li>
	         <li><a href="#!"><i class="material-icons">cloud</i>First Link With Icon</a></li>
	         <li><a href="#!">Second Link</a></li>
	         <li><div class="divider"></div></li>
	         <li><a class="subheader">Subheader</a></li>
	         <li><a class="waves-effect" href="#!">Third Link With Waves</a></li>
	       </ul>
	      <a href="#" data-activates="slide-out" class="button-collapse show-on-large"><i class="material-icons">menu</i></a>
	  </div>
	</div>
	<div style="" class="container">
		<div class="row hide-on-med-and-down">
			<div id="form_div">
			 <form:form action="AddPlace" id="PlaceForm" method="POST" enctype="multipart/form-data">
			  
			 	<div class="input-field col s12">
			   		<p>Tag line:</p>
          			<input type="text" placeholder="Tag line" class="validate">
        		</div>

        		<!-- <div> -->
        			<div class="input-field col s12">
        				<p>Select continent:</p>
        			   <select>
        			     <option value="" disabled selected>Choose your option</option>
        			     <option value="1">Option 1</option>
        			     <option value="2">Option 2</option>
        			     <option value="3">Option 3</option>
        			   </select>
        			 </div>

        			 <div class="input-field col s12">
        				<p>Select country:</p>
        			   <select>
        			     <option value="" disabled selected>Choose your option</option>
        			     <option value="1">Option 1</option>
        			     <option value="2">Option 2</option>
        			     <option value="3">Option 3</option>
        			   </select>
        			 </div>

        			 <div class="input-field col s12">
        			 	<p>Select state:</p>
        			    <select>
        			      <option value="" disabled selected>Choose your option</option>
        			      <option value="1">Option 1</option>
        			      <option value="2">Option 2</option>
        			      <option value="3">Option 3</option>
        			    </select>
        			  </div>

        			  <div class="input-field col s12">
        			  	<p>Select city:</p>
        			     <select>
        			       <option value="" disabled selected>Choose your option</option>
        			       <option value="1">Option 1</option>
        			       <option value="2">Option 2</option>
        			       <option value="3">Option 3</option>
        			     </select>
        			   </div>
        		<!-- </div> -->

			  <div id="file_div">
			   <div>
			   	<div class="input-field col s12">
			   		<p>Add Image:</p>
          			<input type="text" placeholder="describe image" class="validate">
        		</div>
			    <input type="file" name="file[]">
			    <input type="button" class="w3-button w3-teal" onclick="add_file();" value="ADD MORE">
			   </div>
			  </div>

			  <div class="input-field col s12">
			   		<p>Youtube Link:</p>
          			<input type="text" placeholder="Youtube link" class="validate">
        		</div>

        		<div class="row">
        			<div class="col l6">
        				<button class="w3-button waves-effect waves-light teal white-text left" type="submit">Submit</button>
        			</div>
        			<div class="col l6">
        				<button class="w3-button waves-effect waves-light teal white-text right" type="reset">Reset</button>
        			</div>
        		</div>

			 </form:form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(".button-collapse").sideNav();
		$('select').material_select();
		function add_file()
{
 $("#file_div").append("<div class='w3-animate-top'><div class='input-field col s12'><p>Add Image:</p><input type='text' placeholder='describe image' class='validate'></div><input type='file' name='file[]'><input type='button' class='w3-button w3-teal' onclick='add_file();' value='ADD MORE'><input type='button' class='w3-button w3-teal' onclick='remove_file(this);' value='Remove'></div>");
}
function remove_file(ele)
{
 $(ele).parent().remove();
}
	</script>
</body>
</html>