<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

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

<link rel="stylesheet" href="css/homepage.css">
<link rel="stylesheet" href="css/home.css">


</head>
<title>Meeting Info</title>
</head>
<body>


	<div class="d-flex flex-column align-items-center">
		<h1 class="pb-2">Meeting Information</h1>
		<%-- <h6 class="my-3 text-danger form-label font-weight-website">
								<%
								String result = (String) request.getAttribute("status");
								if (result != null)
									out.println(result);
								%>
							</h6> --%>
		<table class="ml-auto mr-auto pb-2">
			<tr>
				<!-- <th>Key</th>
				<th>Value</th> -->
			</tr>
			<c:forEach var="entry" items="${meetingInfo.entrySet()}">
				<tr>

					<td id="key">${entry.key}</td>
					<td>${entry.value}</td>
				</tr>
			</c:forEach>
			
		</table>

		<div class="d-flex flex-row mt-2">

			<form action="cancelcreatemeeting" method="post">
				<input
					class="btn custom-button font-weight-bold ml-auto zoom-ele mr-3"
					style="border-radius: 8px;" type="submit" value="Cancel" />
			</form>

			<form class="ml-5" id="reflectmastermeeting"
				action="reflectmastermeeting" method="post">
				<input
					class="btn custom-button font-weight-bold ml-auto zoom-ele ml-3"
					style="border-radius: 8px;" type="submit"
					value="Create Meeting" /> 
					 <input type="hidden"
					name="subject" value="${meetingInfo.Subject}" />
					<input type="hidden"
					name="organizer" value="${meetingInfo.Organizer}" />
					<input type="hidden"
					name="meetingId" value="${meetingInfo.MeetingID}" /> <input
					type="hidden" name="recurrence" value="${meetingInfo.Recurrence}" />
				<input type="hidden" name="recurrencePattern"
					value="${meetingInfo.RecurrencePattern}" /> <input type="hidden"
					name="agenda" value="${meetingInfo.Agenda}" /> <input
					type="hidden" name="scheduleStartDate" value="${meetingInfo.StartDate}" />
					<input
					type="hidden" name="scheduleEndDate" value="${meetingInfo.EndDate}" />
				<input type="hidden" name="scheduleStartTime"
					value="${meetingInfo.StartTime}" />
					 <input type="hidden"
					name="scheduleEndTime" value="${meetingInfo.EndTime}" /> <input
					type="hidden" name="meetingStatus"
					value="${meetingInfo.MeetingStatus}" /> <input type="hidden"
					name="requiredAttendees" value="${meetingInfo.RequiredAttendees}" />
				<input type="hidden" name="optionalAttendees" id="optionalAttendees"
					value="${meetingInfo.OptionalAttendees}" />

			</form>


		</div>
	</div>






</body>
</html>
