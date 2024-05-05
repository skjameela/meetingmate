<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.itcrats.meetingmate.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/homepage.css">
<style type="text/css">
.error {
	color: red;
}
</style>
</head>
<body>
<%
User user= (User)session.getAttribute("userObject1");
%>
	<%@ include file="./components/navbar.jsp"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	<div class="container-fluid">

		<div class="row">
			<!-- Sidebar -->
			<div class="col-md-2 bg-container-forms">
				<button class="btn btn-toggle align-items-center rounded collapsed"
					data-bs-toggle="collapse" data-bs-target="#home-collapse"
					aria-expanded="false">Meetings</button>
				<div class="collapse" id="home-collapse">

					<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
						<li><a href="createmeeting" class="link-dark rounded">Create Meeting</a></li>
						<li><a href="meetinghistory" class="link-dark rounded">Meeting History</a></li>
					</ul>
				</div>
				<br>
				<button class="btn btn-toggle align-items-center rounded collapsed"
					data-bs-toggle="collapse" data-bs-target="#account-collapse"
					aria-expanded="false">Task</button>

				<div class="collapse" id="account-collapse">

					<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
<%
						if(user.getUserType().equalsIgnoreCase("Admin"))
					{
					%>
                    <li><a href="createtask" class="link-dark rounded">Create Task</a></li>
						<li><a href="taskhistory" class="link-dark rounded">Task History</a></li>
						<li><a href="current_inprogress_task" class="link-dark rounded">current/inprogress Task</a></li>
						<!-- <li><a href="taskupdate" class="link-dark rounded">Task Update</a></li> -->
						<%
						}else{
						%>
						<li><a href="taskhistory" class="link-dark rounded">Task History</a></li>
						<li><a href="current_inprogress_task" class="link-dark rounded">current/inprogress Task</a></li>
						<%} %>
					</ul>

				</div>
			</div>
			<!-- Main Content -->
			<div class="col-md-10 bg-all-forms">
				<h2 class="text-align-center p-5 text-center">Upload meeting
					file</h2>
				<%-- <c:if test="${!empty cancelCreateMeetingMsg}">
	 
	                <h6 class="alert p-1 error text-center">${cancelCreateMeetingMsg}</h6>
                     </c:if>  --%>

				<div class="container mt-5">
					<div class="alert p-1 error" id="errorMessage"
						style="display: none;"></div>
					<h6 class="my-3 text-danger form-label font-weight-website">
								<%
								String result = (String) request.getAttribute("status");
								if (result != null)
									out.println(result);
								%>
							</h6>
					<form action="/uploadFile" method="POST"
						enctype="multipart/form-data" class="p-1"
						onsubmit="return validateForm()">
						<div class="row">
							<div class="mb-3 col-8">

								<input type="file" id="myFile" name="filename"
									class="form-control">
							</div>
							<div class="col-2">
								<button type="submit" class="btn btn-primary">Upload</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="./components/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script>
	 <c:if test="${!empty cancelCreateMeetingMsg}">
	 
    alert("${cancelCreateMeetingMsg}");
     </c:if>  
	
        function validateForm() {
        	
            const fileInput = document.getElementById('myFile');
            const errorMessage = document.getElementById('errorMessage');
            const allowedExtensions = ['.txt'];
            const fileName = fileInput.value.toLowerCase();

            // Check if the file extension is valid
            const isValid = allowedExtensions.some(ext => fileName.endsWith(ext));

            if (!isValid) {
                errorMessage.textContent = 'Please upload a .txt file.';
                errorMessage.style.display = 'block';
                return false; // Prevent form submission
            }
            
            errorMessage.style.display = 'none';
            return true; // Allow form submission
        }
        
    </script>

</body>
</html>