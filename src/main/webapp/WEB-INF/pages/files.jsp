<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Base64"%>

<%@ page isELIgnored="false"%>
<%@ page import="java.io.UnsupportedEncodingException"%>
<%@ page import="java.sql.Blob"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Files List</title>
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

.btn-green {
	background: green;
	color: white;
	font-size: 20px;
	font-weight: bold;
	border-radius: 10px;
}

.btn-primary {
	background: blue;
	color: white;
	font-size: 20px;
	font-weight: bold;
	border-radius: 10px;
}

.btn-red {
	background: red;
	color: white;
	font-size: 20px;
	font-weight: bold;
	border-radius: 10px;
}

#msform2 {
	width: 400px;
	margin: 50px auto;
	text-align: center;
	position: relative;
	background: white;
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

#msform2 .action-button, #msform2 .action-Mybutton, #msform2 .action-Signbutton
	{
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

#msform2 .action-button:hover, #msform2 .action-button:focus {
	box-shadow: 0 0 0 2px white, 0 0 0 3px #27AE60;
}

#msform2 {
	display: none;
}
</style>

</head>


<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a href="back"
				style="background: black; color: white; font-size: 20px; font-weight: bold; border-radius: 10px; padding: 4px;">
				<i class="bi bi-arrow-left-square-fill"></i>
			</a>
			<button id="createfolderform"
				style="background: black; color: white; font-size: 20px; font-weight: bold; border-radius: 10px; margin-left: 10px;">
				<i class="bi bi-file-earmark-plus-fill"></i>
			</button>
			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
			<h1 class="navbar-brand mx-auto" style="color: black;">Your
				Files</h1>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">

		<div class="row">

			<div class="col-6 mt-5" id="fileDetails">
				<form id="msform" method="post" action="createFile"
					style="position: relative; top: 3px;" enctype="multipart/form-data">
					<div id="progressbar"></div>
					<fieldset class="myForm">
						<h2 class="fs-title">New File</h2>
						<input type="text" name="fname" placeholder="File Name.." required />
						<div id="contentInput">
							<textarea name="fcontent"
								placeholder="Write Your Content Here....."
								style="border-radius: 10px; padding: 8px;"></textarea>
						</div>

						<input type="text" name="foid" value=${foid
							}
							style="display: none;" required /> <label for="fileType">File
							Type:</label> <select id="fileType" name="ftype"
							style="border-radius: 10px;" onchange="changeInputType()">
							<option value="txt">txt</option>
							<option value="png">png</option>
							<option value="jpg">jpg</option>
							<option value="">other</option>
						</select>

						<button type="submit" class="previous action-button"
							value="submit" style="border-radius: 10px;">
							<i class="bi bi-folder-plus" style="color: yellow;">&nbsp;&nbsp;</i>Create
						</button>

						<button type="button" class="btn btn-outline-danger"
							id="cancelButton" style="border-radius: 10px;">
							<i class="bi bi-x-circle" style="color: red">&nbsp;&nbsp;</i>Cancel
						</button>
						<c:if test="${not empty duplicate}">
							<script>
						    document.getElementById('msform').style.display = 'block';
						    </script>
							<div class="warning" style="color: red; font-weight: bold;">${duplicate}</div>
							<div class="warning"
								style="color: darkblue; font-size: 12px; font-weight: bold;">Please
								Try Another Name Instead....</div>
						</c:if>
					</fieldset>
				</form>

				<form id="msform2" method="post" action="editFile"
					style="position: relative; top: 3px;" enctype="multipart/form-data">

					<input type="text" id="editFileName" name="fname"
						placeholder="New File Name.." />

					<div id="editContentInput">
						<textarea id="editFileContent" name="fcontent"
							placeholder="Replace Your Content Here....."
							style="border-radius: 10px; padding: 8px;"></textarea>
					</div>

					<input type="text" name="foid" value="${foid}"
						style="display: none;" required /> <input id="editFileId"
						type="text" name="fid" style="display: none;" required /> <label
						for="editFileType">File Type:</label> <select id="editFileType"
						name="ftype" style="border-radius: 10px;"
						onchange="changeEditInputType()">
						<option value="txt">txt</option>
						<option value="png">png</option>
						<option value="jpg">jpg</option>
						<option value="">other</option>
					</select>

					<button type="submit" class="previous action-button" value="submit"
						style="border-radius: 10px;">
						<i class="bi bi-folder-plus" style="color: yellow;">&nbsp;&nbsp;</i>Edit
					</button>

					<button type="button" class="btn btn-outline-danger"
						style="border-radius: 10px;" onclick="cancelEditForm()">
						<i class="bi bi-x-circle" style="color: red">&nbsp;&nbsp;</i>Cancel
					</button>
					<c:if test="${not empty duplicateForEdit}">
						<script>
						    document.getElementById('msform2').style.display = 'block';
						    </script>
						<div class="warning" style="color: red; font-weight: bold;">${duplicateForEdit}</div>
						<div class="warning"
							style="color: darkblue; font-size: 12px; font-weight: bold;">Please
							Try Another Name Instead....</div>
					</c:if>
				</form>


			</div>

			<div class="col-6 mt-5">
				<table class="table table-striped table-dark"
					style="border: 2px solid yellow;">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Name</th>
							<th scope="col">Type</th>
							<th scope="col">Creation Date</th>
							<th scope="col">Modified Date</th>
							<th scope="col">Open</th>
							<th scope="col">Edit</th>
							<th scope="col">Delete</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="folderItem" items="${files}" varStatus="loop">
							<tr class="file-row">
								<th scope="row">${loop.index + 1}</th>
								<td>${folderItem.fname}</td>
								<td>${folderItem.ftype}</td>
								<td>${folderItem.fcreationdate}</td>
								<td>${folderItem.fmodifieddate}</td>
								<td>
									<button class="btn-green"
										onclick="openFile(${loop.index}, '${folderItem.fname}', '${folderItem.ftype}', '<c:out value="${folderItem.fcontent}" />')">
										<i class="bi bi-envelope-open"></i>
									</button>
								</td>
								<td>
									<button class="btn-primary" id="editFileButton"
										onclick="openEditForm(${loop.index}, '${folderItem.fid}', '${folderItem.foid}','${folderItem.fname}', '${folderItem.ftype}', '<c:out value="${folderItem.fcontent}" />')">
										<i class="bi bi-pencil" style="color: yellow;">&nbsp;&nbsp;</i>
									</button>
								</td>
								<td>
									<button id="deletefile" class="btn-red"
										data-fid="${folderItem.fid}" data-foid="${folderItem.foid}"
										onclick="deleteFile(this)">
										<i class="bi bi-trash3-fill"></i>
									</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>

				</table>
			</div>
		</div>
	</div>
	<a href="showfiles?foid=${folderItem.foid}"
		style="font-size: 18px; font-weight: bold; color: white; text-decoration: none; display: none;">
		<i class="bi bi-folder-fill" style="color: yellow; font-size: 35px;"></i>&nbsp;${folderItem.foname}
	</a>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

	<script>
		document.getElementById('createfolderform').addEventListener('click',
				function() {
					document.getElementById('msform').style.display = 'block';
				});

		document.getElementById('cancelButton').addEventListener('click',
				function() {
					document.getElementById('msform').style.display = 'none';
					var warningElements = document.getElementsByClassName("warning");
					for (var i = 0; i < warningElements.length; i++) {
					    warningElements[i].innerHTML = "";
					}
				});
	</script>
	<script>
        function changeInputType() {
            var fileType = document.getElementById("fileType").value;
            var contentInput = document.getElementById("contentInput");
            var form = document.getElementById("msform");

            if (fileType === "txt") {
                contentInput.innerHTML = '<textarea name="fcontent" placeholder="Write your content here...." style="border-radius: 10px; padding: 8px;"></textarea>';
                form.action = "createFile";
            } else if (fileType === "png" || fileType === "jpg") {
                contentInput.innerHTML = '<input type="file" name="fcontent" accept="image/*" style="border-radius: 10px; padding: 8px;" />';
                form.action = "createImage";
            } else {
                contentInput.innerHTML = '<textarea name="fcontent" placeholder="Write your content here...." style="border-radius: 10px; padding: 8px;"></textarea>';
                form.action = "createFile";
            }
        }

        function openFile(index, fname, ftype, fcontent) {
            var fileDetails = document.getElementById("fileDetails");
            var contentHTML;

            if (ftype === 'png' || ftype === 'jpg') {
                contentHTML = '<div class="card"><div class="card-body"><h5 class="card-title">' + fname + '</h5><img src="data:image/' + ftype + ';base64,' + fcontent + '" alt="Image" /><button class="btn btn-danger mt-3" onclick="closeCard()">Close</button></div></div>';
            } else {
                contentHTML = '<div class="card"><div class="card-body"><h5 class="card-title">' + fname + '</h5><p class="card-text">' + fcontent + '</p><button class="btn btn-danger mt-3" onclick="closeCard()">Close</button></div></div>';
            }

            fileDetails.innerHTML = contentHTML;
        }

        function closeCard() {
            var fileDetails = document.getElementById("fileDetails");
            fileDetails.innerHTML = ""; 
        }
        
        function deleteFile(button) {
            var fid = button.getAttribute("data-fid");
            var foid = button.getAttribute("data-foid");
            $.ajax({
                type: "POST",
                url: "deleteFile",
                data: {
                    fid: fid,
                    foid: foid
                },
                success: function (response) {
                    console.log("File deleted successfully");
                    location.reload();
                },
                error: function (error) {
                    console.error("Error deleting file", error);
                }
            });
        }
        

        function cancelEditForm() {
            document.getElementById('msform2').style.display = 'none';
            var warningElements = document.getElementsByClassName("warning");
			for (var i = 0; i < warningElements.length; i++) {
			    warningElements[i].innerHTML = "";
			}
        }
        
        function openEditForm(index, fid, foid, fname, ftype, fcontent) {
            document.getElementById('msform2').style.display = 'block';

            document.getElementById('editFileName').value = fname;
            document.getElementById('editFileId').value = fid;

            var fileTypeSelect = document.getElementById('editFileType');
            fileTypeSelect.value = ftype;

            changeEditInputType(); 
            document.getElementById('editFileContent').value = fcontent;
        }

        function changeEditInputType() {
            var fileType = document.getElementById("editFileType").value;
            var contentInput = document.getElementById("editFileContent");
            var form = document.getElementById("msform2");

            if (fileType === "txt") {
                contentInput.value = ''; 
                contentInput.setAttribute('placeholder', 'Replace your content here....');
                form.action = "editFile";
            } else if (fileType === "png" || fileType === "jpg") {
                contentInput.value = ''; 
                contentInput.setAttribute('placeholder', 'Replace your content here....');
                form.action = "editImage";
            }
        }

    </script>
</body>
</html>

