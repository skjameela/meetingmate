<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<head>
<meta charset="ISO-8859-1">

<title>Meeting Info</title>

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

<link rel="stylesheet" href="css/homepage.css">
<link rel="stylesheet" href="css/home.css">


</head>
<title>Meeting Info</title>
</head>
<body>


	<div class="d-flex flex-column align-items-center">

		<%-- <h6 class="my-3 text-danger form-label font-weight-website">
								<%
								String result = (String) request.getAttribute("status");
								if (result != null)
									out.println(result);
								%>
							</h6> --%>
		<c:set var="order" value="${orderedMeetingInfo}" />

		<table class="ml-auto mr-auto pb-2">
			<thead>
				<tr>
					<th>Meeting Information</th>

				</tr>
			</thead>


			<c:forEach var="entry" items="${order}">
				<tr>
					<td>${entry.key}&nbsp;<span class="font-weight-bold">:</span></td>
					<td><span class="ml-5">${entry.value}</span></td>
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
					style="border-radius: 8px;" type="submit" value="Create Meeting" />
				<input type="hidden" name="subject"
					value="${orderedMeetingInfo['Subject']}" /> <input type="hidden"
					name="organizer" value="${orderedMeetingInfo['Organizer']}" /> <input
					type="hidden" name="meetingId"
					value="${orderedMeetingInfo['Meeting ID']}" /> <input
					type="hidden" name="recurrence"
					value="${orderedMeetingInfo['Recurrence']}" /> <input
					type="hidden" name="recurrencePattern"
					value="${orderedMeetingInfo['Recurrence Pattern']}" /> <input
					type="hidden" name="agenda" value="${orderedMeetingInfo['Agenda']}" />
				<input type="hidden" name="scheduleStartDate"
					value="${orderedMeetingInfo['Start Date']}" /> <input
					type="hidden" name="scheduleEndDate"
					value="${orderedMeetingInfo['End Date']}" /> <input type="hidden"
					name="scheduleStartTime"
					value="${orderedMeetingInfo['Start Time']}" /> <input
					type="hidden" name="scheduleEndTime"
					value="${orderedMeetingInfo['End Time']}" /> <input type="hidden"
					name="meetingStatus"
					value="${orderedMeetingInfo['Meeting Status']}" /> <input
					type="hidden" name="requiredAttendees"
					value="${orderedMeetingInfo['Required Attendees']}" /> <input
					type="hidden" name="optionalAttendees" id="optionalAttendees"
					value="${orderedMeetingInfo['Optional Attendees']}" />

			</form>


		</div>
	</div>



	<script>
		console.log("${orderedMeetingInfo['Meeting ID']}");
	</script>


</body>
</html>
