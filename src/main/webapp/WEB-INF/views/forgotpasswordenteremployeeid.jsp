<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="./components/headerlinks.jsp" />

<!-- author for these jsp harsha  -->

<!-- Header part -->
<head>
<title>Meeting Mate ForgotPassword</title>
<!-- linking css file -->
<link rel="stylesheet" href="css/loginforgotresetcommon.css">
</head>

<!-- body part -->
<body>
	<section class="vh-100">
		<div class="row  no-gutters h-100 py-3 px-3">


			<jsp:include page="./components/logo.jsp" />

			<div class="col-12 d-flex flex-column align-items-center">
				<div class="row">

					<jsp:include page="./components/banner.jsp" />


					<div class="col-12" >
						<div class="py-2 px-3 shadow rounded background-color-page">
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
							<form action="forgotpasswordenterpasscode" method="post">
								<div class="form-group my-4">
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


</body>







