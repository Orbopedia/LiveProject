<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <title>Dashboard</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="<c:url value='/resources/css/w3.css'/>">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/materialize/css/materialize.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/Dashboard.css'/>">
  </head>
  <body style="background:#795548;">
    <div class="navbar-fixed" style="z-index:1000">
      <nav class="teal">
        <div class="nav-wrapper">
          <a href="#!" class="brand-logo white-text center" style="text-shadow:1px 1px 2px black;">Orbopedia</a>
          <ul id="slide-out" class="side-nav">
            <li>
              <div class="user-view">
                <div class="background">
                  <img src="../media/indianFlag.jpg" style="width: 100%; height: 100%;">
                </div>
                <a href="#!user"><img class="circle" src="../media/rahul.jpg"></a>
   	            <a href="#!name"><span class="black-text name">Rahul Trivedi</span></a>
   	            <a href="#!email"><span class="black-text email">rahultrivedi180@gmail.com</span></a>
              </div>
            </li>
            <li><a href="#!"><i class="material-icons">cloud</i>First Link With Icon</a></li>
	          <li><a href="#!">Second Link</a></li>
	          <li><div class="divider"></div></li>
	          <li><a class="subheader">Subheader</a></li>
	          <li><a class="waves-effect" href="#!">Third Link With Waves</a></li>
          </ul>
          <a href="#" data-activates="slide-out" class="button-collapse show-on-large"><i class="material-icons">menu</i></a>
        </div>
      </nav>
    </div>
    <div class="row">
    <div class="col s12" style="background:#1A237E;">
      <ul class="tabs tabs-fixed-width transparent hide-on-small-only">
        <li class="tab col s3"><a class="active white-text" href="#test1">Workplace</a></li>
        <li class="tab col s3"><a class="white-text" href="#test2">New Project</a></li>
        <li class="tab col s3"><a class="white-text" href="#test3">Open Project</a></li>
      </ul>
      <ul class="tabs tabs-fixed-width transparent hide-on-med-and-up" style="margin-top:5px;">
        <li class="tab col s3"><a class="active white-text" href="#test1"><i class="material-icons">dashboard</i></a></li>
        <li class="tab col s3"><a class="white-text" href="#test2"><i class="material-icons">create_new_folder</i></a></li>
        <li class="tab col s3"><a class="white-text" href="#test3"><i class="material-icons">folder_open</i></a></li>
      </ul>
    </div>

    <!-- Glance screen -->
    <div id="test1" class="col s12 w3-padding-large scroll45" style="margin-top:5px;">
      <table class="white-text w3-bordered">
          <tr>
            <td>Last visited:</td>
            <td>Feb 3 2018</td>
          </tr>
          <tr>
            <td>Recent project:</td>
            <td>Orbopedia</td>
          </tr>
          <tr>
            <td>Projects done:</td>
            <td>1</td>
          </tr>
          <tr>
            <td>Projects approved:</td>
            <td>1</td>
          </tr>
          <tr>
            <td>Projects rejected:</td>
            <td>0</td>
          </tr>
      </table>
    </div>

    <!-- New project -->
    <div id="test2" class="col s12">
      <div style="" class="container white-text">
        <div class="row">
          <div id="form_div">
            <form method="post" id="file_form" enctype="multipart/form-data">
              <div class="input-field col s12">
                <p>Tag line:</p>
                <input type="text" placeholder="Tag line" class="validate">
              </div>
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
              <div id="file_div">
                <div>
                  <div class="input-field col s12">
                    <p>Add Image:</p>
                    <input type="text" placeholder="place name" class="validate">
                    <textarea class="materialize-textarea" data-length="500" placeholder="Info about place"></textarea>
                  </div>
                  <input type="file" name="file[]" style="padding-left: 10px;">
                  <button type="button" class="w3-button waves-effect waves-light teal white-text hide-on-small-only" onclick="add_file();">Add more</button>
                  <button type="button" class="w3-button waves-effect waves-light teal white-text hide-on-med-and-up" style="margin-top: 20px; margin-left: 10px;" onclick="add_file();">Add more</button>
                </div>
              </div>
              <div class="input-field col s12">
                <p>Youtube Link:</p>
                <input type="text" placeholder="Youtube link" class="validate">
              </div>
              <div class="row">
                <div class="col s6 l6 m6">
                  <button class="w3-button waves-effect waves-light teal white-text left" type="submit">Submit</button>
                </div>
                <div class="col s6 l6 m6">
                  <button class="w3-button waves-effect waves-light teal white-text right" type="reset">Reset</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>

    <!-- Open project -->
    <div id="test3" class="col s12">
      <div class="row">
        <div class="col l6 m6 s12">
          <div class="card medium">
            <div class="card-image waves-effect waves-block waves-light">
              <img class="activator" src="../media/office.jpg" >
            </div>
            <div class="card-content">
              <span class="card-title activator grey-text text-darken-4">Project Title<i class="material-icons right">more_vert</i></span>
              <p><a href="#">Open Project</a></p>
            </div>
            <div class="card-reveal">
              <span class="card-title grey-text text-darken-4">Project Info<i class="material-icons right">close</i></span>
              <!-- add word wrap if necessary -->
              <p>Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.</p>
            </div>
            <div class="card-action">
              <a href="#">This is a link</a>
            </div>
          </div>
        </div>
        <div class="col l6 m6 s12">
          <div class="card medium">
            <div class="card-image waves-effect waves-block waves-light">
              <img class="activator" src="../media/office.jpg" >
            </div>
            <div class="card-content">
              <span class="card-title activator grey-text text-darken-4">Project Title<i class="material-icons right">more_vert</i></span>
              <p><a href="#">Open Project</a></p>
            </div>
            <div class="card-reveal">
              <span class="card-title grey-text text-darken-4">Project Info<i class="material-icons right">close</i></span>
              <!-- add word wrap if necessary -->
              <p>Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.</p>
            </div>
            <div class="card-action">
              <a href="#">This is a link</a>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col l6 m6 s12">
          <div class="card medium">
            <div class="card-image waves-effect waves-block waves-light">
              <img class="activator" src="../media/office.jpg" >
            </div>
            <div class="card-content">
              <span class="card-title activator grey-text text-darken-4">Project Title<i class="material-icons right">more_vert</i></span>
              <p><a href="#">Open Project</a></p>
            </div>
            <div class="card-reveal">
              <span class="card-title grey-text text-darken-4">Project Info<i class="material-icons right">close</i></span>
              <!-- add word wrap if necessary -->
              <p>Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.</p>
            </div>
            <div class="card-action">
              <a href="#">This is a link</a>
            </div>
          </div>
        </div>
        <div class="col l6 m6 s12">
          <div class="card medium">
            <div class="card-image waves-effect waves-block waves-light">
              <img class="activator" src="../media/office.jpg" >
            </div>
            <div class="card-content">
              <span class="card-title activator grey-text text-darken-4">Project Title<i class="material-icons right">more_vert</i></span>
              <p><a href="#">Open Project</a></p>
            </div>
            <div class="card-reveal">
              <span class="card-title grey-text text-darken-4">Project Info<i class="material-icons right">close</i></span>
              <!-- add word wrap if necessary -->
              <p>Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.</p>
            </div>
            <div class="card-action">
              <a href="#">This is a link</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/resources/materialize/js/materialize.min.js'/>"></script>
  <script src="<c:url value='/resources/js/Dashboard.js'/>" charset="utf-8"></script>
  </body>
</html>
