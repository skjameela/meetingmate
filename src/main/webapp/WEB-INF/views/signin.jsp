<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="./components/headerlinks.jsp" />

<!-- Header part -->
<head>

<title>Meeting Mate Login</title>
<link rel="stylesheet" href="css/loginforgotresetcommon.css">

</head>

<!-- body part -->
<body>
	<section class="vh-100">
		<div class="row  no-gutters h-100  py-3 px-3">

			<jsp:include page="./components/logo.jsp" />

			<div class="col-12 d-flex flex-column align-items-center">
				<div class="row">

					<jsp:include page="./components/banner.jsp" />

					<div class="col-12">
						<div class="py-2 px-3 shadow rounded background-color-page">



							<h6 class="py-1 text-danger form-label font-weight-website">
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
								<div class="form-group mb-3">
									<label class="form-label font-weight-website" for="email">E-mail</label>
									<input class="form-control" type="email" id="email"
										name="emailid" required pattern="^[^\s]+@itcrats\.com$" />
								</div>

								<!--password of the onboarding employee -->
								<div class="form-group mb-3">
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