<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Folder List</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<link rel='stylesheet'
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

<style>
body {
	background-image:
		url('https://wallpapers.com/images/high/dark-gray-background-31zgslm940epcocw.webp');
	background-repeat: repeat;
	background-size: cover;
	opacity: 0.8;
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

#msform {
	display: none;
}

#msform2 {
	width: 400px;
	margin: 50px auto;
	text-align: center;
	position: relative;
}

#msform2 fieldset {
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

#msform2 fieldset:not(:first-of-type) {
	display: none;
}

#msform2 input, #msform2 textarea {
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

#msform2 .action-button {
	width: 100px;
	background: red;
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

#msform2 .action-Mybutton {
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

#msform2 .action-Signbutton {
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

#msform2 .action-button:hover, #msform2 .action-button:focus {
	box-shadow: 0 0 0 2px white, 0 0 0 3px #27AE60;
}

#msform2 {
	display: none;
}

#msform3s {
	width: 400px;
	margin: 50px auto;
	text-align: center;
	position: relative;
}

#msform3 fieldset {
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

#msform3 fieldset:not(:first-of-type) {
	display: none;
}

#msform3 input, #msform3 textarea {
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

#msform3 .action-button {
	width: 100px;
	background: yellow;
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

#msform3 .action-Mybutton {
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

#msform3 .action-Signbutton {
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

#msform3 .action-button:hover, #msform3 .action-button:focus {
	box-shadow: 0 0 0 2px white, 0 0 0 3px #27AE60;
}

#msform3 {
	display: none;
}
</style>

</head>


<body>

	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<button id="createfolderform"
				style="background: black; color: white; font-size: 20px; font-weight: bold; border-radius: 10px;">
				<i class="bi bi-folder-plus"></i>
			</button>
			<button id="renamefolderform"
				style="background: black; color: white; font-size: 20px; font-weight: bold; border-radius: 10px; margin-left: 10px;">
				<i class="bi bi-bootstrap-reboot"></i>
			</button>
			<button id="deletefolderform"
				style="background: red; color: white; font-size: 20px; font-weight: bold; border-radius: 10px; margin-left: 10px;">
				<i class="bi bi-trash3-fill" style="color: white;"></i>
			</button>
			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
			<h1 class="navbar-brand mx-auto" style="color: black;">Welcome
				${uname}</h1>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				</ul>
				<a href="logout"
				    onclick="setTimeout(function(){var ww = window.open(window.location, '_self'); ww.close(); });"
				    target="_blank"
					style="background: red; color: white; font-size: 15px; font-weight: bold; border-radius: 10px; margin-right: 10px; padding: 10px; text-decoration: none;">
					Logout&nbsp; </a> 
					
				<form class="d-flex" role="search">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>
		</div>
	</nav>


	<c:if test="${not empty folder}">
		<ul>
			<c:forEach var="folderItem" items="${folder}">
				<div>&nbsp;</div>
				<a href="showfiles?foid=${folderItem.foid}"
					style="font-size: 18px; font-weight: bold; color: white; text-decoration: none;">
					<i class="bi bi-folder-fill"
					style="color: yellow; font-size: 35px;"></i>&nbsp;${folderItem.foname}
				</a>
			</c:forEach>
		</ul>
	</c:if>


	<div class="container">

		<div class="row">

			<div class="col-4"></div>
			<div class="col-4">
				<form id="msform" method="post" action="createFolder"
					style="position: relative; top: -170px;">
					<div id="progressbar"></div>
					<fieldset class="myForm">
						<h2 class="fs-title">New Folder</h2>
						<input type="text" name="foname" placeholder="Folder Name.."
							required />
						<button type="submit" class="previous action-button"
							value="submit" style="border-radius: 10px;">
							<i class="bi bi-folder-plus" style="color: yellow;">&nbsp;&nbsp;</i>Create
						</button>

						<button type="button" class="btn btn-outline-danger"
							id="cancelButton" style="border-radius: 10px;">
							<i class="bi bi-x-circle" style="color: red">&nbsp;&nbsp;</i>Cancel
						</button>
						<c:if test="${not empty duplicateCreate}">
							<script>
								document.getElementById('msform').style.display = 'block';
							</script>
							<div class="warning" style="color: red;">${duplicateCreate}</div>
							<div class="warning"
								style="color: darkblue; font-size: 12px; font-weight: bold;">Please
								Try Another Name Instead....</div>
						</c:if>
					</fieldset>
				</form>

				<form id="msform2" method="post" action="deleteFolder"
					style="position: relative; top: -170px;">
					<div id="progressbar"></div>
					<fieldset class="myForm">
						<h2 class="fs-title">Delete Folder</h2>
						<input type="text" name="foname" placeholder="Folder Name.."
							required />
						<button type="submit" class="previous action-button"
							value="submit" style="border-radius: 10px;">
							<i class="bi bi-trash3-fill" style="color: yellow;">&nbsp;&nbsp;</i>Delete
						</button>

						<button type="button" class="btn btn-outline-danger"
							id="cancelButton2" style="border-radius: 10px;">
							<i class="bi bi-x-circle" style="color: red">&nbsp;&nbsp;</i>Cancel
						</button>
						<c:if test="${not empty notfound}">
							<script>
								document.getElementById('msform2').style.display = 'block';
							</script>
							<div class="warning" style="color: red; font-weight: bold;">${notfound}</div>
						</c:if>
					</fieldset>
				</form>

				<form id="msform3" method="post" action="renameFolder"
					style="position: relative; top: -170px;">
					<div id="progressbar"></div>
					<fieldset class="myForm">
						<h2 class="fs-title">Rename Folder</h2>
						<input type="text" name="foname" placeholder="Old Folder Name.."
							required /> <input type="text" name="newfoname"
							placeholder="New Name.." required />
						<button type="submit" class="previous action-button"
							value="submit" style="border-radius: 10px; color: black;">
							<i class="bi bi-bootstrap-reboot" style="color: black;">&nbsp;&nbsp;</i>Rename
						</button>

						<button type="button" class="btn btn-outline-danger"
							id="cancelButton3" style="border-radius: 10px;">
							<i class="bi bi-x-circle" style="color: red">&nbsp;&nbsp;</i>Cancel
						</button>
						<c:if test="${not empty duplicate}">
							<script>
								document.getElementById('msform3').style.display = 'block';
							</script>
							<div class="warning" style="color: red;">${duplicate}</div>
							<div class="warning"
								style="color: darkblue; font-size: 12px; font-weight: bold;">Please
								Try Another Name Instead....</div>
						</c:if>
					</fieldset>
				</form>


			</div>

		</div>

		<div class="col-4"></div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

	<script>
		document.getElementById('createfolderform').addEventListener('click',
				function() {
					document.getElementById('msform').style.display = 'block';
				});

		document.getElementById('deletefolderform').addEventListener('click',
				function() {
					document.getElementById('msform2').style.display = 'block';
				});

		document.getElementById('renamefolderform').addEventListener('click',
				function() {
					document.getElementById('msform3').style.display = 'block';
				});

		document.getElementById('cancelButton').addEventListener(
				'click',
				function() {
					document.getElementById('msform').style.display = 'none';
					var warningElements = document
							.getElementsByClassName("warning");
					for (var i = 0; i < warningElements.length; i++) {
						warningElements[i].innerHTML = "";
					}
				});

		document.getElementById('cancelButton2').addEventListener(
				'click',
				function() {
					document.getElementById('msform2').style.display = 'none';
					var warningElements = document
							.getElementsByClassName("warning");
					for (var i = 0; i < warningElements.length; i++) {
						warningElements[i].innerHTML = "";
					}
				});

		document.getElementById('cancelButton3').addEventListener(
				'click',
				function() {
					document.getElementById('msform3').style.display = 'none';
					var warningElements = document
							.getElementsByClassName("warning");
					for (var i = 0; i < warningElements.length; i++) {
						warningElements[i].innerHTML = "";
					}
				});
	</script>
</body>
</html>
