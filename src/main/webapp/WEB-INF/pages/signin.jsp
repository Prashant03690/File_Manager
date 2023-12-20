<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<title></title>

<style>
@import url(https://fonts.googleapis.com/css?family=Montserrat);

* {
	margin: 0;
	padding: 0;
}

html {
	height: 100%;
	background-image:
		url('https://www.forbesindia.com/fbimages/900x600/proportional/jpeg/blog/wp-content/uploads/2020/06/Document-Digitization_BG.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center center;
}

body {
	font-family: montserrat, arial, verdana;
}

#msform {
	width: 400px;
	margin: 50px auto;
	text-align: center;
	position: relative;
}

#msform fieldset {
	background: white;
	border: 0 none;
	border-radius: 3px;
	box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.4);
	padding: 20px 30px;
	box-sizing: border-box;
	width: 80%;
	margin: 0 10%;
	position: relative;
}

#msform fieldset:not(:first-of-type) {
	display: none;
}

#msform input, #msform textarea {
	padding: 15px;
	border: 1px solid #ccc;
	border-radius: 3px;
	margin-bottom: 10px;
	width: 100%;
	box-sizing: border-box;
	font-family: montserrat;
	color: #2C3E50;
	font-size: 13px;
}

#msform .action-button {
	width: 100px;
	background: #27AE60;
	font-weight: bold;
	color: white;
	border: 0 none;
	border-radius: 1px;
	cursor: pointer;
	padding: 10px;
	margin: 10px 5px;
	text-decoration: none;
	font-size: 14px;
}

#msform .action-Mybutton {
	width: 100px;
	background: blue;
	font-weight: bold;
	color: white;
	border: 0 none;
	border-radius: 1px;
	cursor: pointer;
	padding: 10px;
	margin: 10px 5px;
	text-decoration: none;
	font-size: 14px;
}

#msform .action-Signbutton {
	width: 100px;
	background: blue;
	font-weight: bold;
	color: white;
	border: 0 none;
	border-radius: 1px;
	cursor: pointer;
	padding: 10px;
	margin: 10px 5px;
	text-decoration: none;
	font-size: 14px;
}

#msform .action-button:hover, #msform .action-button:focus {
	box-shadow: 0 0 0 2px white, 0 0 0 3px #27AE60;
}

#signinform {
	width: 400px;
	margin: 50px auto;
	text-align: center;
	position: relative;
}

#signinform fieldset {
	background: white;
	border: 0 none;
	border-radius: 3px;
	box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.4);
	padding: 20px 30px;
	box-sizing: border-box;
	width: 80%;
	margin: 0 10%;
	position: relative;
}

#signinform fieldset:not(:first-of-type) {
	display: none;
}

#signinform input, #signinform textarea {
	padding: 15px;
	border: 1px solid #ccc;
	border-radius: 3px;
	margin-bottom: 10px;
	width: 100%;
	box-sizing: border-box;
	font-family: montserrat;
	color: #2C3E50;
	font-size: 13px;
}

#signinform .action-button {
	width: 100px;
	background: #27AE60;
	font-weight: bold;
	color: white;
	border: 0 none;
	border-radius: 1px;
	cursor: pointer;
	padding: 10px;
	margin: 10px 5px;
	text-decoration: none;
	font-size: 14px;
}

#signinform .action-Mybutton {
	width: 100px;
	background: blue;
	font-weight: bold;
	color: white;
	border: 0 none;
	border-radius: 1px;
	cursor: pointer;
	padding: 10px;
	margin: 10px 5px;
	text-decoration: none;
	font-size: 14px;
}

#signinform .action-Signbutton {
	width: 100px;
	background: blue;
	font-weight: bold;
	color: white;
	border: 0 none;
	border-radius: 1px;
	cursor: pointer;
	padding: 10px;
	margin: 10px 5px;
	text-decoration: none;
	font-size: 14px;
}

#signinform .action-button:hover, #signinform .action-button:focus {
	box-shadow: 0 0 0 2px white, 0 0 0 3px #27AE60;
}

.fs-title {
	font-size: 15px;
	text-transform: uppercase;
	color: #2C3E50;
	margin-bottom: 10px;
}

.fs-subtitle {
	font-size: 15px;
	color: blue;
	font-weight: bold;
	margin-bottom: 20px;
	background-color: yellow;
	color: blue;
}

#progressbar {
	margin-bottom: 30px;
	overflow: hidden;
	counter-reset: step;
}

#progressbar li {
	list-style-type: none;
	color: white;
	text-transform: uppercase;
	font-size: 9px;
	width: 33.33%;
	float: left;
	position: relative;
}

#progressbar li:before {
	content: counter(step);
	counter-increment: step;
	width: 20px;
	line-height: 20px;
	display: block;
	font-size: 10px;
	color: #333;
	background: white;
	border-radius: 3px;
	margin: 0 auto 5px auto;
}

#progressbar li:after {
	content: '';
	width: 100%;
	height: 2px;
	background: white;
	position: absolute;
	left: -50%;
	top: 9px;
	z-index: -1;
}

#progressbar li:first-child:after {
	content: none;
}

#progressbar li.active:before, #progressbar li.active:after {
	background: #27AE60;
	color: white;
}

.welcome {
	background-color: rgba(230, 230, 250, 0.7);
	font-size: 25px;
	text-align: center;
	font-family: 'Niconne', cursive;
	font-weight: 700;
	background-color: rgba(230, 230, 250, 0.7);
	color: #000000;
	padding: 10px;
}
</style>
</head>

<body>


	<form id="signinform" method="post" action="signin">
		<div id="progressbar">
			<div class="welcome"
				style="color: #4B0082; font-family: 'Arial', sans-serif; font-size: 24px; text-align: center; padding: 20px; background-size: cover;">
				Nabla Infotech File Manager</div>
		</div>
		<fieldset class="myForm">
			<h2 class="fs-title">Create New Account</h2>
			<input type="text" name="uname" placeholder="Enter Your Username" required />
			<input type="email" name="uemail" placeholder="Your Email" required />
			<input type="password" name="upassword" placeholder="Your Password"
				required /> <input type="password" name="reenteredPassword"
				placeholder="Re-enter Your Password" required />
			<button id="signinback" type="button" class="previous action-Mybutton"
				style="border-radius: 10px;">
				<i  class="bi bi-skip-backward-fill" style="color: yellow">&nbsp;&nbsp;</i>Back
			</button>
			<button type="submit" class="previous action-Signbutton"
				style="background-color: green; color: white; border-radius: 10px;">
				<i class="bi bi-box-arrow-right" style="color: yellow;"></i>
				&nbsp;&nbsp;Sign up
			</button>

			<c:if test="${not empty unmatchingPassword}">
				<div style="color: red; font-weight: bold;">${unmatchingPassword}</div>
			</c:if>
			<c:if test="${not empty failed}">
				<div style="color: red; font-weight: bold;">${failed}</div>
			</c:if>
		</fieldset>
	</form>

	<script>
    // Go Back To Home Page
    document.getElementById("myButton").addEventListener("click", function (event) {
        event.preventDefault();
        window.location.href = "newindex";
    });
    
    document.getElementById("signinback").addEventListener("click", function (event) {
        event.preventDefault();
        window.location.href = "login";
    });
</script>
	
</body>
</html>
