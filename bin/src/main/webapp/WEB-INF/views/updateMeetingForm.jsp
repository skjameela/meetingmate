<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.itcrats.meetingmate.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Meeting</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/homepage.css">
<style type="text/css">
.enabled-date-input {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 14px;
}

.disabled-date-input {
	width: 100%;
	padding: 10px;
	border: 1px solid #f0f0f0;
	background-color: #f0f0f0;
	border-radius: 5px;
	font-size: 14px;
	color: #999;
}
</style>
<script src="path/to/jquery.min.js"></script>

</head>
<body>
<%
User user1= (User)session.getAttribute("userObject1");
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
						<li><a href="/createmeeting" class="link-dark rounded">Create
								Meeting</a></li>
						<li><a href="/meetinghistory" class="link-dark rounded">Meeting
								History</a></li>
					</ul>
				</div>
				<br>
				<button class="btn btn-toggle align-items-center rounded collapsed"
					data-bs-toggle="collapse" data-bs-target="#account-collapse"
					aria-expanded="false">Task</button>
				<div class="collapse" id="account-collapse">
					<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
						<%
					if(user1.getUserType().equalsIgnoreCase("user"))
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
			<div class=" col-12 col-md-10 bg-all-forms">
				<!-- Radio Buttons -->
				<div class="mb-3">
					<label class="form-label">Select an option:</label>
					<div class="form-check" style="display: none;"
						id="updateMasterMeetingOptionId">
						<input class="form-check-input" type="radio" name="updateOption"
							id="updateMasterMeetingOption"> <label
							class="form-check-label" for="updateMasterMeetingOption">Update
							Meeting</label>
					</div>
					<div class="form-check" style="display: none;"
						id="updateFollowUpMeetingOptionId">
						<input class="form-check-input" type="radio" name="updateOption"
							id="updateFollowUpMeetingOption"> <label
							class="form-check-label" for="updateFollowUpMeetingOption">Update
							Recurrence Meeting</label>
					</div>
				</div>
				<!-- Update Master Meeting Form -->
				<div id="masterMeetingForm" style="display: none;">
					<h3 class="text-center mt-4">Update Meeting</h3>

					<%
					HttpSession httpSession = request.getSession();
					MasterMeeting user = (MasterMeeting) httpSession.getAttribute("meeting");
					String userEmpId = Integer.toString(user.getMId());
					System.out.println(userEmpId);
					%>

					<input type="hidden" id="successMessage" value="${successMessage}">

					<form class="py-5 px-3" id="personalForm"
						action="createmastermeeting" method="post">
						<div class="row" id="parentEleDiv">
							<div class="form-group col-12 mb-5">
								<label class="form-label font-weight-website"><b
									class="form-label text-danger mr-1">*</b>Indicates a required
									field</label>
							</div>
							<div class="form-group col-12 col-md-4 mb-5"
								style="display: none;">
								<label class="form-label font-weight-website" for="mId">Mid<sup
									class="text-danger">*</sup></label> <input class="form-control"
									type="text" id="mId" name="mId" value="<%=userEmpId%>"
									readonly />

							</div>
							<div class="form-group col-12 col-md-4 mb-5">
								<label class="form-label font-weight-website" for="ownerId">Owner 
									ID<sup class="text-danger">*</sup>
								</label> <input class="form-control" type="text" id="ownerId"
									name="ownerId" value="${meeting.ownerId}" readonly />

							</div>
							<div class="form-group col-12 col-md-4 mb-5">
								<label class="form-label font-weight-website" for="meetingId">Meeting ID<sup
									class="text-danger">*</sup></label> <input class="form-control"
									type="text" id="meetingId" name="meetingId"
									value="${meeting.meetingId}" readonly />

							</div>
							<div class="form-group col-12 col-md-4 mb-5"
								style="display: none;">
								<label class="form-label font-weight-website" for="recurrence">Recurrence<sup
									class="text-danger">*</sup></label> <input class="form-control"
									type="text" id="recurrence" name="recurrence"
									value="${meeting.recurrence}" readonly />

							</div>
							<div class="form-group col-12 col-md-4 mb-5"
								style="display: none;">
								<label class="form-label font-weight-website"
									for="recurrencePattern">Recurrence Pattern<sup
									class="text-danger">*</sup></label> <input class="form-control"
									type="text" id="recurrencePattern" name="recurrencePattern"
									value="${meeting.recurrencePattern}" readonly />

							</div>
							<div class="form-group col-12 col-md-4 mb-5">
								<label class="form-label font-weight-website" for="subject">Subject<sup
									class="text-danger">*</sup></label> <input class="form-control"
									type="text" id="subject" name="subject"
									value="${meeting.subject}" readonly /> <span
									class="error-message" id="subject-error"></span>

							</div>
							<div class="form-group col-12 col-md-4 mb-5">
								<label class="form-label font-weight-website" for="agenda">Agenda<sup
									class="text-danger">*</sup></label> <input class="form-control"
									type="text" id="agenda" name="agenda" value="${meeting.agenda}"
									readonly />

							</div>

							<div class="form-group col-12 col-md-4 mb-5">
								<label class="form-label font-weight-website"
									for="scheduleStartDate">Schedule Start Date<sup
									class="text-danger">*</sup></label> <input class="form-control"
									type="date" id="scheduleStartDate" name="scheduleStartDate"
									value="${meeting.scheduleStartDate}" required /> <span
									class="error-message" id="scheduleStartDate-error"></span>
								<!-- <span id="scheduleStartDate-error" style="color: red;"></span> -->
							</div>

							<div class="form-group col-12 col-md-4 mb-5">
								<label class="form-label font-weight-website"
									for="scheduleEndDate">Schedule End Date<sup
									class="text-danger">*</sup></label> <input class="form-control"
									type="date" id="scheduleEndDate" name="scheduleEndDate"
									value="${meeting.scheduleEndDate}" required /> <span
									class="error-message" id="scheduleEndDate-error"></span>
							</div>

							<div class="form-group col-12 col-md-4 mb-5">
								<label class="form-label font-weight-website"
									for="scheduleStartTime">Schedule Start Time<sup
									class="text-danger">*</sup></label> <input class="form-control"
									type="time" id="scheduleStartTime" name="scheduleStartTime"
									value="${meeting.scheduleStartTime}" required /> <span
									class="error-message" id="scheduleStartTime-error"></span>
							</div>

							<div class="form-group col-12 col-md-4 mb-5">
								<label class="form-label font-weight-website"
									for="scheduleEndTime">Schedule End Time<sup
									class="text-danger">*</sup></label> <input class="form-control"
									type="time" id="scheduleEndTime" name="scheduleEndTime"
									value="${meeting.scheduleEndTime}" required /> <span
									class="error-message" id="scheduleEndTime-error"></span>
							</div>
							<div class="form-group col-12 col-md-4 mb-5">
								<label class="form-label font-weight-website"
									for="meetingStatus">Meeting Status<sup
									class="text-danger">*</sup></label> <select class="form-control"
									id="meetingStatus" name="meetingStatus">
									<c:choose>
										<c:when test="${meeting.meetingStatus == 'yet to start'}">
											<option value="yet to start" selected>Yet to Start</option>
											<option value="completed">Completed</option>
											<option value="canceled">meeting canceled</option>
										</c:when>
										<c:when test="${meeting.meetingStatus == 'completed'}">
											<option value="yet to start">Yet to Start</option>
											<option value="completed" selected>Completed</option>
											<option value="canceled">meeting canceled</option>
										</c:when>
										<c:when test="${meeting.meetingStatus == 'meeting canceled'}">
											<option value="yet to start">Yet to Start</option>
											<option value="completed">Completed</option>
											<option value="canceled" selected>meeting canceled</option>
										</c:when>
									</c:choose>
								</select>
							</div>


							<div class="form-group col-12 col-md-4 mb-5">
								<label class="form-label font-weight-website" for="videolink">Video Link<!-- <sup
									class="text-danger">*</sup> --></label> <input class="form-control"
									type="text" id="videolink" name="videolink"
									value="${meeting.vedioLink}" /> <span class="error-message"
									id="videolink-error"></span>


							</div>




							<div class="form-group col-12 col-md-4 mb-5"
								style="display: none;">
								<label class="form-label font-weight-website"
									for="isFollowUpMeet">Is FollowUp Meet<sup
									class="text-danger">*</sup></label> <input class="form-control"
									type="text" id="isFollowUpMeet" name="isFollowUpMeet"
									value="${meeting.isFollowupMeet}" readonly />

							</div>



							<div class="form-group col-12 col-md-4 mb-5"
								style="display: none;">
								<label class="form-label font-weight-website"
									for="masterMeetingId">Master Meeting Id<sup
									class="text-danger">*</sup></label> <input class="form-control"
									type="text" id="masterMeetingId" name="masterMeetingId"
									value="${meeting.masterMeetingId}" readonly />

							</div>



						</div>
						<div class="d-flex flex-row justify-content-end mr-5">
							<button class="btn custom-button font-weight-website zoom-ele"
								type="button" onclick="submitForm()">Update Meeting</button>
						</div>
					</form>


				</div>









				<div id="recurenceMeetingForm" style="display: none;">
					<h3 class="text-center mt-4">Update Recurrence Meeting</h3>

					<input type="hidden" id="successMessage" value="${successMessage}">

					<form class="py-5 px-3" id="personalForm1"
						action="createmastermeeting" method="post">
						<div class="row" id="parentEleDiv">
							<div class="form-group col-12 mb-5">
								<label class="form-label font-weight-website"><b
									class="form-label text-danger mr-1">*</b>Indicates a required
									field</label>
							</div>
							<div class="form-group col-12 col-md-4 mb-5"
								style="display: none;">
								<label class="form-label font-weight-website" for="mId1">Mid<sup
									class="text-danger">*</sup></label> <input class="form-control"
									type="text" id="mId1" name="mId1" value="<%=userEmpId%>"
									readonly />

							</div>
							<div class="form-group col-12 col-md-4 mb-5">
								<label class="form-label font-weight-website" for="ownerId1">Owner 
									ID<sup class="text-danger">*</sup>
								</label> <input class="form-control" type="text" id="ownerId1"
									name="ownerId1" value="${meeting.ownerId}" readonly />

							</div>
							<div class="form-group col-12 col-md-4 mb-5">
								<label class="form-label font-weight-website" for="meetingId1">Meeting ID<sup
									class="text-danger">*</sup></label> <input class="form-control"
									type="text" id="meetingId1" name="meetingId1"
									value="${meeting.meetingId}" readonly />

							</div>
							<div class="form-group col-12 col-md-4 mb-5">
								<label class="form-label font-weight-website" for="recurrence1">recurrence<sup
									class="text-danger">*</sup></label> <input class="form-control"
									type="text" id="recurrence1" name="recurrence1"
									value="${meeting.recurrence}" readonly />

							</div>
							<div class="form-group col-12 col-md-4 mb-5">
								<label class="form-label font-weight-website"
									for="recurrencePattern1">Recurrence Pattern<sup
									class="text-danger">*</sup></label> <input class="form-control"
									type="text" id="recurrencePattern1" name="recurrencePattern1"
									value="${meeting.recurrencePattern}" readonly />

							</div>
							<div class="form-group col-12 col-md-4 mb-5">
								<label class="form-label font-weight-website" for="subject1">Subject<sup
									class="text-danger">*</sup></label> <input class="form-control"
									type="text" id="subject1" name="subject1"
									value="${meeting.subject}" readonly />

							</div>
							<div class="form-group col-12 col-md-4 mb-5">
								<label class="form-label font-weight-website" for="agenda1">Agenda<sup
									class="text-danger">*</sup></label> <input class="form-control"
									type="text" id="agenda1" name="agenda1"
									value="${meeting.agenda}" readonly />

							</div>


							<div class="form-group col-12 col-md-4 mb-5">
								<label class="form-label font-weight-website"
									for="scheduleStartDate1">Schedule Start Date<sup
									class="text-danger">*</sup></label> <input class="form-control"
									type="date" id="scheduleStartDate1" name="scheduleStartDate1"
									class="enabled-date-input" value="${meeting.scheduleStartDate}" />
								<span class="error-message" id="scheduleStartDate1-error"></span>

							</div>

							<div class="form-group col-12 col-md-4 mb-5">
								<label class="form-label font-weight-website"
									for="scheduleEndDate1">Schedule End Date<sup
									class="text-danger">*</sup></label> <input class="form-control"
									type="date" id="scheduleEndDate1" name="scheduleEndDate1"
									class="enabled-date-input" value="${meeting.scheduleEndDate}" />
								<span class="error-message" id="scheduleEndDate1-error"></span>

							</div>

							<div class="form-group col-12 col-md-4 mb-5">
								<label class="form-label font-weight-website"
									for="scheduleStartTime1">Schedule Start Time<sup
									class="text-danger">*</sup></label> <input class="form-control"
									type="time" id="scheduleStartTime1" name="scheduleStartTime1"
									value="${meeting.scheduleStartTime}" /> <span
									class="error-message" id="scheduleStartTime1-error"></span>

							</div>
							<div class="form-group col-12 col-md-4 mb-5">
								<label class="form-label font-weight-website"
									for="scheduleEndTime1">Schedule End Time<sup
									class="text-danger">*</sup></label> <input class="form-control"
									type="time" id="scheduleEndTime1" name="scheduleEndTime1"
									value="${meeting.scheduleEndTime}" /> <span
									class="error-message" id="scheduleEndTime1-error"></span>

							</div>
							<div class="form-group col-12 col-md-4 mb-5">
								<label class="form-label font-weight-website"
									for="meetingStatus1">Meeting Status<sup
									class="text-danger">*</sup></label> <select class="form-control"
									id="meetingStatus1" name="meetingStatus1">
									<c:choose>
										<c:when test="${meeting.meetingStatus == 'yet to start'}">
											<option value="yet to start" selected>Yet to Start</option>
											<option value="completed">Completed</option>
											<option value="canceled">meeting canceled</option>
										</c:when>
										<c:when test="${meeting.meetingStatus == 'completed'}">
											<option value="yet to start">Yet to Start</option>
											<option value="completed" selected>Completed</option>
											<option value="canceled">meeting canceled</option>
										</c:when>
										<c:when test="${meeting.meetingStatus == 'meeting canceled'}">
											<option value="yet to start">Yet to Start</option>
											<option value="completed">Completed</option>
											<option value="canceled" selected>meeting canceled</option>
										</c:when>
									</c:choose>
								</select>
							</div>
							
							
							<div class="form-group col-12 col-md-4 mb-5">
								<label class="form-label font-weight-website" for="videolink1">Video Link<!-- <sup
									class="text-danger">*</sup> --></label> <input class="form-control"
									type="text" id="videolink1" name="videolink1"
									value="${meeting.vedioLink}" /> <span class="error-message"
									id="videolink1-error"></span>
							</div>




							<div class="form-group col-12 col-md-4 mb-5">
								<label class="form-label font-weight-website"
									for="isFollowUpMeet1">Is FollowUp Meet<sup
									class="text-danger">*</sup></label> <input class="form-control"
									type="text" id="isFollowUpMeet1" name="isFollowUpMeet1"
									value="${meeting.isFollowupMeet}" readonly />

							</div>



							<div class="form-group col-12 col-md-4 mb-5">
								<label class="form-label font-weight-website"
									for="masterMeetingId1">Master Meeting Id<sup
									class="text-danger">*</sup></label> <input class="form-control"
									type="text" id="masterMeetingId1" name="masterMeetingId1"
									value="${meeting.masterMeetingId}" readonly />

							</div>



						</div>
						<div class="d-flex flex-row justify-content-end mr-5">
							<button class="btn custom-button font-weight-website zoom-ele"
								type="button" onclick="submitForm1()">Update Meeting</button>
						</div>
					</form>


				</div>







			</div>
		</div>
	</div>

	<%@ include file="./components/footer.jsp"%>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<script src="https://cdn.jsdelivr.net/npm/pikaday/pikaday.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/pikaday/pikaday.min.js"></script>

	<script>
<%// Assuming you have a Java object or a session attribute named "meeting"
// You need to retrieve and set the value of the "meeting" variable here
// For example, if it's a session attribute:
MasterMeeting meeting = (MasterMeeting) session.getAttribute("meeting");%>
const updateFollowUpMeetingOptionId = document.getElementById('updateFollowUpMeetingOptionId'); // Assuming you have an ID for the recurrence radio button
const updateMasterMeetingOptionId = document.getElementById('updateMasterMeetingOptionId'); // Assuming you have an ID for the recurrence radio button
const heading = document.getElementById('heading');
const heading1 = document.getElementById('heading1');

const recurrenceValueFromBackend = "<%=meeting.getRecurrence()%>"; // Replace with the actual value from your backend

if (recurrenceValueFromBackend === "none") {
    console.log("hi");
    updateFollowUpMeetingOptionId.style.display = 'none';
    updateMasterMeetingOptionId.style.display = 'block';
} else {
    updateFollowUpMeetingOptionId.style.display = 'block';
    updateMasterMeetingOptionId.style.display = 'none'; // Show the radio button
}

const masterMeetingForm = document.getElementById('masterMeetingForm');

const updateMasterMeetingOption = document.getElementById('updateMasterMeetingOption'); // Assuming you have an ID for the recurrence radio button

updateMasterMeetingOption.addEventListener('change', function () {
    if (updateMasterMeetingOption.checked) {
        masterMeetingForm.style.display = 'block';
    } else {
        masterMeetingForm.style.display = 'none';
    }
});

const successMessage = document.getElementById('successMessage').value;
if (successMessage.trim() !== "") {
    // Display an alert with the success message
    alert(successMessage);
}

// Add event listener to the start date input
document.getElementById('scheduleStartDate').addEventListener('change', function () {
    validateDates();
});

// Add event listener to the end date input
document.getElementById('scheduleEndDate').addEventListener('change', function () {
    validateDates();
});

function validateDates() {
    const startDate = new Date(document.getElementById('scheduleStartDate').value);
    const endDate = new Date(document.getElementById('scheduleEndDate').value);

    if (startDate > endDate) {
        alert('Schedule End Date must be greater than or equal to Schedule Start Date');
        // You can clear the end date input or handle the error in another way.
        document.getElementById('scheduleEndDate').value = '';
    }

}

    
    
    
    document.getElementById('scheduleStartTime').addEventListener('change', function () {
        validateTimes();
    });

    // Add event listener to the end time input
    document.getElementById('scheduleEndTime').addEventListener('change', function () {
        validateTimes();
    });

    function validateTimes() {
        const startTime = document.getElementById('scheduleStartTime').value;
        const endTime = document.getElementById('scheduleEndTime').value;

        const startParts = startTime.split(':');
        const endParts = endTime.split(':');

        const startHour = parseInt(startParts[0], 10);
        const startMinute = parseInt(startParts[1], 10);
        const endHour = parseInt(endParts[0], 10);
        const endMinute = parseInt(endParts[1], 10);

        if (startHour > endHour || (startHour === endHour && startMinute >= endMinute)) {
            alert('Schedule End Time must be greater than Schedule Start Time.');
            // You can clear the end time input or handle the error in another way.
            document.getElementById('scheduleEndTime').value = '';
        }
    }
    
    
    
    
    
    document.getElementById('scheduleStartTime1').addEventListener('change', function () {
        validateTimes1();
    });

    // Add event listener to the end time input
    document.getElementById('scheduleEndTime1').addEventListener('change', function () {
        validateTimes1();
    });

    function validateTimes1() {
        const startTime = document.getElementById('scheduleStartTime1').value;
        const endTime = document.getElementById('scheduleEndTime1').value;

        const startParts = startTime.split(':');
        const endParts = endTime.split(':');

        const startHour = parseInt(startParts[0], 10);
        const startMinute = parseInt(startParts[1], 10);
        const endHour = parseInt(endParts[0], 10);
        const endMinute = parseInt(endParts[1], 10);

        if (startHour > endHour || (startHour === endHour && startMinute >= endMinute)) {
            alert('Schedule End Time must be greater than Schedule Start Time.');
            // You can clear the end time input or handle the error in another way.
            document.getElementById('scheduleEndTime1').value = '';
        }
    }
    
    
    
 /*    $('#scheduleStartDate').on('input', function() {
        if ($(this).val() === "") {
            $('#scheduleStartDate-error').text('Required Field').css('color', 'red');
            isValid = false;
        } else {
            $('#scheduleStartDate-error').text('');
            isValid = true;
        }
    }); */

    
    
    
/*     $('#scheduleStartDate').on('input', function() {
        if ($(this).val() === "") {
            $('#scheduleStartDate-error').text('Required Field').css('color', 'red');
            isValid = false;
        } else {
            $('#scheduleStartDate-error').text('');
            isValid = true;
        }
    }); */
    
    
    
    



    
    
    
    
    
    let isValid = true;

    const alphaspaceRegex = /\bhttps?:\/\/\S+/;

    function checkValidations() {
        $('.error-message').text('');

        const scheduleStartDate = document.getElementById('scheduleStartDate');
        const scheduleEndDate = document.getElementById('scheduleEndDate');
        const scheduleStartTime = document.getElementById('scheduleStartTime');
        const scheduleEndTime = document.getElementById('scheduleEndTime');
        const videolink=document.getElementById('videolink');
        


         if (scheduleStartDate.value === "") {
            $('#scheduleStartDate-error').text('Required Field').css('color', 'red');
            isValid = false;
        }
        


        if (scheduleEndDate.value === "") {
            $('#scheduleEndDate-error').text('Required Field').css('color', 'red');
            isValid = false;
        }
    
        if (scheduleStartTime.value === "") {
            $('#scheduleStartTime-error').text('Required Field').css('color', 'red');
            isValid = false;
        }
       

        if (scheduleEndTime.value === "") {
            $('#scheduleEndTime-error').text('Required Field').css('color', 'red');
            isValid = false;
        }
      /*   if(videolink.value==="")
        	{
        	$('#videolink-error').text('Required Field').css('color', 'red');
        	 isValid = false;
        	}
        else if (!alphaspaceRegex.test(videolink.value)) {
            $('#videolink-error').text('It is not a valid videolink url').css('color', 'red');
            isValid = false; // Mark validation as failed
        } */
       
    }




    function submitForm() {
        isValid = true; // Reset isValid

        checkValidations();

        if (isValid) {
            console.log(document.getElementById("mId").value);
            var data = {
                agenda: document.getElementById("agenda").value,
                mid: document.getElementById("mId").value,
                ownerId: $('#ownerId').val(),
                subject: $('#subject').val(),
                scheduleStartDate: $('#scheduleStartDate').val(),
                scheduleEndDate: $('#scheduleEndDate').val(),
                scheduleStartTime: $('#scheduleStartTime').val(),
                scheduleEndTime: $('#scheduleEndTime').val(),
                meetingStatus: $('#meetingStatus').val(),
                vedioLink: $('#videolink').val(),
                meetingId: $('#meetingId').val(),
                masterMeetingId: $('#masterMeetingId').val(),
                recurrence: $('#recurrence').val(),
                recurrencePattern: $('#recurrencePattern').val(),
                isFollowupMeet: $('#isFollowUpMeet').val()
            };

            $.ajax({
                type: "POST",
                url: "/updateMeeting",
                data: JSON.stringify(data),
                contentType: "application/json",
                processData: false,
                success: function (response) {
                    // Display the success message from the response
                    alert(response.successMessage);
                    console.log(data);
                    console.log(JSON.stringify(data));
                    window.location.href = "/meetinghistory";

                    // Optionally, you can reset the form or perform any other actions here
                },
                error: function (error) {
                    // Handle errors if needed
                    console.log("error called");
                    console.log(error);
                    console.log(data);
                    console.log(JSON.stringify(data));
                }
            });
        }
    }

    
     
     
     
     
     const recurenceMeetingForm = document.getElementById('recurenceMeetingForm');

     const updateFollowUpMeetingOption = document.getElementById('updateFollowUpMeetingOption'); // Assuming you have an ID for the recurrence radio button
     
     updateFollowUpMeetingOption.addEventListener('change', function () {
         if (updateFollowUpMeetingOption.checked) {
         	recurenceMeetingForm.style.display = 'block';
         } else {
         	recurenceMeetingForm.style.display = 'none';
         }
     });
     
     
     
     
     scheduleStartDate1 = document.getElementById('scheduleStartDate1');
     scheduleEndDate1 = document.getElementById('scheduleEndDate1');
     scheduleStartTime1 = document.getElementById('scheduleStartTime1');
     scheduleEndTime1 = document.getElementById('scheduleEndTime1');
     videolink1 = document.getElementById('videolink1');

     
     let isValid1 = true;
     function checkValidations1() {
     	   $('.error-message').text('');

     	   
     	    
     	    if(scheduleStartDate1.value=="")
     	    {
     	      $('#scheduleStartDate1-error').text('Required Field').css('color', 'red');
     	        isValid1 = false; // Mark validation as failed

     	    }
     	    
     	    
     	    
     	    if(scheduleEndDate1.value=="")
     	    {
     	      $('#scheduleEndDate1-error').text('Required Field').css('color', 'red');
     	        isValid1 = false; // Mark validation as failed

     	    }
     	    
     	    
     	    if(scheduleStartTime1.value=="")
     	    {
     	      $('#scheduleStartTime1-error').text('Required Field').css('color', 'red');
     	        isValid1 = false; // Mark validation as failed

     	    }
     	    
     	    
     	    if(scheduleEndTime1.value=="")
     	    {
     	      $('#scheduleEndTime1-error').text('Required Field').css('color', 'red');
     	        isValid1 = false; // Mark validation as failed

     	    }
     	    
     	    if(videolink1.value==="")
        	{
        	$('#videolink1-error').text('Required Field').css('color', 'red');
        	 isValid1 = false;
        	}
        else if (!alphaspaceRegex.test(videolink1.value)) {
            $('#videolink1-error').text('It is not a valid videolink url').css('color', 'red');
            isValid1 = false; // Mark validation as failed
        }
     	    
     	

     } 
     
     
     
     
     
     
     function submitForm1() {
    	 isValid1=true;
    	 checkValidations1();
         var data={
        		mid: $('#mId1').val(),
        		agenda: document.getElementById("agenda").value,
             	ownerId: $('#ownerId1').val(),
             	subject: $('#subject1').val(),
             	scheduleStartDate: $('#scheduleStartDate1').val(),
             	scheduleEndDate: $('#scheduleEndDate1').val(),
             	scheduleStartTime: $('#scheduleStartTime1').val(),
             	scheduleEndTime: $('#scheduleEndTime1').val(),
             	meetingStatus: $('#meetingStatus1').val(),
             	vedioLink: $('#videolink1').val(),

             	meetingId: $('#meetingId1').val(),
             	masterMeetingId: $('#masterMeetingId1').val(),
             	recurrence:$('#recurrence1').val(),
             	recurrencePattern:$('#recurrencePattern1').val(),
             	isFollowupMeet:$('#isFollowUpMeet1').val()
         }
         if(isValid1){
         $.ajax({
             type: "POST",
             url: "/updateRecurrenceMeeting",
             data: JSON.stringify(data),
             contentType:"application/json",
             processData:false,
             success: function (response) {
                 // Display the success message from the response
                 alert(response.successMessage);
                 window.location.href = "/meetinghistory";

                 // Optionally, you can reset the form or perform any other actions here
             },
             error: function (error) {
                 // Handle errors if needed
                 console.log("error called");
                 console.log(error);
             }
         });
     }
     }
       
       
       
       
       
       
       
     
       const scheduleStartDateInput = document.getElementById("scheduleStartDate1");
       const scheduleEndDateInput = document.getElementById("scheduleEndDate1");

       // Replace these with the actual values from your database
       const dbScheduleStartDate = "<%=meeting.getScheduleStartDate()%>"; // Replace with the correct getter method
       const dbScheduleEndDate = "<%=meeting.getScheduleEndDate()%>"; 

		console.log(dbScheduleStartDate);
		console.log(dbScheduleEndDate);
		function updateDateRange() {
			const startDate = new Date(dbScheduleStartDate);
			const endDate = new Date(dbScheduleEndDate);

			const selectedStartDate = new Date(scheduleStartDateInput.value);
			const selectedEndDate = new Date(scheduleEndDateInput.value);

			// Ensure the selected start date is within the range
			if (selectedStartDate < startDate) {
				scheduleStartDateInput.value = dbScheduleStartDate;
			}

			// Ensure the selected end date is within the range and not before the start date
			if (selectedEndDate > endDate || selectedEndDate < startDate) {
				scheduleEndDateInput.value = dbScheduleEndDate;
			}

			scheduleStartDateInput.min = dbScheduleStartDate;
			scheduleEndDateInput.min = dbScheduleStartDate;
			scheduleEndDateInput.max = dbScheduleEndDate;
			scheduleStartDateInput.max = dbScheduleEndDate;

		}

		scheduleStartDateInput.addEventListener("change", updateDateRange);
		scheduleEndDateInput.addEventListener("change", updateDateRange);

		// Initialize the inputs with the database values
		scheduleStartDateInput.value = dbScheduleStartDate;
		scheduleEndDateInput.value = dbScheduleEndDate;

		// Call the updateDateRange function to set initial attributes
		updateDateRange();
	</script>


</body>
</html>

