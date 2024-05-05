<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Header part -->



<head>
<title>Meetingmate Login</title>
<!-- <link rel="stylesheet" href="css/signin.css"> -->
<!-- bootstrap 4.5.3 links -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
	integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
	crossorigin="anonymous"></script>


<script src="https://code.jquery.com/jquery-3.7.0.min.js"
	integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
	crossorigin="anonymous"></script>

<!--font awesome kit -->
<script src="https://kit.fontawesome.com/b6656cb32d.js"
	crossorigin="anonymous"></script>

<!-- IT Crats fav icon -->
<link rel="shortcut icon" type="image/x-icon"
	href="images/ITCrats_Logo.png" alt="IT CRATS FAV ICON" />

<!-- adding  style sheet -->
<style>
/* login css */
* {
	box-sizing: border-box;
}

body {
	margin: 0px;
}

/* placeholder color */
.form-control::placeholder {
	color: lightgray;
}

.custom-button {
	color: #ffffff;
	background-color: #2594E0;
}

/* message background color 
.bg-msg {
    background-color: #fff8db;
} */
.input-ele-border-radius {
	border-width: 2px;
	border-radius: 16px;
	border-color: black;
}

/* focus on form control and btn control  */
.form-control:focus {
	border-color: #2594E0;
	box-shadow: none;
}

.btn:focus {
	border-color: #2594E0;
	box-shadow: none;
}

/* anchor ele  */
.anchor-ele {
	text-decoration: none;
	font-family: 'Roboto', Arial, sans-serif;
	font-weight: 600;
	color: #000000;
}

.anchor-ele:hover {
	text-decoration: none;
	color: #2594E0;
}

/* zoom ele  */
.zoom-ele {
	transition: transform 0.3s ease;
}

.zoom-ele:hover {
	transform: scale(1.2);
}

.font-weight-website {
	font-weight: 600;
}
</style>

</head>

<!-- body part -->

<body>
	<section class="vh-100">
		<div class="row  no-gutters h-100">
			<div class="col-12 d-flex flex-column align-items-center">
				<div class="row py-5 px-5">
					<div class="col-12 mb-5 text-center">
						<!-- it crats logo -->

						<img src="images/1024.jpg" class="img-fluid" alt="IT CRATS Logo"
							height="80" width="160" />
					</div>

					<div class="col-12">
						<div class="py-4 px-3 rounded" style="background-color: #f5f5f5;">


							<!-- <h6 class="my-3 text-danger form-label font-weight-website">{{message}}</h6> -->
							<h6 class="my-3 text-danger form-label font-weight-website">
								<%
								String result = (String) request.getAttribute("status");
								if (result != null)
									out.println(result);
								%>
							</h6>
							<h4 class="mb-2 font-weight-website">Sign In</h4>

							<div id="includedContent"></div>
							<!-- begining of the form -->
							<form action="login" method="post">

								<!-- email of the onboarding employee -->
								<div class="form-group mb-4">
									<label class="form-label font-weight-website" for="email">E-mail</label>
									<input class="form-control" type="email" id="email"
										name="emailid" required pattern="^[^\s]+@itcrats\.com$" />
								</div>

								<!--password of the onboarding employee -->
								<div class="form-group mb-4">
									<label class="form-label font-weight-website" for="password">Password</label>
									<input class="form-control" type="password" id="password"
										name="password" required pattern="^\S*$" />
								</div>

								<!--Forgot password link in case if onboarding employee forgots-->
								<div class="d-flex flex-row justify-content-end mb-2">
									<a href="/forgotpasswordenteremployeeid"
										class="zoom-ele anchor-ele font-weight-website">Forgot
										password?</a>
								</div>
								<!-- login button  -->
								<div class="d-flex flex-row justify-content-center my-3">
									<button class="custom-button btn font-weight-website zoom-ele"
										type="submit" style="border-radius: 8px;" value="SignIn">Sign
										In</button>
								</div>
							</form>
						</div>
					</div>
				</div>

			</div>





		</div>

	</section>

</body>

</html>