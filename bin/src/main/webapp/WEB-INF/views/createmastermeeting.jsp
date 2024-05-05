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
/* CSS for the suggestions box */
.autocomplete-suggestions {
	background-color: white;
	border: 1px solid #ccc;
	max-height: 200px;
	overflow-y: auto;
	position: absolute;
	width: 100%;
	z-index: 1000;
}

.autocomplete-suggestions div {
	padding: 10px;
	cursor: pointer;
}

/* Show the suggestions box when there are suggestions */
.autocomplete-suggestions.show {
	display: block;
}

#suggestions:hover {
	/* Styling for search bar when we hover on

              it to show the shadow of the search bar

            The attributes for box-shadow are:

            offset-x | offset-y | blur-radius | color */
	box-shadow: 0px 1px 3px rgb(192, 185, 185);
}

.selected-suggestion {
	background-color: rgba(0, 0, 0, 0.1);
	/* Light black background color */
}
</style>
</head>
<body>
	<%@ include file="./components/navbar.jsp"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
User user= (User)session.getAttribute("userObject1");
%>
	<div class="container-fluid">

		<div class="row">
			<!-- Sidebar -->
			<div class="col-md-2 bg-container-forms">
				<button class="btn btn-toggle align-items-center rounded collapsed"
					data-bs-toggle="collapse" data-bs-target="#home-collapse"
					aria-expanded="false">Meetings</button>
				<div class="collapse" id="home-collapse">

					<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
						<li><a href="createmeeting" class="link-dark rounded">Create
								Meeting</a></li>
						<li><a href="meetinghistory" class="link-dark rounded">Meeting
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
								String result = (String) request.getAttribute("status");
								if (result != null)
									out.println(result);
								%>
			<div class=" col-12 col-md-10 bg-all-forms">
				<%-- <h6 class="my-3 text-danger form-label font-weight-website">
					<%
					String result = (String) request.getAttribute("status");
					if (result != null)
						out.println(result);
					%>
				</h6> --%>

				<form class="py-5 px-3" id="personalForm"
					action="createmastermeeting" method="post">
					<div class="row">
						<div class="form-group col-12 mb-5">
							<label class="form-label font-weight-website"><b
								class="form-label text-danger mr-1">*</b>Indicates a required
								field</label>
						</div>

						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website" for="empId">Emp ID<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="empId" name="empId" value="${empId}"
								pattern="[1-9]{1}[0-9]{5}" required readonly />

						</div>
						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website" for="meetingId">Meeting ID<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="meetingId" name="meetingId" value="${meetingId}"
								pattern="[1-9]{1}[0-9]{11}" required readonly />

						</div>
						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website" for="recurrence">Recurrence<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="recurrence" name="recurrence"
								value="${recurrence}" pattern="[1-9]{1}[0-9]{5}" required
								readonly />

						</div>
						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website"
								for="recurrencePattern">Recurrence Pattern<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="recurrencePattern" name="recurrencePattern"
								value="${recurrencePattern}" readonly />

						</div>
						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website" for="subject">Subject<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="subject" name="subject" value="${subject}"
								readonly />

						</div>
						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website" for="agenda">Agenda<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="agenda" name="agenda" value="${agenda}" readonly />

						</div>

						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website"
								for="scheduleStartDate">Schedule Start Date<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="scheduleStartDate" name="scheduleStartDate"
								value="${scheduleStartDate}" readonly />

						</div>

						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website"
								for="scheduleEndDate">Schedule End Date<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="scheduleEndDate" name="scheduleEndDate"
								value="${scheduleEndDate}" readonly />

						</div>

						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website"
								for="scheduleStartTime">Schedule Start Time<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="scheduleStartTime" name="scheduleStartTime"
								value="${scheduleStartTime}" readonly />

						</div>
						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website"
								for="scheduleEndTime">Schedule End Time<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="scheduleEndTime" name="scheduleEndTime"
								value="${scheduleEndTime}" readonly />

						</div>
						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website" for="meetingStatus">Meeting Status<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="meetingStatus" name="meetingStatus"
								value="${meetingStatus}" readonly />

						</div>
						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website" for="videolink">Video Link<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="videolink" name="videolink" value="${videolink}"
								readonly />

						</div>
						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website" for="organizer">Organizer<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="organizer" name="organizer" value="${organizer}"
								readonly />

						</div>

						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website"
								for="requiredAttendees">Required Attendees<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="requiredAttendees" name="requiredAttendees"
								value="${requiredAttendees}" readonly />

						</div>
						<div class="form-group col-12 col-md-4 mb-5">
							<label class="form-label font-weight-website"
								for="optionalAttendees">Optional Attendees<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="optionalAttendees" name="optionalAttendees"
								value="${optionalAttendees}" readonly />

						</div>


											<div class="form-group col-12 mb-5">

							<div class="row">

								<div class="col-6 mb-5">
									<label class="form-label font-weight-website">Is Followup Meet<sup
										class="text-danger">*</sup>
									</label>
								</div>
								<div class="form-check col-3 mb-5">
									<input class="form-check-input" type="radio"
										name="isFollowupMeet" id="isFollowupMeetYes" value="TRUE" required>
									<label class="form-label" for="isFollowupMeetYes"> Yes
									</label>
								</div>
								<div class="form-check col-3 mb-5">
									<input class="form-check-input" type="radio"
										name="isFollowupMeet" id="isFollowupMeetNo" value="FALSE" >
									<label class="form-label" for="isFollowupMeetNo" > No </label>
								</div>


							</div>
						</div>

 




               <div class="form-group col-12 col-md-4  mb-5 " style="display:none;" id="searchEleDiv">
					<label class="form-label font-weight-website"
								for="search-input">Master Meeting Id<sup
								class="text-danger">*</sup></label>
						

						<div class="position-relative">

							<div class="input-group">

								<input type="text" class="form-control" 
									placeholder="Search by Meeting ID"  pattern="[1-9]{1}[0-9]{11}" required 
									aria-label="Search by Meeting ID" id="search-input" name="masterMeetingId"  required>

							</div>

							<div class="autocomplete-suggestions position-absolute rounded"
								id="suggestions"></div>

						</div>

					</div>

               

						



					</div>

					



					<div class="d-flex flex-row justify-content-end mr-5">
						<button class="btn custom-button font-weight-website zoom-ele"
							type="submit">Create Meeting</button>
					</div>
				</form>

			</div>
		</div>
	</div>

	<%@ include file="./components/footer.jsp"%>


	<script>
	
	  const searchEleDiv = document.getElementById('searchEleDiv');
      const isFollowupMeetYes = document.getElementById('isFollowupMeetYes');
      const isFollowupMeetNo = document.getElementById('isFollowupMeetNo');
      
      const searchInput = document.getElementById("search-input");

      // Add an event listener to the radio buttons
      isFollowupMeetYes.addEventListener('change', function () {
          if (this.checked) {
        	 
        	  searchEleDiv.style.display = 'block';
        	  searchInput.setAttribute('required', '');
        	 
          }
      });

      isFollowupMeetNo.addEventListener('change', function () {
          if (this.checked) {
        	  searchEleDiv.style.display = 'none';
        	  searchInput.value="";
        	  searchInput.removeAttribute("required");
        	  
          }
      });
	
	
	
	
	  
	 
	

	

	const suggestionsDiv = document.getElementById("suggestions");

	 

	let selectedSuggestionIndex = -1;

	 

	// Function to show suggestions

	function showSuggestions() {

	     suggestionsDiv.style.display = "block";

	}

	 

	// Function to hide suggestions

	function hideSuggestions() {

	     suggestionsDiv.style.display = "none";

	}

	 

	searchInput.addEventListener("input", function () {
		console.log("hi");

	     const prefix = searchInput.value.trim();

	 

	     if (prefix === "") {

	         suggestionsDiv.innerHTML = "";

	         return;

	     } 

	 

	     fetch('/autocompletemaster?prefix=' + prefix)

	         .then(response => response.json())

	         .then(data => {
	        	 console.log("hello");

	             suggestionsDiv.innerHTML = "";

	             data.forEach((suggestion, index) => {
	            	 console.log(data);

	                 const suggestionElement = document.createElement("div");

	                 suggestionElement.textContent = suggestion;

	                 console.log(data);

	                 suggestionElement.addEventListener("click", function () {

	                     searchInput.value = suggestion;

	                     suggestionsDiv.innerHTML = "";

	                 });

	 

	                 suggestionElement.addEventListener("mouseenter", function () {

	                     // Remove highlight from previous suggestion

	                     if (selectedSuggestionIndex >= 0) {

	                         suggestionsDiv.children[selectedSuggestionIndex].classList.remove("selected-suggestion");

	                     }

	 

	                     // Highlight the current suggestion

	                     selectedSuggestionIndex = index;

	                     suggestionElement.classList.add("selected-suggestion");

	                 });

	 

	                 suggestionElement.addEventListener("mouseleave", function () {

	                     // Remove highlight when mouse leaves the suggestion

	                     suggestionElement.classList.remove("selected-suggestion");

	                 });

	 

	                 suggestionsDiv.appendChild(suggestionElement);

	             });

	 

	             // Show suggestions after fetching

	             showSuggestions();

	         });

	});

	 

	// Event listener to hide suggestions when clicking outside of the search input

	document.addEventListener("click", function (event) {

	     if (event.target !== searchInput) {

	         hideSuggestions();

	     }

	});

	 

	// Event listener to show suggestions when clicking on the search input

	searchInput.addEventListener("click", function () {

	     showSuggestions();

	});

	 

	</script>







	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous">
	</script>


</body>
</html>





