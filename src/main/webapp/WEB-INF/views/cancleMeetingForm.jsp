<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.itcrats.meetingmate.model.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Cancel Meeting</title>
    
    <!-- IT Crats fav icon -->
    <link rel="shortcut icon" type="image/x-icon"
    	href="images/ITCrats_Logo.png" alt="IT CRATS FAV ICON" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">
    <link rel="stylesheet" href="css/homepage.css">
    <style type="text/css">
        .error {
            color: red;
        }
        
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
<%@ include file="./components/navbar.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
User user1= (User)session.getAttribute("userObject1");
%>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-2 bg-container-forms">
            <button class="btn btn-toggle align-items-center rounded collapsed"
                    data-bs-toggle="collapse" data-bs-target="#home-collapse"
                    aria-expanded="false">Meetings
            </button>
            <div class="collapse" id="home-collapse">
                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                    <li><a href="/createmeeting" class="link-dark rounded">Create Meeting</a></li>
                    <li><a href="/meetinghistory" class="link-dark rounded">Meeting History</a></li>
                </ul>
            </div>
            <br>
            <button class="btn btn-toggle align-items-center rounded collapsed"
                    data-bs-toggle="collapse" data-bs-target="#account-collapse"
                    aria-expanded="false">Task
            </button>
            <div class="collapse" id="account-collapse">
                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                    <%
						if(user1.getUserType().equalsIgnoreCase("Admin"))
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
            <!-- Radio Buttons -->
            <div class="mb-3">
                <label class="form-label">Select an option:</label>
                <div class="form-check" style="display: none;" id="updateMasterMeetingOptionId">
                    <input class="form-check-input" type="radio" name="updateOption" id="updateMasterMeetingOption">
                    <label class="form-check-label" for="updateMasterMeetingOption">Cancel Meeting</label>
                </div>
                <div class="form-check" style="display: none;" id="updateFollowUpMeetingOptionId">
                    <input class="form-check-input" type="radio" name="updateOption" id="updateFollowUpMeetingOption">
                    <label class="form-check-label" for="updateFollowUpMeetingOption">Cancel Recurrence Meeting</label>
                </div>
            </div>
            
            
            
            <!-- Update Master Meeting Form -->
            <div id="masterMeetingForm" style="display: none;">
        <h3 class="text-center mt-4">Cancel Meeting</h3>
        
           <input type="hidden" id="successMessage" value="${successMessage}">
                          <%
 HttpSession httpSession = request.getSession();
 MasterMeeting user = (MasterMeeting)httpSession.getAttribute("meeting");
 String userEmpId =Integer.toString(user.getMId());
 System.out.println(userEmpId);
%> 
            	<form class="py-5 px-3" id="personalForm"
					action="createmastermeeting" method="post">
					<div class="row" id="parentEleDiv">
						<div class="form-group col-12 mb-5">
							<label class="form-label font-weight-website"><b
								class="form-label text-danger mr-1">*</b>Indicates a required
								field</label>
						</div>
							<div class="form-group col-12 col-md-4 mb-5" style="display: none;">
							<label class="form-label font-weight-website" for="mId">Mid<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="mId" name="mId" value="<%= userEmpId %>" readonly />

						</div> 
						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website" for="ownerId">Emp ID<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="ownerId" name="ownerId" value="${meeting.ownerId}" readonly />

						</div>
						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website" for="meetingId">Meeting ID<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="meetingId" name="meetingId" value="${meeting.meetingId}"
								readonly />

						</div>
						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website" for="recurrence">Recurrence<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="recurrence" name="recurrence" value="${meeting.recurrence}" readonly />

						</div>
						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website" for="recurrencePattern">Recurrence Pattern<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="recurrencePattern" name="recurrencePattern" value="${meeting.recurrencePattern}" readonly />

						</div>
						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website" for="subject">Subject<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="subject" name="subject" value="${meeting.subject}"  readonly/>

						</div>
						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website" for="agenda">Agenda<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="agenda" name="agenda" value="${meeting.agenda}"  readonly/>

						</div>
						
						
						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website"
								for="scheduleStartDate">Schedule Start Date<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="scheduleStartDate" name="scheduleStartDate"
								value="${meeting.scheduleStartDate}"  readonly/>

						</div>

						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website"
								for="scheduleEndDate">Schedule End Date<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="scheduleEndDate" name="scheduleEndDate"
								value="${meeting.scheduleEndDate}" readonly />

						</div>

						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website"
								for="scheduleStartTime">Schedule Start Time<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="scheduleStartTime" name="scheduleStartTime"
								value="${meeting.scheduleStartTime}" readonly />

						</div>
						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website"
								for="scheduleEndTime">Schedule End Time<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="scheduleEndTime" name="scheduleEndTime"
								value="${meeting.scheduleEndTime}" readonly />

						</div>
						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website" for="meetingStatus">Meeting Status<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="meetingStatus" name="meetingStatus"
								value="${meeting.meetingStatus}" readonly/>

						</div>
						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website" for="videolink">Video Link<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="videolink" name="videolink" value="${meeting.vedioLink}"
								 readonly/>

						</div>
					

					
						
						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website"
								for="isFollowUpMeet">Is FollowUp Meet<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="isFollowUpMeet" name="isFollowUpMeet"
								value="${meeting.isFollowupMeet}"  readonly/>

						</div>
						
						
						
						<div class="form-group col-12 col-md-4 mb-5">
		<label class="form-label font-weight-website"
			for="masterMeetingId">Master Meeting Id<sup
			class="text-danger">*</sup></label>
			 <input class="form-control"
			type="text" id="masterMeetingId" name="masterMeetingId" value="${meeting.masterMeetingId}" readonly />

	 </div>
	 
	 	<div class="form-group col-12 col-md-4 mb-5">
		<label class="form-label font-weight-website"
			for="remarks">Remarks<sup
			class="text-danger">*</sup></label>
			 <input class="form-control"
			type="text" id="remarks" name="remarks" value="${meeting.remarks}"  />

	 </div>


						
					</div>
					<div class="d-flex flex-row justify-content-end mr-5">
							<button class="btn custom-button font-weight-website zoom-ele"
								type="button" onclick="submitForm()">Cancel Meeting</button>
						</div>
				</form>


            </div>
            
            
            
            
            
            
            
            
            
            <div id="recurenceMeetingForm" style="display: none;">
        <h3 class="text-center mt-4">Cancel Recurrence Meeting</h3>

           <input type="hidden" id="successMessage" value="${successMessage}">
           
            	<form class="py-5 px-3" id="personalForm1"
					action="createmastermeeting" method="post">
					<div class="row" id="parentEleDiv">
						<div class="form-group col-12 mb-5">
							<label class="form-label font-weight-website"><b
								class="form-label text-danger mr-1">*</b>Indicates a required
								field</label>
						</div>
							<div class="form-group col-12 col-md-4 mb-5" style="display: none;">
							<label class="form-label font-weight-website" for="mId1">Mid<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="mId1" name="mId1" value="<%= userEmpId %>" readonly />

						</div> 
						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website" for="ownerId1">OwnerID<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="ownerId1" name="ownerId1" value="${meeting.ownerId}" readonly />

						</div>
						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website" for="meetingId1">MeetingID<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="meetingId1" name="meetingId1" value="${meeting.meetingId}"
								readonly />

						</div>
						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website" for="recurrence1">recurrence1<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="recurrence1" name="recurrence1" value="${meeting.recurrence}" readonly />

						</div>
						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website" for="recurrencePattern1">RecurrencePattern<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="recurrencePattern1" name="recurrencePattern1" value="${meeting.recurrencePattern}" readonly />

						</div>
						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website" for="subject1">Subject<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="subject1" name="subject1" value="${meeting.subject}"  readonly/>

						</div>
						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website" for="agenda1">Agenda<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="agenda1" name="agenda1" value="${meeting.agenda}"  readonly/>

						</div>
						
						
						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website"
								for="scheduleStartDate1">ScheduleStartDate<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="date" id="scheduleStartDate1" name="scheduleStartDate1" class="enabled-date-input"
								value="${meeting.scheduleStartDate}"  />

						</div>

						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website"
								for="scheduleEndDate1">ScheduleEndDate<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="date" id="scheduleEndDate1" name="scheduleEndDate1" class="enabled-date-input"
								value="${meeting.scheduleEndDate}"  />

						</div>

						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website"
								for="scheduleStartTime1">ScheduleStartTime<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="scheduleStartTime1" name="scheduleStartTime1"
								value="${meeting.scheduleStartTime}" readonly />

						</div>
						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website"
								for="scheduleEndTime1">ScheduleEndTime<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="scheduleEndTime1" name="scheduleEndTime1"
								value="${meeting.scheduleEndTime}" readonly />

						</div>
						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website" for="meetingStatus1">MeetingStatus<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="meetingStatus1" name="meetingStatus1"
								value="${meeting.meetingStatus}" readonly/>

						</div>
						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website" for="videolink1">VideoLink<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="videolink1" name="videolink1" value="${meeting.vedioLink}"
								 readonly/>

						</div>
					

					
						
						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website"
								for="isFollowUpMeet1">IsFollowUpMeet<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="isFollowUpMeet1" name="isFollowUpMeet1"
								value="${meeting.isFollowupMeet}"  readonly/>

						</div>
						
						
						
						<div class="form-group col-12 col-md-4 mb-5">
		<label class="form-label font-weight-website"
			for="masterMeetingId1">MasterMeetingId<sup
			class="text-danger">*</sup></label>
			 <input class="form-control"
			type="text" id="masterMeetingId1" name="masterMeetingId1" value="${meeting.masterMeetingId}" readonly/>

	 </div>
	 
	  	<div class="form-group col-12 col-md-4 mb-5">
		<label class="form-label font-weight-website"
			for="remarks1">Remarks<sup
			class="text-danger">*</sup></label>
			 <input class="form-control"
			type="text" id="remarks1" name="remarks1" value="${meeting.remarks}" />

	 </div>
	 


						
					</div>
					<div class="d-flex flex-row justify-content-end mr-5">
							<button class="btn custom-button font-weight-website zoom-ele"
								type="button" onclick="submitForm1()">Cancel Meeting</button>
						</div>
				</form>


            </div>
            
            
            
            
            
            
            
        </div>
    </div>
</div>

<%@ include file="./components/footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/pikaday/pikaday.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/pikaday/pikaday.min.js"></script>

<script>
<%
// Assuming you have a Java object or a session attribute named "meeting"
// You need to retrieve and set the value of the "meeting" variable here
// For example, if it's a session attribute:
MasterMeeting meeting = (MasterMeeting) session.getAttribute("meeting");
%>
const updateFollowUpMeetingOptionId = document.getElementById('updateFollowUpMeetingOptionId'); // Assuming you have an ID for the recurrence radio button
const updateMasterMeetingOptionId = document.getElementById('updateMasterMeetingOptionId'); // Assuming you have an ID for the recurrence radio button
const heading = document.getElementById('heading'); 
const heading1 = document.getElementById('heading1'); 

const recurrenceValueFromBackend = "<%= meeting.getRecurrence() %>"; // Replace with the actual value from your backend

if (recurrenceValueFromBackend === "none") {
	console.log("hi");
	updateFollowUpMeetingOptionId.style.display = 'none';
	updateMasterMeetingOptionId.style.display='block';
	
} else {
	updateFollowUpMeetingOptionId.style.display = 'block';
	updateMasterMeetingOptionId.style.display='none';// Show the radio button
	

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
    
 
    

   /*  const successMessage = document.getElementById('successMessage').value;
    if (successMessage.trim() !== "") {
        // Display an alert with the success message
        alert(successMessage);
    }
     */
    

     function submitForm() {
         var formData = $("#personalForm").serialize();
         console.log(formData);
         var data={
        		mid:document.getElementById("mId").value,
        		agenda: document.getElementById("agenda").value,
             	ownerId: $('#ownerId').val(),
             	subject: $('#subject').val(),
             	scheduleStartDate: $('#scheduleStartDate').val(),
             	scheduleEndDate: $('#scheduleEndDate').val(),
             	scheduleStartTime: $('#scheduleStartTime').val(),
             	scheduleEndTime: $('#scheduleEndTime').val(),
             	meetingStatus: $('#meetingStatus').val(),
             	videolink: $('#videolink').val(),

             	meetingId: $('#meetingId').val(),
             	masterMeetingId: $('#masterMeetingId').val(),
             	recurrence:$('#recurrence').val(),
             	recurrencepattern:$('#recurrencePattern').val(),
             	isFollowupMeet:$('#isFollowUpMeet').val(),
             	remarks:$('#remarks').val(),
             	
         }
         $.ajax({
             type: "POST",
             url: "/cancelMeeting",
             data:JSON.stringify(data),
             contentType:"application/json",
             processData:false,
             success: function (response) {
                 // Display the success message from the response
                 alert(response.successMessage);
                 window.location.href = "/meetinghistory";
                 console.log(data);
                 console.log(JSON.stringify(data));

                 // Optionally, you can reset the form or perform any other actions here
             },
             error: function (error) {
                 // Handle errors if needed
                 console.error(error);
                 console.log(data);
                 console.log(JSON.stringify(data));
             }
         });
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
     
     

     function submitForm1() {
     
         var data={
        		 mid: document.getElementById("mId1").value,
        		 agenda: document.getElementById("agenda1").value,
             	ownerId: $('#ownerId1').val(),
             	subject: $('#subject').val(),
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
             	isFollowupMeet:$('#isFollowUpMeet1').val(),
             	remarks:$('#remarks1').val(),
         }
         $.ajax({
             type: "POST",
             url: "/cancelRecurenceMeeting",
             data:JSON.stringify(data),
             contentType:"application/json",
             processData:false,
             success: function (response) {
                 // Display the success message from the response
                 alert(response.successMessage);
                 window.location.href = "/meetinghistory";
                  console.log(data);
                 // Optionally, you can reset the form or perform any other actions here
             },
             error: function (error) {
                 // Handle errors if needed
                 console.error(error);
             }
         });
     }
       
       
       
       
       
       
       
     
       const scheduleStartDateInput = document.getElementById("scheduleStartDate1");
       const scheduleEndDateInput = document.getElementById("scheduleEndDate1");

       // Replace these with the actual values from your database
       const dbScheduleStartDate = "<%= meeting.getScheduleStartDate() %>"; // Replace with the correct getter method
       const dbScheduleEndDate = "<%= meeting.getScheduleEndDate() %>"; // Replace with the correct getter method

       
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

