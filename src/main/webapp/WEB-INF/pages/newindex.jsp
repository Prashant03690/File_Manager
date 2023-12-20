<!DOCTYPE html>
<html lang="en">

<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<link rel='stylesheet'
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

<style>
body {
	margin: 0;
	padding: 0;
	font-family: Arial, sans-serif;
	background-image:
		url('https://www.forbesindia.com/fbimages/900x600/proportional/jpeg/blog/wp-content/uploads/2020/06/Document-Digitization_BG.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	height: 100vh;
	overflow: hidden;
}

.navbar {
	font-family: 'Rocher';
	text-align: center;
	font-size: 50px;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	position: fixed;
	top: 0;
	width: 100%;
	z-index: 1000;
	background-color: darkblue;
	border: 3px solid white;
}

h1 {
	margin: 0;
}

.navTitle {
	font-palette: --Yellows;
}

.card {
	text-align: center;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 8px;
	background-color: lavender;
	max-width: 400px;
	width: 100%;
	margin-top: 100px;
	max-width: 400px;
}

.cardimage {
	max-width: 100%;
	height: auto;
	margin-bottom: 15px;
}

.loginbutton {
	background-color: #27AE60;
	color: #fff;
	padding: 10px 15px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
}
</style>

</head>

<body>


	<nav class="navbar">

		<div class="container">
			&nbsp;&nbsp;&nbsp; <a class="navbar-brand me-2"
				href="https://mdbgo.com/"> <img class="navbarLogo" id="navbar"
				src="https://th.bing.com/th/id/OIP.TR8RbmwMZsERBgrr6xf-fwHaCq?pid=ImgDet&rs=1"
				height="60" alt="NABLA INFOTECH" loading="lazy"
				style="margin-top: -1px;" />
			</a>


			<button class="navbar-toggler" type="button"
				data-mdb-toggle="collapse" data-mdb-target="#navbarButtonsExample"
				aria-controls="navbarButtonsExample" aria-expanded="false"
				aria-label="Toggle navigation">
				<i class="fas fa-bars"></i>
			</button>


			<div class="collapse navbar-collapse" id="navbarButtonsExample">

				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item">
						<div class="navTitle">FILE MANAGER</div>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="card">
		<img class="cardimage"
			src="https://assets-global.website-files.com/60c0cec90f57824353f55893/62c52a398407c85f890833ea_What%20is%20a%20file%20management%20system%20(1).png"
			alt="Card Image">
		<h2 style="background-color: darkblue; color: white;">NABLA
			INFOTECH LLC</h2>
		<p
			style="font-weight: bold; color: red; font-family: 'Your-Beautiful-Font', sans-serif; font-size: 18px; margin: 0; padding: 0;">
			<span style="color: black; -webkit-text-stroke: 0.1px black;">Please
				Login To Use Our Services</span>
		</p>

		<div class="card">
			<a href="login" class="loginbutton"
				style="font-weight: bold; text-decoration: none;"> <i
				class="bi bi-box-arrow-in-right">&nbsp;&nbsp;</i>Login
			</a>
		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

