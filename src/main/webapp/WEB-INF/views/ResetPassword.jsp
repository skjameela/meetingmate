<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="./components/headerlinks.jsp" />

<!-- author for these jsp harsha  -->


<!-- Header part -->
<head>

<title>Meeting Mate ResetPassword</title>

<!-- linking css file -->
<link rel="stylesheet" href="css/loginforgotresetcommon.css">
</head>

<body>
	<section class="vh-100">
		<div class="row  no-gutters h-100  py-3 px-3">
			<jsp:include page="./components/logo.jsp" />
			<div class="col-12 d-flex flex-column align-items-center">
				<div class="row">
					<jsp:include page="./components/banner.jsp" />
					<div class="col-12">
						<div class="py-2 px-3 shadow rounded background-color-page">

							<h6 class="font-weight-website">Password Requirements:</h6>
							<ul>
								<!--displaying rules on the screen for the  resetting the password-->
								<li><small>(8-16) characters in range</small></li>
								<li><small>starts with an alphabetic character</small></li>
								<li><small>atleast one numeric and one special
										character</small></li>

							</ul>


							<!--if we got any error mesage or successful message here we will show-->

							<h6 class="py-1 text-danger form-label font-weight-website">
								<%
								String result = (String) request.getAttribute("status");
								if (result != null)
									out.println(result);
								%>
							</h6>
							<!--url method for the entering new password to changing the current password-->

							<form action="resetpassworddata" method="post">

								<div class="form-group  mb-3">
									<label class="form-label font-weight-website" for="oldpassword">Old
										Password<sup class="text-danger">*</sup>
									</label> <input class="form-control" type="password" id="oldpassword"
										name="oldpassword" />
								</div>

								<div class="form-group mb-3">
									<!--here need to give new password with matching pattern-->
									<label class="form-label font-weight-website" for="newpassword">New
										password<sup class="text-danger">*</sup>
									</label> <input class="form-control" type="password" id="newpassword"
										name="newpassword" required
										pattern="^[a-zA-Z](?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!#%*?&]{8,16}$" />
								</div>

								<!--retype the new password -->
								<!--if new passwor and retype password didnt match then it wont accept for resetting the passwrd-->
								<div class="form-group mb-3">
									<label class="form-label font-weight-website"
										for="confirmpassword">Confirm password<sup
										class="text-danger">*</sup></label> <input class="form-control"
										type="password" id="confirmpassword" name="confirmpassword"
										required
										pattern="^[a-zA-Z](?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!#%*?&]{8,16}$" />
								</div>


								<div class="d-flex flex-row justify-content-between my-2">
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



