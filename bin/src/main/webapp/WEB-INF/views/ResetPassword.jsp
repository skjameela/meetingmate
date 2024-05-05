<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- author for these jsp harsha  -->
<!DOCTYPE html>
<html>
<!-- Header part -->
<head>
<meta charset="ISO-8859-1">
<title>ForgotEnterEmployeeId</title>
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
<!-- linking css file -->
<link rel="stylesheet" href="css/resetPassword.css">
</head>
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
						<div class="py-2 px-3 shadow rounded">
							<!-- <h4 class="text-center">Choose a new password</h4> -->
							<h6 class="font-weight-website">Password Requirements:</h6>
							<ul>
								<!--displaying rules on the screen for the  resettimg the password-->
								<li><small>(8-16) characters in range</small></li>
								<li><small>starts with an alphabetic character</small></li>
								<li><small>atleast one numeric</small></li>
								<li><small>atleast one special character</small></li>
							</ul>
							<!-- <small  class="mb-3">Create a new password in range of (8-16) characters and it should contain <br>at least(one alphabet,one special character, one number)</small> -->

							<!--if we got any error mesage or successful message here we will show-->

							<h6 class="my-3 text-danger form-label font-weight-website">
								<%
								String result = (String) request.getAttribute("status");
								if (result != null)
									out.println(result);
								%>
							</h6>
							<!--url method for the entering new password to changing the current password-->

							<form action="resetpassworddata" method="post">

								<div class="form-group  mb-4">
									<label class="form-label font-weight-website" for="oldpassword">Old
										Password<sup class="text-danger">*</sup>
									</label> <input class="form-control" type="password" id="oldpassword"
										name="oldpassword" />
								</div>

								<div class="form-group mb-4">
									<!--here need to give new password with matching pattern-->
									<label class="form-label font-weight-website"
										for="newpassword">New password<sup class="text-danger">*</sup></label> <input
										class="form-control" type="password" id="newpassword"
										name="newpassword" required
										pattern="^[a-zA-Z](?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!#%*?&]{8,16}$" />
								</div>

								<!--retype the new password -->
								<!--if new passwor and retype password didnt match then it wont accept for resetting the passwrd-->
								<div class="form-group mb-4">
									<label class="form-label font-weight-website"
										for="confirmpassword">Confirm password<sup class="text-danger">*</sup></label> <input
										class="form-control" type="password" id="confirmpassword"
										name="confirmpassword" required
										pattern="^[a-zA-Z](?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!#%*?&]{8,16}$" />
								</div>


								<div class="d-flex flex-row justify-content-between my-3">
									<div>
										<!--if a user click on cancel button then it will redirect to login page-->
										<a class="text-decoration-none" href="homepage">
											<button
												class="btn custom-outline-button font-weight-website zoom-ele"
												type="button" style="border-radius: 8px;">Cancel</button>
										</a>

									</div>

									<div>
										<!--form submission button-->
										<button class="btn custom-button font-weight-website zoom-ele"
											type="submit" style="border-radius: 8px;">Submit</button>


									</div>


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



