<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="./components/headerlinks.jsp" />
<!-- author for these jsp harsha  -->

<!-- Header part -->
<head>

<title>Meeting Mate ForgotPassword</title>

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
							<h4 class="font-weight-website">We sent a passcode to your
								email</h4>
							<small class="mb-2">Enter the 6-digit verification
								passcode sent to given email</small>
							<h6 class="py-1 text-danger form-label font-weight-website">
								<%
								String result = (String) request.getAttribute("status");
								if (result != null)
									out.println(result);
								%>
							</h6>

							<!--url method for the entering passcode to changing the password-->
							<form action="forgotpasswordresetpassword" method="post">

								<div class="form-group my-3">
									<!--passcode can ony allow 6 digit number-->

									<input class="form-control" type="text" id="enteredpasscode"
										name="enteredpasscode" pattern="[0-9]{6}" required />


								</div>






								<div class="d-flex flex-row justify-content-between my-5">
									<div>
										<!--if user click on the cancel button then it will redirect to login page-->
										<a class="text-decoration-none" href="signin">
											<button
												class="btn custom-outline-button font-weight-website zoom-ele"
												type="button" style="border-radius: 8px;">Cancel</button>
										</a>

									</div>


									<!--this link is used to get the another passcode -->
									<div class="zoom-ele">
										<a href="/forgotpasswordresendpasscode"
											class="anchor-ele font-weight-bold text-decoration-none"
											>Resend Passcode</a>

									</div>


								</div>


								<!--submit button for the submitting reset password-->
								<div class="text-center my-3">
									<button class="btn custom-button font-weight-bold zoom-ele"
										type="submit" style="border-radius: 8px;">Submit</button>

								</div>
								<small class="text-muted"> If you don't see the email in
									your inbox, check your spam folder</small>
							</form>
						</div>
					</div>



				</div>

			</div>

		</div>

	</section>

	<script>
		function reloadPage() {
			location.reload();
		}
	</script>



</body>







