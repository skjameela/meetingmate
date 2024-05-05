<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.itcrats.meetingmate.model.*" %>
<%@ page import="com.itcrats.meetingmate.Dao.*" %>
<%@ page import ="org.springframework.context.ApplicationContext"%>
<%@ page import ="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="java.util.*"%>
<jsp:include page="./components/headerlinks.jsp" />

<!-- Header part -->
<head>
<title>Meeting Mate Home</title>
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="css/homepage.css">

<!-- <link rel="stylesheet" href="bootstrap.css">
<link rel="stylesheet" href="font-awesome.css"> -->
<script src="jquery.js"></script>
<script src="bootstrap.js"></script>
<!-- Your custom CSS styles -->
<style>
/* Add your custom CSS styles here */
.dropdown {
	display: inline-block;
	margin: 10px;
}

.box-div {
	width: 100%;
	text-align: center;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh; /* This centers the content vertically on the page */
	/*   background-color:#ffffff; */
}

.box-div {
	/* Set the background color if necessary */
	background-color: #ffffff;
}

.card {
	width: 300px; /* Adjust the width as needed */
	height: 400px; /* Adjust the height as needed */
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

<!-- body part -->
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
					aria-expanded="false">Meetings</button>
				<div class="collapse" id="home-collapse">
					<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
						<li><a href="/createmeeting" class="link-dark rounded">Create
								Meeting</a></li>
						<li><a href="/meetinghistory" class="link-dark rounded">Meeting History</a></li>
					</ul>
				</div>
				<br>
				<button class="btn btn-toggle align-items-center rounded collapsed"
					data-bs-toggle="collapse" data-bs-target="#account-collapse"
					aria-expanded="false">Task</button>
				<div class="collapse" id="account-collapse">
					<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
						<%
					if(user.getUserType().equalsIgnoreCase("user"))
					{
					%>
						
						<li><a href="current_inprogress_task" class="link-dark rounded">current/inprogress Task</a></li>
						<li><a href="taskhistory" class="link-dark rounded">Task History</a></li>
						<%
					}else{
						%>
						<li><a href="createtask" class="link-dark rounded">Create Task</a></li>
						<li><a href="current_inprogress_task" class="link-dark rounded">current/inprogress Task</a></li>
						<li><a href="taskhistory" class="link-dark rounded">Task History</a></li>
						<!-- <li><a href="taskupdate" class="link-dark rounded">Task Update</a></li> -->
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
			<div class="col-md-10 bg-all-forms box-div">
				<div class="card">
					<h5 class="p-3">Today Meetings</h5>
					<div class="center-content">
						<ul>
							<c:choose>
								<c:when test="${empty todayMeetings}">
									<p>There are no meetings today.</p>
								</c:when>
								<c:otherwise>
									<c:forEach var="meeting" items="${todayMeetings}">
									   <c:if test="${not empty meeting.MId}">
											<span name="mid" style="display:none;"><strong>mId: </strong>${meeting.MId}<br></span>
										</c:if> 
										<c:if test="${not empty meeting.meetingId}">
<%-- 										<a href="/searchMeetingRedirect?meetingid=yourMeetingIdValue&mid=yourMidValue">${meeting.meetingId}</a>
 --%>										
<a href="#" class="search-link" id="meetingId" name="meetingId" data-meetingid="${meeting.meetingId}" data-mid="${meeting.MId}">
  <strong>Meeting Id : </strong>${meeting.meetingId}<br>
</a>										
</c:if>
										<c:if test="${not empty meeting.agenda}">
											<strong>Agenda : </strong>${meeting.agenda}<br>
										</c:if>
										<c:if test="${not empty meeting.scheduleStartDate}">
											<strong>Start Time : </strong>${meeting.scheduleStartDate}<br>
										</c:if>
										<c:if test="${not empty meeting.scheduleEndDate}">
											<strong>End Time : </strong>${meeting.scheduleEndDate}<br>
										</c:if>
									
										
											<hr>
											<!-- Use an <hr> element as a horizontal line -->
									

									</c:forEach>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>

				<div class="card ">
					<h5 class=" p-3">inprogress/upcoming Tasks</h5>
					<div class="center-content">
						<ul>
							<c:choose>
								<c:when test="${empty progressTasks}">
									<p>There are no inprogress tasks.</p>
								</c:when>
								<c:otherwise>
									<c:forEach var="tasks" items="${progressTasks}">
										<c:if test="${not empty tasks.taskId}">
									
										<a href="#" class="search-link-task" id="taskId" name="taskId" data-taskid="${tasks.taskId}">
										  <strong>Task Id : </strong>${tasks.taskId}<br>
										</a>
											
										</c:if>
										
										<c:if test="${not empty tasks.taskName }">
										<strong>Task Name : </strong>${tasks.taskName}<br>

										</c:if>
										
										<c:if test="${not empty tasks.estStartDate }">
											<strong>Start Date : </strong>${tasks.estStartDate}<br>

										</c:if>

										<c:if test="${not empty tasks.estEndDate}">
											<strong>End Date : </strong>${tasks.estEndDate}<br>
										</c:if>
										<c:if test="${not empty tasks.taskStatus}">
										<strong>Task Status : </strong>${tasks.taskStatus}<br>
										</c:if>
<%-- 
										<c:if test="${not empty tasks.tasktype}"></c:if>
										<strong>Task Type : </strong>${tasks.tasktype}<br> --%>
                                           <hr>
									</c:forEach>

                               
								</c:otherwise>
                                 
							</c:choose>
						</ul>
						
						
						<ul>
						 <c:choose>
							<c:when test="${empty upcomingTasks}">
								<p>There are no upcoming tasks.</p>
							</c:when>
							<c:otherwise>
								<c:forEach var="tasks" items="${upcomingTasks}">
									<c:if test="${not empty tasks.taskId}">
									<a href="#" class="search-link-task" id="taskId" name="taskId" data-taskid="${tasks.taskId}">
									  <strong>Task Id : </strong>${tasks.taskId}<br>
									</a>
									</c:if>
									<c:if test="${not empty tasks.taskName }">
									<strong>Task Name : </strong>${tasks.taskName}<br>
									</c:if>
									<c:if test="${not empty tasks.estStartDate }">
										<strong>Start Date : </strong>${tasks.estStartDate}<br>
									</c:if>
									<c:if test="${not empty tasks.estEndDate}">
										<strong>End Date : </strong>${tasks.estEndDate}<br>
									</c:if>
									<c:if test="${not empty tasks.taskStatus}">
										<strong>Task Status : </strong>${tasks.taskStatus}<br>
									</c:if>
                                      <hr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						
						
					</ul>
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

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	
<script>

/* 
$('#meetingLink').on('click', function(e) {
    e.preventDefault();
    var meetingId = $(this).data('meetingid');
    var mid = $(this).data('mid');
    console.log("jam1");
    // Create a data object to send as JSON
    var requestData = {
        meetingid: meetingId,
        mid: mid
    };

    $.ajax({
        type: 'POST',
        url: '/searchMeetingRedirect',
        contentType: 'application/json',
        data: JSON.stringify(requestData),
        success: function(data) {
            // Check if the response contains a redirect URL
            if (data.redirect) {
                // Use window.location to navigate to the redirect URL
                window.location.href = data.redirect;
            } else {
                // Handle the response data here if needed
                console.log(data);
            }
        },
        error: function(xhr, status, error) {
            console.log("AJAX Error: " + error);
        }
    });
}); */

$('.search-link').on('click', function(e) {
    e.preventDefault();
    var meetingId = $(this).data('meetingid');

    console.log("Clicked on anchor link with meetingId: " + meetingId);

    var requestData = {
        meetingId: meetingId,
        randomVariable:"meeting"
    };

    console.log(JSON.stringify(requestData));
falge=true;
    $.ajax({
        type: 'POST',
        url: '/searchMeetingRedirect',
        contentType: 'application/json',
        data: JSON.stringify(requestData),
        processData: false,
        success: function(data) {
            console.log(data);
            // Navigate to /meetinghistory only after the AJAX call is successful
            navigateToMeetingHistory();
        },
        error: function(xhr, status, error) {
            console.log("AJAX Error: " + error);
        }
    });

    function navigateToMeetingHistory() {
        // Redirect to /meetinghistory
        window.location.href = '/meetinghistory';
    }
});




$('.search-link-task').on('click', function(e) {
    e.preventDefault();
    var taskId = $(this).data('taskid');
 
    console.log("Clicked on anchor link with meetingId: " + taskId);
 
    var requestData = {
    		taskId: taskId,
        randomVariable:"task"
    };
 
    console.log(JSON.stringify(requestData));
falge=true;
    $.ajax({
        type: 'POST',
        url: '/searchTaskRedirect',
        contentType: 'application/json',
        data: JSON.stringify(requestData),
        processData: false,
        success: function(data) {
            console.log(data);
            // Navigate to /meetinghistory only after the AJAX call is successful
            navigateToMeetingHistory();
        },
        error: function(xhr, status, error) {
            console.log("AJAX Error: " + error);
        }
    });
 
    function navigateToMeetingHistory() {
        // Redirect to /meetinghistory
        window.location.href = '/taskhistory';
    }
});

</script>

	
</body>
</html>