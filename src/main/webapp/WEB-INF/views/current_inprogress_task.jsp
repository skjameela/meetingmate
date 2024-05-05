<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.itcrats.meetingmate.model.*" %>
<%@ page import="com.itcrats.meetingmate.Dao.*" %>
<%@ page import ="org.springframework.context.ApplicationContext"%>
<%@ page import ="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Current/Inprogress Tasks</title>
<!-- IT Crats fav icon -->
<link rel="shortcut icon" type="image/x-icon"
	href="images/ITCrats_Logo.png" alt="IT CRATS FAV ICON" />



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
<script src="https://kit.fontawesome.com/b6656cb32d.js"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/homepage.css">
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="bootstrap.css">
<link rel="stylesheet" href="font-awesome.css">
<script src="jquery.js"></script>
<script src="bootstrap.js"></script>
<!-- Your custom CSS styles -->
<style>
/* Add your custom CSS styles here */


.box-div {
	width: 120%;
	text-align: center;
	/* display: flex;
	/* justify-content: center; */ */
	align-items: center;
	height: 100vh; /* This centers the content vertically on the page */
	/*   background-color:#ffffff; */
}

.box-div {
	/* Set the background color if necessary */
	background-color: #ffffff;
}

.card {
	width: 100%; /* Adjust the width as needed */
	height: 50%; /* Adjust the height as needed */
	background-color: #3498db;
	/* You can set the desired background color */
	margin: 0 10px; /* Add spacing between the boxes */
	border: 2px solid red;
	border-radius: 50px 20px;
	overflow: auto; /* Add scrollbars if content overflows */
	max-height: 100%; /* Limit the maximum height of the card */
}
</style>

</head>
<body>
<%
User user= (User)session.getAttribute("userObject1");
%>
	<%@ include file="./components/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<!-- Sidebar -->
			<div class="col-md-2 bg-container-forms">
				<button class="btn btn-toggle align-items-center rounded collapsed"
					data-bs-toggle="collapse" data-bs-target="#home-collapse"
					aria-expanded="false" >Meetings</button>
				<div class="collapse" id="home-collapse">
					<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
						<li><a href="createmeeting" class="link-dark rounded">Create
								Meeting</a></li>
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
<%
 /* User user;
user= (User)session.getAttribute("userObject");
ApplicationContext context =  WebApplicationContextUtils.getWebApplicationContext(getServletContext());
MasterMeetingDao masterMeetingDao=context.getBean(MasterMeetingDao.class);
AssignedTaskDao assignedTaskDao=context.getBean(AssignedTaskDao.class);
List<MasterMeeting> todayMeetings = masterMeetingDao.getMeetingsByTodayDateAndUserId(user.getId());
List<AssignedTask>   progressTasks=assignedTaskDao.getTasksByUserIdAndInprogress(user.getId()); */

%>
			<div class="col-md-10 bg-all-forms box-div p-5">
				<div class="card col-md-12 p-1">
					<h5 class="p-3">Inprogess Task</h5>
					<div class="center-content">
					<table class="table">
	                <thead>
	                    <tr>
                        <th>Task ID</th>
                        <th>Task Name</th>
                        <th>Estimate Start Date</th>
                        <th>Estimate End Date</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${empty progressTasks1}">
                            <tr>
                                <td colspan="3">There are no in-progress tasks.</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="tasks" items="${progressTasks1}">
                                <tr>
                                    <c:if test="${not empty tasks.taskId}">
                                        <td> ${tasks.taskId}</td>
                                    </c:if>
                                     <c:if test="${not empty tasks.taskName}">
                                        <td> ${tasks.taskName}</td>
                                    </c:if>
                                    <c:if test="${not empty tasks.estStartDate}">
                                        <td> ${tasks.estStartDate}</td>
                                    </c:if>
                                    <c:if test="${not empty tasks.estEndDate}">
                                        <td> ${tasks.estEndDate}</td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
					</div>
				</div>
				
				<br>

				<div class="card col-md-12 p-1">
					<h5 class="p-3">Upcoming Task</h5>
					<div class="center-content">
						<table class="table">
	                <thead>
	                    <tr>
                        <th>Task ID</th>
                        <th>Task Name</th>
                        <th>Estimate Start Date</th>
                        <th>Estimate End Date</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${empty upcomingTasks1}">
                            <tr>
                                <td colspan="3">There are no upcomingTasks tasks.</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="tasks1" items="${upcomingTasks1}">
                                <tr>
                                    <c:if test="${not empty tasks1.taskId}">
                                        <td> ${tasks1.taskId}</td>
                                    </c:if>
                                     <c:if test="${not empty tasks1.taskName}">
                                        <td> ${tasks1.taskName}</td>
                                    </c:if>
                                    <c:if test="${not empty tasks1.estStartDate}">
                                        <td> ${tasks1.estStartDate}</td>
                                    </c:if>
                                    <c:if test="${not empty tasks1.estEndDate}">
                                        <td> ${tasks1.estEndDate}</td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
					</div>
				</div>





			</div>

		</div>
	</div>
	<%@ include file="./components/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>

	<!-- Bootstrap JavaScript -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
		integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
		crossorigin="anonymous"></script>

	<script>
		$(document).ready(function() {
			// Initialize Bootstrap components, including dropdowns
			$('.dropdown-toggle').dropdown();
		});
	</script>
</body>
</html>