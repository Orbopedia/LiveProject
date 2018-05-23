<%@page import="com.handsontech.beans.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="DataClass" class="com.handsontech.model.City"
	scope="page"></jsp:useBean>
<jsp:useBean id="ResourceClass"
	class="com.handsontech.beans.ResourcesBeans" scope="page"></jsp:useBean>
<jsp:useBean id="Database" class="com.handsontech.service.Database"
	scope="page"></jsp:useBean>
<%
	int PID = Integer.parseInt((String)request.getAttribute("PlaceIdentification"));
	//int PID = 2;
	request.setAttribute("PlaceID", PID + "");
	String CityName = DataClass.getCity(PID);
	if (CityName == null) {
		RequestDispatcher rd = request.getRequestDispatcher("Place404.jsp");
		rd.forward(request, response);
	}
	UserBean userBean = (UserBean) request.getAttribute("UserBeanObject");
	ResourceClass.LoadParserDetails(PID, DataClass.getJSONPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Orbopedia</title>
<!--Import Google Icon Font-->
<link href="http://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/w3.css'/>">
<!--Import materialize.css-->
<link rel="stylesheet"
	href="<c:url value='/resources/materialize/css/materialize.min.css'/>">
<link href="https://fonts.googleapis.com/css?family=Courgette"
	rel="stylesheet">
<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<style media="screen">
#india {
	font-family: 'Courgette', cursive;
	font-size: 60 px;
	color: white;
	text-shadow: 2px 2px 2px black;
}

.scroll45 {
	white-space: nowrap;
	overflow-x: auto;
	-webkit-overflow-scrolling: touch;
	-ms-overflow-style: -ms-autohiding-scrollbar;
}

.parallax-container {
	height: 300px;
}

.CoverImage {
	position: relative;
	background-image:
		url('<c:url value="/Images/CoverPICS/PID${PlaceID}.jpg"/>');
	background-size: 100% 100%;
	background-repeat: no-repeat;
}
</style>
</head>
<body style="background: #E8E8E8">
	<!-- #BDBDBD -->
	<div class="CoverImage">
		<!-- you can make z-depth-0 -->
		<nav class="transparent">
			<div class="nav-wrapper">
				<a href="#!" class="brand-logo white-text center"
					style="text-shadow: 1px 1px 2px black;">Orbopedia</a>
				<ul id="slide-out" class="side-nav">
					<%if(userBean != null){%>
					<li><div class="user-view">
							<div class="background">
								<img
									src="<c:url value='/Images/websites/indianFlag.jpg'/>"
									style="width: 100%; height: 100%;">
							</div>
							
							<br> <br> <a href="#" class="center-align">
								<h4 style="color: black; text-shadow: 1px 1px 3px black;">
									Account</h4>
							</a> <a href="#!user"><img class="circle"
								src="<c:url value='/Images/Profile/UID1.jpg'/>"></a> <a
								href="#!name"><span class="black-text name"><%=userBean.getFName() + userBean.getLName()%></span></a> 
								<a href="#!email"><span class="black-text email"><%=userBean.getEmail()%></span></a>
							
						</div></li>
					<!-- <li><a href="#!"><i class="material-icons">cloud</i>First Link With Icon</a></li> -->
					<li><a href="http://35.154.221.25:8080/Orbopedia/Console" class="waves-effect waves-teal hoverable">Visit Account</a></li>
					<!-- <li><a class="subheader">Subheader</a></li> -->
					<li><a class="waves-effect waves-teal hoverable" href="http://35.154.221.25:8080/Orbopedia/Logout">Logout</a></li>
					<li class="">
						<div class="center row">
							<div class="col s12 ">
								<div class="row">
									<div class="input-field col black-text">
										<i class="black-text material-icons prefix">search</i> <input
											type="text" placeholder="search" class="black-text">
									</div>
								</div>
							</div>
						</div>
					</li>
					<%}else{%>
					<li><div class="user-view">
							<div class="background">
								<img
									src="<c:url value='/Images/websites/indianFlag.jpg'/>"
									style="width: 100%; height: 100%;">
							</div>
							
							<br> <br> <a href="#" class="center-align">
								<h4 style="color: black; text-shadow: 1px 1px 3px black;">
									Account</h4>
							</a> <a href="#!user"><img class="circle"
								src="<c:url value='/Images/Profile/NoProfile.png'/>"></a> <a
								href="#!name"><span class="black-text name"><%="Hello User"%></span></a> 
								<a href="#!email"><span class="black-text email"></span></a>
							
						</div></li>
					<!-- <li><a href="#!"><i class="material-icons">cloud</i>First Link With Icon</a></li> -->
					<li><a href="http://35.154.221.25:8080/Orbopedia/CreateAccount" class="waves-effect waves-teal hoverable">Create Account</a></li>
					<!-- <li><a class="subheader">Subheader</a></li> -->
					<li><a class="waves-effect waves-teal hoverable" href="http://35.154.221.25:8080/Orbopedia/Login">Login</a></li>
					<li class="">
						<div class="center row">
							<div class="col s12 ">
								<div class="row">
									<div class="input-field col black-text">
										<i class="black-text material-icons prefix">search</i> <input
											type="text" placeholder="search" class="black-text">
									</div>
								</div>
							</div>
						</div>
					</li>
					<%}%>
				</ul>
				<ul class="right hide-on-med-and-down">
					<li>
						<div class="center row">
							<div class="col s12 ">
								<div class="row">
									<div class="input-field col s6 s12 black-text">
										<i class="black-text material-icons prefix">search</i> <input
											type="text" placeholder="search" name="inputSearch"
											id="inputSearch" class="black-text">
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
				<a href="#" data-activates="slide-out"
					class="button-collapse show-on-large"><i class="material-icons">menu</i></a>
			</div>
		</nav>
		<div class="" style="min-height: 680px;">
			<div class="center-align"
				style="width: 100%; top: 50%; left: 50%; transform: translate(-50%, -50%); -ms-transform: translate(-50%, -50%); position: absolute;">
				<h1 id="india"><%=CityName%><span style="font-size: 30px;">
						: <%=DataClass.getTagLine(PID)%></span>
				</h1>
			</div>
		</div>
	</div>


	<!-- parallax -->
	<div class="parallax-container" style="margin-top: 20px;">
		<div class="parallax">
			<img src="<c:url value='/Images/websites/nature1.jpg'/>">
		</div>
	</div>

	<!-- style="padding-bottom:52px;" -->
	<div class="container-fluid">
		<div class="container-fluid">
			<h4 class="center" style="font-size: 5vmin;">Search your
				favourite place on map!</h4>
			<!--img src="<c:url value='/Images/websites/map.jpg'/>" alt="" min-height="400px;" width="100%"-->
			<div class="">
				<div class=" w3-section w3-center" id="map">
					<iframe width="100%" height="600" frameborder="0" style="border: 0"
						src="https://www.google.com/maps/embed/v1/search?key=AIzaSyBAX8QWicZbzxqBhD4ftc3QH8m1sM8gguI&q=<%=CityName%>"
						allowfullscreen> </iframe>
				</div>
				<!--END map-->
			</div>
		</div>
	</div>


	<!-- parallax -->
	<div class="parallax-container">
		<div class="parallax">
			<img src="<c:url value='/Images/websites/nature4.jpeg'/>">
		</div>
	</div>

	<%
		ResourceClass.setReadPlaceTextFile(PID, DataClass.getTextPath());
	%>
	<div class="container-fluid transparent flex-container">
		<div class="row">
			<div class="col l4 m12 s12">
				<h4 style="font-size: 5vmin; color: black;">About <%=CityName%></h4>
				<div class="card-panel transparent z-depth-0"
					style="max-height: 450px;">
					<span class="black-text "> <%=ResourceClass.textFile()%>
					</span>
				</div>
			</div>
			<div class="col l8 m12 s12">
				<!-- <h4 style="font-size:5vmin; color:black">Image Galary</h4> -->
				<div class="left">
					<h4 style="font-size: 5vmin; color: black;">Images</h4>
				</div>
				<!-- CLEAR -->
				<div class="clearfix"></div>

				<!-- creating slider -->
				<div class="slider">
					<ul class="slides">
						<!--li>
              <img src="<c:url value='/Images/websites/Place2.jpg'/>"> 
              <div class="caption center-align">
                <h3>This is our big Tagline!</h3>
                <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
              </div>
            </li>
            <li>
              <img src="<c:url value='/Images/websites/Place3.jpg'/>"> 
              <div class="caption left-align">
                <h3>Left Aligned Caption</h3>
                <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
              </div>
            </li>
            <li>
              <img src="<c:url value='/Images/websites/Place4.jpg'/>"> 
              <div class="caption right-align">
                <h3>Right Aligned Caption</h3>
                <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
              </div>
            </li>
            <li>
              <img src="<c:url value='/Images/websites/Place3.jpg'/>">
              <div class="w3-display-middle"><a class="waves-effect waves-light btn pink">Gallery</a></div>
            </li-->
						<%
							Iterator<String> it = ResourceClass.setFetchImageGallery();
							while (it.hasNext()) {
						%>
						<li><img class='mySlides w3-animate-opacity'
							src='<c:url value="<%=it.next()%>"/>' style='width: 100%'>
						</li>
						<%
							}
						%>
					</ul>
					<a
						class="btn-floating btn-large waves-effect transparent z-depth-0 prevPic"
						style="float: left;"><i class="material-icons black-text">skip_previous</i></a>
					<a
						class="btn-floating btn-large waves-effect transparent z-depth-0 nextPic"
						style="float: right;"><i class="material-icons black-text">skip_next</i></a>
				</div>
			</div>
		</div>
	</div>

	<!-- parallax -->
	<div class="parallax-container">
		<div class="parallax">
			<img src="<c:url value='/Images/websites/nature2.jpeg'/>">
		</div>
	</div>


	<!-- video -->
	<div class="container-fluid">
		<div class="left black-text" style="padding-left: 16px;">
			<h4 style="font-size: 5vmin;">Video</h4>
		</div>
		<!-- CLEAR -->
		<div class="clearfix"></div>
		<div class="container" style="margin-top: 10px;">
			<!-- <h4 class="center" style="font-size:5vmin;">Video</h4> -->
			<div class="video-container">
				<iframe width="1100" height="680"
					src="<%=ResourceClass.setFetchYoutubeVideos()%>"
					frameborder="0" allowfullscreen></iframe>
			</div>
		</div>
		<div class="center" style="padding-bottom: 50px; padding-top: 50px;">
			<a class="waves-effect waves-light btn pink">Video Gallery</a>
		</div>
	</div>


	<!-- parallax -->
	<div class="parallax-container">
		<div class="parallax">
			<img src="<c:url value='/Images/websites/nature4.jpeg'/>">
		</div>
	</div>

	<div class="container-fluid">
		<div class="row">
			<h4 style="font-size: 5vmin; color: black; padding-left: 16px;">Top
				Sights</h4>
			<div class="col s12 m6 l6 w3-padding-large">
				
			
			</div>
			<div class="col s12 m6 l6 w3-padding-large">
		
				<!--div
					style="font-family: 'Raleway', sans-serif; font-size: 20px; margin-top: 30px; padding-bottom: 10px;"
					class="teal center z-depth-3">
					<a href="state.html" target="_blank"> <img
						src="<c:url value=''/>"
						class="responsive-img hoverable"><span class="white-text"></span></a>
				</div>
			</div>
		</div-->


		<!-- parallax -->
		<div class="parallax-container">
			<div class="parallax">
				<img src="<c:url value='/Images/websites/nature4.jpeg'/>">
			</div>
		</div>


		<footer class="page-footer">
			<div class="container">
				<div class="row">
					<div class="col l6 s12">
						<h5 class="white-text">Orbopedia</h5>
						<p class="grey-text text-lighten-4">We believe in Quality and Purity of information.</p>
					</div>
					<div class="col l4 offset-l2 s12">
						<h5 class="white-text">Links</h5>
						<ul>
							<li><a class="grey-text text-lighten-3" href="http://35.154.221.25:8080/Orbopedia/Login">login</a></li>
							<li><a class="grey-text text-lighten-3" href="http://35.154.221.25:8080/Orbopedia">Search
									Places</a></li>
							<li><a class="grey-text text-lighten-3" href="#!">About
									Orbopedia</a></li>
							<li><a class="grey-text text-lighten-3" href="#!">About
									Lotusdeal</a></li>
							<li><a class="grey-text text-lighten-3" href="#!">About
									HandsOn Tech</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="footer-copyright">
				<div class="container">
					© 2018 Orbopedia 
				</div>
			</div>
		</footer>
	</div>

	<script type="text/javascript"
		src="<c:url value='/resources//js/jquery-3.2.1.min.js'/>"></script>
	<script
		src="<c:url value='/resources/materialize/js/materialize.min.js'/>"></script>
	<script>
		$(".button-collapse").sideNav();
		$('.carousel').carousel();
		$('.parallax').parallax();

		$('.slider').slider();
		$('.prevPic').click(function() {
			$('.slider').slider('prev');
		});
		$('.nextPic').click(function() {
			$('.slider').slider('next');
		});

		$(document).ready(function() {
			$('#inputSearch').keypress(function(e) {
				var unicode = e.keyCode ? e.keyCode : e.charCode;
				if (unicode == 13) {

				}
			});
		});
	</script>
	
	
</body>
</html>
