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
						<li><a href="uploadmeeting" class="link-dark rounded">Create Meeting</a></li>
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
			<div class=" col-12 col-md-10 bg-all-forms">

				<form class="py-5 px-3" id="personalForm"
					action="createfollowupmeeting" method="post">
					<div class="row">
						<div class="form-group col-12 mb-5">
							<label class="form-label font-weight-website"><b
								class="form-label text-danger mr-1">*</b>Indicates a required
								field</label>
						</div>
						
						<div class="form-group col-md-4 mb-5">
							<label class="form-label font-weight-website" for="meetingId">MeetingID<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="meetingId" name="meetingId" value="${meetingId}"
								readonly />

						</div>
						<div class="form-group col-md-4 mb-5">
							<label class="form-label font-weight-website" for="agenda">Agenda<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="agenda" name="agenda" value="${agenda}" readonly />

						</div>
						<div class="form-group col-md-4 mb-5">
							<label class="form-label font-weight-website" for="recurrence">Recurrence<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="recurrence" name="recurrence" value="${recurrence}" readonly />

						</div>
						<div class="form-group col-md-4 mb-5">
							<label class="form-label font-weight-website" for="recurrencePattern">RecurrencePattern<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="recurrencePattern" name="recurrencePattern" value="${recurrencePattern}" readonly />

						</div>
						<div class="form-group col-md-4 mb-5">
							<label class="form-label font-weight-website" for="scheduleDate">ScheduleDate<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="scheduleDate" name="scheduleDate"
								value="${scheduleDate}" readonly />

						</div>

						<div class="form-group col-md-4 mb-5">
							<label class="form-label font-weight-website" for="actualDate">ActualDate<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="actualDate" name="actualDate"
								value="${actualDate}" readonly />

						</div>

						<div class="form-group col-md-4 mb-5">
							<label class="form-label font-weight-website" for="startedTime">StartedTime<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="startedTime" name="startedTime"
								value="${startedTime}" readonly />

						</div>
						<div class="form-group col-md-4 mb-5">
							<label class="form-label font-weight-website" for="endTime">EndTime<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="endTime" name="endTime" value="${endTime}"
								readonly />

						</div>
						<div class="form-group col-md-4 mb-5">
							<label class="form-label font-weight-website" for="meetingStatus">MeetingStatus<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="meetingStatus" name="meetingStatus"
								value="${meetingStatus}" readonly />

						</div>
						<div class="form-group col-md-4 mb-5">
							<label class="form-label font-weight-website" for="videolink">VideoLink<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="videolink" name="videolink" value="${videolink}"
								readonly />

						</div>

						<div class="d-flex flex-row justify-content-end mr-5">
							<button class="btn custom-button font-weight-website zoom-ele"
								type="submit">Create Meeting</button>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>

	<%@ include file="./components/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>


</body>
</html>