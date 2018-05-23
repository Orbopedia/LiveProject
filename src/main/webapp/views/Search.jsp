<%@ page language="java" contentType="text/html; charset=UTF-8; image/jp2"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Orbopedia</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="<c:url value='/resources/materialize/js/materialize.min.js'/>"> </script>
  <link rel="stylesheet" href="<c:url value='/resources/materialize/css/materialize.min.css'/>">
  
  <link rel="stylesheet" href="<c:url value='/resources/css/Search.css'/>">
  <link rel="stylesheet" href="<c:url value='/resources/css/w3.css'/>">
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <!--  script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script-->
  
  
  
<style>
	.resizeSearchImage{
		height: 50px;
		width: 75px;
		float: left;
	}
	
	.searchText{
		padding-top: 50%;
		padding-bottom: 50%;
	}
	
	
	.SearchResultBox{
		vertical-align: middle;
		height: 100%;
		width: 100%;
		background-color: aqua;
	}
</style>



</head>
<body>
  <div>
    <div class="w3-bar w3-transparent bar">
      <a href="Login" class="w3-bar-item w3-right waves-effect waves-teal" id="loginbtn">Login/Register</a>
    </div>

    <!-- for small -->
    <div class="search_bar w3-center w3-hide-large w3-hide-medium">
      <!-- <h1 style="font-size:8vmin;">Orbopedia</h1> -->
      <img src="<c:url value='/resources/media/orbopediawhite.png'/>" width="100%;">
      <div id='search-box' class="ui-widget">
        <form action='Search' id='search-form' autocomplete="on"
				method='POST' target='_top'>
				<input id='search-text-small' name='valName'
					placeholder='Type and hit enter' type='text'
					onkeyup="onKeyUp(this)" />
				<button id='search-button' style="outline: none;" type='submit'>
					<i class="fa fa-search w3-large w3-text-white"></i>
				</button>
			</form>
      </div>
    </div>

    <!-- for medium -->
    <div class="search_bar_mid w3-center w3-hide-small w3-hide-large">
      <!-- <h1 style="font-size:8vmin;">Orbopedia</h1> -->
      <img src="<c:url value='/resources/media/orbopediawhite.png'/>" width="100%;">
      <div id='search-box' class="ui-widget">
        <form action='Search' id='search-form' autocomplete="on"
				method='POST' target='_top'>
				<input id='search-text-medium' name='valName'
					placeholder='Type and hit enter' type='text'
					onkeyup="onKeyUp(this)" />
				<button id='search-button' style="outline: none;" type='submit'>
					<i class="fa fa-search w3-large w3-text-white"></i>
				</button>
			</form>
      </div>
    </div>

    <!-- for large -->
    <div class="search_bar_large w3-center w3-hide-small w3-hide-medium">
      <!-- <h1 style="font-size:8vmin;">Orbopedia</h1> -->
      <img src="<c:url value='/resources/media/orbopediawhite.png'/>" width="100%;">
      <div id='search-box' class="ui-widget">
        <form action='Search' id='search-form' autocomplete="on"
				method='POST' target='_top'>
				<input id='search-text' name='valName'
					placeholder='Type and hit enter' type='text'
					onkeyup="onKeyUp(this)" />
				<input type="hidden" value="" name="txtID" id="txtId"/>
				<button id='search-button' style="outline: none;" type='submit'>
					<i class="fa fa-search w3-large w3-text-white"></i>
				</button>
			</form>
      </div>
    </div>
  </div>


  <div class="continents">

    <div class="w3-row">
      <div class="continent-col w3-third w3-container">
        <div class="continent-card">
           <div class="w3-container w3-center">
             <h3 style="margin-top:20px; margin-bottom:20px;">Africa</h3>
             <img src="<c:url value='/resources/media/africa.png'/>" style="width:100%; height: 250px;">
             <br/>
             <a href="#!" class="btn waves-effect waves-teal" id="visit-continent">Know more..</a>
           </div>
         </div>
      </div>
      <div class="continent-col w3-third w3-container">
        <div class="continent-card">
           <div class="w3-container w3-center">
             <h3 style="margin-top:20px; margin-bottom:20px;">Asia</h3>
             <img src="<c:url value='/resources/media/asia.png'/>" style="width:100%; height: 250px;">
             <br />
             <a href="#!" class="btn waves-effect waves-teal" id="visit-continent">Know more..</a>
           </div>
         </div>
      </div>
      <div class="continent-col w3-third w3-container">
        <div class="continent-card">
           <div class="w3-container w3-center">
             <h3 style="margin-top:20px; margin-bottom:20px;">North America</h3>
             <img src="<c:url value='/resources/media/north_america.png'/>" alt="Avatar" style="width:100%; height: 250px;">
             <br />
             <a href="#!" class="btn waves-effect waves-teal" id="visit-continent">More Info</a>
           </div>
         </div>
      </div>
    </div>

     <div class="w3-row">
      <div class="continent-col w3-container w3-quarter">
        <div class="continent-card">
           <div class="w3-container w3-center">
             <h3 style="margin-top:20px; margin-bottom:20px;">South America</h3>
             <img src="<c:url value='/resources/media/south_america.png'/>" alt="Avatar" style="width:100%; height: 250px;">
             <br />
             <a href="#!" class="btn waves-effect waves-teal" id="visit-continent">More Info</a>
           </div>
         </div>
      </div>
      <div class="continent-col w3-container w3-quarter">
        <div class="continent-card">
           <div class="w3-container w3-center">
             <h3 style="margin-top:20px; margin-bottom:20px;">Antarctica</h3>
             <img src="<c:url value='/resources/media/antarctica.png'/>" alt="Avatar" style="width:100%; height: 250px;">
             <br />
             <a href="#!" class="btn waves-effect waves-teal" id="visit-continent">More Info</a>
           </div>
         </div>
      </div>
      <div class="continent-col w3-container w3-quarter">
        <div class="continent-card">
           <div class="w3-container w3-center">
             <h3 style="margin-top:20px; margin-bottom:20px;">Europe</h3>
             <img src="<c:url value='/resources/media/europe.png'/>" alt="Avatar" style="width:100%; height: 250px;">
             <br />
             <a href="#!" class="btn waves-effect waves-teal" id="visit-continent">More Info</a>
           </div>
         </div>
      </div>
      <div class="continent-col w3-container w3-quarter">
        <div class="continent-card">
           <div class="w3-container w3-center">
             <h3 style="margin-top:20px; margin-bottom:20px;">Australia</h3>
             <img src="<c:url value='/resources/media/australia.png'/>" alt="Avatar" style="width:100%; height: 250px;">
             <br />
             <a href="#!" class="btn waves-effect waves-teal" id="visit-continent">More Info</a>
           </div>
         </div>
      </div>
    </div> 
  </div>
  
  

  <script>
    $(document).ready(function(){
      $('#togglecontinents').click(function(){
        $(".continents").toggle(350);
      });
      $('#mtogglecontinents').click(function(){
        $(".continents").toggle(350);
      });
    });
  </script>
  
   
  
  <script type="text/javascript">
		
		function onKeyUp(element){
			var inputval = element.value;
			$.ajax({
				url : "SearchIndex",
				type : "POST",
				data : {
					val : inputval
				},
				dataType : "json",
				success : function(data) {
					
					//for(i in data){
						//alert(obj[i][0].CityId);
							//var insertval=data[i]['CityName'];
					
							$("#search-text").autocomplete({
						      source: data,
						      select: function( event, ui ) {
						    	  			$("#txtId").val(ui.item.value);
						      		  }
						    });
						    
						    $("#search-text-small").autocomplete({
							      source: data,
							      select: function( event, ui ) {
							    	  			$("#txtId").val(ui.item.value);
							      		  }
							    });
						    
							$("#search-text-medium").autocomplete({
								  source: data,
								  select: function( event, ui ) {
								      			$("#txtId").val(ui.item.value);
								   		  }
								  });
								 
					}
			});
		}
	</script>
  
</body>
