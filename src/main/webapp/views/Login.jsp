<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>Login</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="../fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="../fonts/iconic/css/material-design-iconic-font.min.css">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/Login.css"/>">
</head>
<body>
	<div class="limiter">
		<div class="container-login100"
			style="background-image: url('<c:url value="/Images/websites/indianFlag.jpg"/>');">
			<div class="wrap-login100">
				<form class="login100-form validate-form" action="loginConsole" method="post">
					<span class="login100-form-title"> Log in </span>

					<div class="wrap-input100 validate-input"
						data-validate="Enter username">
						<input class="input100" type="text" name="username"
							placeholder="Username"> <span class="focus-input100"
							data-placeholder="&#xf207;"></span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Enter password">
						<input class="input100" type="password" name="password"
							placeholder="Password"> <span class="focus-input100"
							data-placeholder="&#xf191;"></span>
					</div>

					<div class="contact100-form-checkbox">
						<input class="input-checkbox100" id="ckb1" type="checkbox"
							name="remember-me"> <label class="label-checkbox100"
							for="ckb1"> Remember me </label>
					</div>

					<div class="container-login100-form-btn">
						<input type="submit" class="login100-form-btn" value="Login"/>
					</div>

					<%
						if (((String) request.getAttribute("status")) == null) {

						} else {
							out.println(((String) request.getAttribute("status")));
						}
					%>

					<div style="padding-top: 90px;">
						<a class="txt1" href="#"> Forgot Password? </a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="../js/jquery-3.2.1.min.js"></script>
	<script src="../js/Login.js"></script>

</body>
</html>
