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
<link rel="stylesheet" href="css/forgotEnterEmployeeId.css">
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
						<div class="p-3 shadow rounded">
							<h4 class="font-weight-website">Forgot password?</h4>
							<small class="mb-3">Reset password in two quick steps</small> <br />
							<!--message that we want to show irrespective of operation-->
							<h6 class="my-3 text-danger form-label font-weight-website">
								<%
								String result = (String) request.getAttribute("status");
								if (result != null)
									out.println(result);
								%>
							</h6>
							<!--whenever submitting this form it will call the url of forgot password enter email-->
							<form action="forgotpasswordenterpasscode" method="post" >
								<div class="form-group mb-4 mt-4">
									<!--email of user-->
									<label class="form-label font-weight-website" for="employeeId">EmployeeId</label>
									<input class="form-control" type="text" id="employeeId"
										name="employeeId" pattern="^[1-9]{1}[0-9]{5}$" required />

								</div>

								<div class="d-flex flex-row justify-content-between my-5">
									<div>
										<!--If a user click back button then it will go to login page-->
										<a class="text-decoration-none" href="signin">
											<button
												class="btn custom-outline-button font-weight-website zoom-ele"
												type="button" style="border-radius: 8px;">Back</button>
										</a>

									</div>

									<div>
										<!--reset passsword submission button-->
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

<!-- <script>
function validateForm() {
    // Add your form validation logic here
    
    // For example, if you want to prevent submission on page reload:
    if (window.performance && window.performance.navigation.type === window.performance.navigation.TYPE_RELOAD) {
        return false; // Prevent form submission on page reload
    }
    else{
    	
    	 
        // If validation passes, you can return true to allow the form submission:
        return true;
    }
    
   
}
onsubmit="return validateForm();"
</script> -->
</body>
</html>






