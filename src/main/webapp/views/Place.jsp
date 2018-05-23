<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <jsp:useBean id="DataClass" class="com.handsontech.model.City"
	scope="page"></jsp:useBean>
<jsp:useBean id="ResourceClass"
	class="com.handsontech.beans.ResourcesBeans" scope="page"></jsp:useBean>
<jsp:useBean id="Database" class="com.handsontech.service.Database"
	scope="page"></jsp:useBean>
	<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.handsontech.beans.UserBean"%>
<%@page import="com.handsontech.service.URLMapping" %>
<%@page import="com.handsontech.beans.ResourcesBeans.PlacesToVisit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
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

    
        <meta charset="utf-8">
        <title>Orbopedia | Place</title>
        <!-- Let browser know website is optimized for mobile -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- import google material icons -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!-- import w3css -->
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <!-- import materialize css -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <!-- google Courgette fonts -->
        <link href="https://fonts.googleapis.com/css?family=Courgette" rel="stylesheet">
        <!-- link Place css -->
        <link rel="stylesheet" href="<c:url value='/resources/css/Place.css'/>">
        
        <style>
        	.page-front{
			    position: relative;
			    background-image: url('<c:url value="/Images/CoverPICS/PID${PlaceID}.jpg"/>');
			    background-size: 100% 100%;
			    background-repeat: no-repeat;
			}
        </style>
    </head>
    <body>
        <div class="page-front">
            <nav class="transparent">
                <div class="nav-wrapper">
                    <a href="#!" class="brand-logo center"> <img src="<c:url value='/Images/Logo/White.png'/>" alt="orbopedia  logo" id="orbopedia-logo"> </a>
                    <ul id="slide-out" class="sidenav">
                        <li>
                            <div class="user-view">
                                <div class="background">
                                    <img src="<c:url value='/Images/website/indianFlag.jpg'/>" id="country-flag">
                                </div>
                                <%if(userBean != null){%>
	                                <a href="#user"><img class="circle" src="<c:url value='/Images/Profile/PID1.jpg'/>"></a>
	                                <a href="#name"><span class="black-text name"><%=userBean.getFName() + userBean.getLName()%></span></a>
	                                <a href="#email"><span class="black-text email"><%=userBean.getEmail()%></span></a>
                                <%}else{ %>
                                	<a href="#user"><img class="circle" src="<c:url value='/Images/Profile/NoProfile.png'/>"></a>
	                                <a href="#name"><span class="black-text name">Hello</span></a>
	                                <a href="#email"><span class="black-text email"></span></a>
                                <%} %>
                            </div>
                        </li>
                        <% if(userBean != null){ %>                        
	                        <li> <a href='<%=URLMapping.serverInitials%>Console' class="waves-effect waves-teal">Dashboard</a> </li>
	                        <li> <a href="<%=URLMapping.serverInitials%>Logout" class="waves-effect waves-teal">Logout</a> </li>
                       	<%}else{ %>
                       		<li> <a href="<%=URLMapping.serverInitials%>Login" class="waves-effect waves-teal">Login</a> </li>
                       		<li> <a href="#!" class="waves-effect waves-teal">Join Us</a> </li>
                       	<%}%>
                        <li>
                            <div class="center row">
                                <div class="col s12 " >
                                    <div class="row">
                                        <div class="input-field col black-text hide-on-large-only">
                                            <i class="black-text prefix material-icons">search</i>
                                            <input type="text" placeholder="search" class="black-text w3-border-bottom" >
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <a href="#" data-target="slide-out" class="sidenav-trigger show-on-large"> <i class="material-icons">menu</i> </a>
                    <ul class="right hide-on-med-and-down">
                        <li>
                            <div class="row">
                                <div class="col s12">
                                    <div class="row">
                                        <div class="input-field black-text col">
                                            <i class="white-text material-icons prefix" id="search-icon">search</i>
                                            <input type="text" name="search" placeholder="search" class="right white-text w3-border-bottom">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
            <div class="front-div">
                <div class="center-align front-img">
                    <h1 id="country"><%=CityName%><span style="font-size:30px;"> : <%=DataClass.getTagLine(PID)%></span> </h1>
                </div>
            </div>
        </div>

        <!-- large screen parallax -->
        <div class="parallax-container w3-hide-small w3-hide-medium" id="large-parallax">
            <div class="parallax">
                <img src="<c:url value='/Images/Websites/nature1.jpg'/>" alt="">
            </div>
        </div>

        <!-- medium screen parallax -->
        <div class="parallax-container w3-hide-small w3-hide-large" id="medium-parallax">
            <div class="parallax">
                <img src="<c:url value='/Images/Websites/nature1.jpg'/>" alt="">
            </div>
        </div>

        <!-- small screen parallax -->
        <div class="parallax-container w3-hide-medium w3-hide-large" id="small-parallax">
            <div class="parallax">
                <img src="<c:url value='/Images/Websites/nature1.jpg'/>" alt="">
            </div>
        </div>

        <!-- map -->
        <div class="container-fluid">
            <h4 class="center" style="font-size: 5vmin;"><%=CityName%> on map!</h4>
            <div id="mapPlaceholder">
            	<iframe width="100%" height="600" frameborder="0" style="border: 0"
						src="https://www.google.com/maps/embed/v1/search?key=AIzaSyBAX8QWicZbzxqBhD4ftc3QH8m1sM8gguI&q=<%=CityName%>"
						allowfullscreen> </iframe>
			</div>
        </div>

        <!-- large screen parallax -->
        <div class="parallax-container w3-hide-small w3-hide-medium" id="large-parallax">
            <div class="parallax">
                <img src="<c:url value='/Images/Websites/nature2.jpeg'/>" alt="">
            </div>
        </div>

        <!-- medium screen parallax -->
        <div class="parallax-container w3-hide-small w3-hide-large" id="medium-parallax">
            <div class="parallax">
                <img src="<c:url value='/Images/Websites/nature2.jpeg'/>" alt="">
            </div>
        </div>

        <!-- small screen parallax -->
        <div class="parallax-container w3-hide-medium w3-hide-large" id="small-parallax">
            <div class="parallax">
                <img src="<c:url value='/Images/Websites/nature2.jpeg'/>" alt="">
            </div>
        </div>
		<%ResourceClass.setReadPlaceTextFile(PID, DataClass.getTextPath());%>
        <!-- about place and image slider -->
        <div class="transparent w3-container">
            <div class="row">
                <div class="col l4 m12 s12">
                    <h4 id="section-header" class="center">About <%=CityName%></h4>
                    <div class="card-panel transparent z-depth-0 about-place">
                        <p><%=ResourceClass.textFile()%></p>
                    </div>
                </div>
                <div class="col l8 m12 s12">
                    <div class="center">
                        <h4 id="section-header">Images</h4>
                    </div>
                    <div class="clearfix"></div>
                    <!-- image slider -->
                    <div class="slider">
                        <ul class="slides" style="box-shadow: 0px 3px 50px black;">
                            <%
								Iterator<String> it = ResourceClass.setFetchImageGallery();
								while (it.hasNext()) {
							%>
									<li>
										<img src='<c:url value="<%=it.next()%>"/>'>
									</li>
							<%
								}
							%>
                        </ul>
                        <a href="#!" class="btn-floating btn-large waves-effect waves-teal transparent z-depth-0 prevPic left" > <i class="material-icons black-text">skip_previous</i> </a>
                        <a href="#!" class="btn-floating btn-large waves-effect waves-teal transparent z-depth-0 nextPic right"> <i class="material-icons black-text">skip_next</i> </a>
                    </div>
                </div>
            </div>
        </div>

        <!-- videos -->
        <div class="" style="padding-bottom:10px;">
            <div class="container-fluid">
                <div class="center">
                    <h4 id="section-header">Video</h4>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="container" style="margin-top:10px;">
                <div class="video-container">
					<iframe width="1100" height="680"
						src="<%=ResourceClass.setFetchYoutubeVideos()%>"
						frameborder="0" allowfullscreen></iframe>
				</div>
            </div>
            <div class="center w3-padding-large hide-on-small-only"><a class="waves-effect waves-light btn pink">Video Gallery</a></div>
            <div class="center hide-on-med-and-up" style="padding-top: 15px;"><a class="waves-effect waves-light btn pink">Video Gallery</a></div>
        </div>

        <!-- large screen parallax -->
        <div class="parallax-container w3-hide-small w3-hide-medium" id="large-parallax">
            <div class="parallax">
                <img src="<c:url value='/Images/Websites/nature3.jpg'/>" alt="">
            </div>
        </div>

        <!-- medium screen parallax -->
        <div class="parallax-container w3-hide-small w3-hide-large" id="medium-parallax">
            <div class="parallax">
                <img src="<c:url value='/Images/Websites/nature3.jpg'/>" alt="">
            </div>
        </div>

        <!-- small screen parallax -->
        <div class="parallax-container w3-hide-medium w3-hide-large" id="small-parallax">
            <div class="parallax">
                <img src="<c:url value='/Images/Websites/nature3.jpg'/>" alt="">
            </div>
        </div>

        <!-- top sights -->
        <div class="">
            <div class="container-fluid">
                <div class="center">
                    <h4 id="section-header">Top sights</h4>
                </div>
            </div>
            <div class="w3-row">
                <div class="w3-half w3-center w3-padding">
                    <div class="">
                    <%
					ArrayList<PlacesToVisit> PTV = ResourceClass.setFetchPlacesToVisit();
					int length = PTV.size() - 1;
					int i = -1;
					for (PlacesToVisit visitPlaces : PTV) {
						if (i <= (length / 2)) {
					%>
                    <a href="#Place<%=i+""%>" class="modal-trigger"> <img src="<c:url value='<%=visitPlaces.getImages()%>'/>" alt="" class="w3-round" id="top-sights" /> <p id="top-sights-title"><%=visitPlaces.getName()%></p> </a>
                        <!-- Taj Mahal Modal Structure -->
                        <div id="Place<%=i+""%>" class="modal modal-fixed-footer">
                            <div class="modal-content">
                                <h5><%=visitPlaces.getName()%></h5>
                                <img src="<c:url value='<%=visitPlaces.getImages()%>'/>" alt="<%=visitPlaces.getName()%>" class="w3-round" id="top-sights" />
                                <p><%=visitPlaces.getDescription()%></p>
                            </div>
                            <div class="modal-footer">
                                <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Close</a>
                            </div>
                        </div>
                        
                    <%
					i++;
							if (i != length / 2) {
								continue;
							} else {

							}

						}

						if (i == (length / 2)) {
					%>
                    
                </div>
                </div>
                <div class="w3-half w3-center w3-padding">
                    <div class="">
                <%
					}
				%>

				<%
					if (i > length / 2) {
				%>
                        <a href="#Place<%=i+""%>" class="modal-trigger"> <img src="<c:url value='<%=visitPlaces.getImages()%>'/>" alt="" class="w3-round" id="top-sights" /> <p id="top-sights-title"><%=visitPlaces.getName()%></p> </a>
                        <!-- Taj Mahal Modal Structure -->
                        <div id="Place<%=i+""%>" class="modal modal-fixed-footer">
                            <div class="modal-content">
                                <h5><%=visitPlaces.getName()%></h5>
                                <img src="<c:url value='<%=visitPlaces.getImages()%>'/>" alt="" class="w3-round" id="top-sights" />
                                <p><%=visitPlaces.getDescription()%></p>
                            </div>
                            <div class="modal-footer">
                                <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Close</a>
                            </div>
                        </div>
                        <%
							}
								i++;
							}
						%>
                    </div>
                </div>
            </div>
        </div>

        <!-- footer -->
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
							<li><a class="grey-text text-lighten-3" href="<%=URLMapping.serverInitials%>Login">login</a></li>
							<li><a class="grey-text text-lighten-3" href="<%=URLMapping.serverInitials%> ">Search
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

        <!-- import jquery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <!-- import materialize js -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
        <!-- link map js -->
        <script src="<c:url value='/resources/js/map.js'/>" charset="utf-8"></script>
        <!-- link Place js -->
        <script src="<c:url value='/resources/js/Place.js'/>" charset="utf-8"></script>
    </body>
</html>
