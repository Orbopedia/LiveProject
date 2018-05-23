function script1(id){
    var x = document.getElementById(id);
   	if(x.className.indexOf("w3-show") === -1){
 		x.className += " w3-show";
    }
	else{
      	x.className = x.className.replace("w3-show","");
    }	
}
var vidIndex = 1;
showVids(vidIndex);
        
function currentVid(n){
	showVids(vidIndex = n);
}
function showVids(n){
	var i;
	var x = document.getElementsByClassName("myVideos");
	var dots = document.getElementsByClassName("demo");
	if(n > x.length) {vidIndex = 1;}
	if(n < 1) {vidIndex = x.length;}
	for(i = 0; i < x.length; i++){
		x[i].style.display = "none";
    }
	for(var i = 0; i < dots.length; i++) {
		dots[i].className = dots[i].className.replace(" w3-opacity-off", "");
	}
	x[vidIndex-1].style.display = "block";
	dots[vidIndex-1].className += " w3-opacity-off";
}
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}
function w3_openSearch() {
    document.getElementById("mySearch").style.display = "block";
    document.getElementById("myOverlay2").style.display = "block";
}
function w3_closeSearch() {
    document.getElementById("mySearch").style.display = "none";
    document.getElementById("myOverlay2").style.display = "none";
}