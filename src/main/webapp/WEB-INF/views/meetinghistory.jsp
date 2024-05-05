<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.itcrats.meetingmate.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Search Meeting</title>

<!-- Add Bootstrap 5 CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/meetinghistory.css">

<!-- Include jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Include jQuery UI -->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- IT Crats fav icon -->
<link rel="shortcut icon" type="image/x-icon"
	href="images/ITCrats_Logo.png" alt="IT CRATS FAV ICON" />


<style type="text/css">
.search {
	display: flex;
	justify-content: center; /* Center the button horizontally */
	align-items: center; /* Center the button vertically */
}
</style>
</head>
<body>
	
<%
	User user1 = (User) session.getAttribute("userObject1");
	String meetingId = (String) session.getAttribute("meetingId");
	String randomVariable = (String) session.getAttribute("randomVariable");
	String userType = user1.getUserType();
	String userEmpId = Integer.toString(user1.getUserId());
	long meetId=0;
	if(meetingId==null){ meetId=0;}
	else {meetId=Long.parseLong(meetingId);}
	%>


	<script>
	
	
	var meetingId= <%=meetId%>;
	var randomVariable="<%=randomVariable%>";
	console.log(meetingId);
	console.log(randomVariable);
	
	  var requestData = {
	    		meetingId: meetingId,
	    		randomVariable:randomVariable,
	    	
	    	/* 	mid:mid, */
	      
	    };
	
	if(randomVariable=="meeting"){
	$(document).ready(function() {
		
		  $.ajax({
		    url: '/getMeetingIdDeatails', 
		    type: 'post', 
		 
		    contentType: 'application/json',
	        data: JSON.stringify(requestData),
	        processData:false,
		    success: function(data) {
		           console.log(data);
		    	 displayDataInTable(data); 
		    },
		    error: function() {
		      console.error('Failed to retrieve meetingId.');
		    }
		  });
		});

	}
	
	
	
	</script>


	<%-- <% else{
	System.out.println("nothing"); %>
 <%}

%> --%>
	<div>
		<%@ include file="./components/navbar.jsp"%>
	</div>
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
						if (user1.getUserType().equalsIgnoreCase("user")) {
						%>

						<li><a href="current_inprogress_task"
							class="link-dark rounded">current/inprogress Task</a></li>
						<li><a href="taskhistory" class="link-dark rounded">Task
								History</a></li>
						<%
						} else {
						%>
						<li><a href="createtask" class="link-dark rounded">Create
								Task</a></li>
						<li><a href="current_inprogress_task"
							class="link-dark rounded">current/inprogress Task</a></li>
						<li><a href="taskhistory" class="link-dark rounded">Task
								History</a></li>
						<!-- <li><a href="taskupdate" class="link-dark rounded">Task Update</a></li> -->
						<%
						}
						%>

					</ul>

				</div>


			</div>


			<div class="col-md-10 bg-all-forms box-div">


				<div class="container mt-5">
					
					<h1>Search for Meeting</h1>

					<div class="row">


						<div class="col">
							<div class="position-relative">
								<div class="input-group">
									<input type="text" class="form-control"
										placeholder="Search by Meeting ID"
										aria-label="Search by Meeting ID" id="search-input">
								</div>
								<div class="autocomplete-suggestions position-absolute rounded"
									id="suggestions"></div>
							</div>
							<div id="meetingIdValidationMessage" style="color: red;"></div>
						</div>



						<!-- Search by Meeting Name -->
						<div class="col">
							<div class="position-relative">
								<div class="input-group">
									<input type="text" class="form-control"
										placeholder="Search by Meeting Name"
										aria-label="Search by Meeting Name" id="search-input-1">
								</div>
								<div class="autocomplete-suggestions position-absolute rounded"
									id="suggestions1"></div>

							</div>
							<div id="meetingNameValidationMessage" style="color: red;"></div>
						</div>

						<!-- Search by Meeting Date -->
						<div class="col">
							<div class="position-relative">
								<!-- 	<div class="input-group">
				
					<input type="text" class="form-control search-input-2"
						placeholder="Search by Meeting Date"
						aria-label="Search by Meeting Date" id="search-input-2">
					<button class="btn btn-outline-primary" type="button">Search</button>
					</div>
					<div>
					   <div class="autocomplete-suggestions position-absolute rounded"
									id="suggestions2"></div>
					</div> -->

								<div class="input-group">


									</label> <input class="form-control" type="date" id="startdate"
										name="startdate" required />

								</div>

							</div>
						</div>
					</div>


					<div class="row mt-5 ">
						<div class="search  w-100 h-100 d-flex justify-content-center ">
							<button class="btn searchButton" type="button"
								style="background-color: #2594E0;">Search</button>
						</div>
					</div>



					<div id="table-container" class="mt-2">
						<!-- The dynamically generated table will be inserted here -->
					</div>
					<%-- 
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Meeting ID</th>
                    <th>Meeting Name</th>
                    <th>Meeting Date</th>
                    <!-- Add more table headers for other attributes -->
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${meetingList}" var="meeting">
                    <tr>
                        <td>${meeting.meetingId}</td>
                        <td>${meeting.meetingName}</td>
                        <td>${meeting.meetingDate}</td>
                        <!-- Add more table cells for other attributes -->
                    </tr>
                </c:forEach>
            </tbody>
        </table>
      
		 --%>



				</div>

			</div>
			
			</div>
		</div>
			<div>
				<%@ include file="./components/footer.jsp"%>

			</div>
		</div>


		<!-- <!-- Add Bootstrap 5 JavaScript (optional) -->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>


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


		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>



		<script>
		
		<c:if test="${!empty status}">
		
	    alert("${status}");
	   </c:if>

 const searchInput = document.getElementById("search-input");
 const suggestionsDiv = document.getElementById("suggestions");
 const meetingIdValidationMessage = document.getElementById("meetingIdValidationMessage");
 const meetingNameValidationMessage = document.getElementById("meetingNameValidationMessage");
 const searchInput1 = document.getElementById("search-input-1");
 const suggestionsDiv1 = document.getElementById("suggestions1");

 searchInput.addEventListener("input", function () {
	    const value = searchInput.value;
	    if (value.trim() === "") {
	        meetingIdValidationMessage.textContent = ""; // Clear the validation message
	    } else if (!/^\d+$/.test(value)) {
	        meetingIdValidationMessage.textContent = "Please enter digits only.";
	    } else {
	        meetingIdValidationMessage.textContent = ""; // Clear the validation message
	    }
	});



 searchInput1.addEventListener("input", function () { 
	    const value = searchInput1.value;
	    if (value.trim() === "") {
	        meetingNameValidationMessage.textContent = ""; // Clear the validation message
	    } else if (!/^[A-Za-z\s]+$/.test(value)) {
	        meetingNameValidationMessage.textContent = "Please enter characters only.";
	    } else {
	        meetingNameValidationMessage.textContent = ""; // Clear the validation message
	    }
	});

 
 
 
 
 
 
 

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
     const prefix = searchInput.value.trim();

     if (prefix === "") {
         suggestionsDiv.innerHTML = "";
         return;
     }

     fetch('/autocomplete?prefix=' + prefix)
         .then(response => response.json())
         .then(data => {
             suggestionsDiv.innerHTML = "";
             data.forEach((suggestion, index) => {
                 const suggestionElement = document.createElement("div");
                 suggestionElement.textContent = suggestion;

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






let selectedSuggestionIndex1 = -1;

// Function to show suggestions
function showSuggestions1() {
    suggestionsDiv1.style.display = "block";
}

// Function to hide suggestions
function hideSuggestions1() {
    suggestionsDiv1.style.display = "none";
}

searchInput1.addEventListener("input", function () {
    const prefix = searchInput1.value.trim();
    if (prefix === "") {
        suggestionsDiv1.innerHTML = "";
        return;
    }
    
    fetch('/autocompletemeetingname?prefix=' + prefix)
    .then(response => response.json())
    .then(data => {
        suggestionsDiv1.innerHTML = "";
        data.forEach((suggestion1, index) => {
            const suggestionElement1 = document.createElement("div");
            suggestionElement1.textContent = suggestion1;

            suggestionElement1.addEventListener("click", function () {
                searchInput1.value = suggestion1;
                suggestionsDiv1.innerHTML = "";
            });
            
            suggestionElement1.addEventListener("mouseenter", function () {
                // Remove highlight from previous suggestion
                if (selectedSuggestionIndex1 >= 0) {
                    suggestionsDiv1.children[selectedSuggestionIndex1].classList.remove("selected-suggestion");
                }

                // Highlight the current suggestion
                selectedSuggestionIndex1 = index;
                suggestionElement1.classList.add("selected-suggestion");
            });

            suggestionElement1.addEventListener("mouseleave", function () {
                // Remove highlight when mouse leaves the suggestion
                suggestionElement1.classList.remove("selected-suggestion");
            });

            suggestionsDiv1.appendChild(suggestionElement1);
    
        });
        showSuggestions1();
    });
});


document.addEventListener("click", function (event) {
    if (event.target !== searchInput1) {
        hideSuggestions1();
    }
});

// Event listener to show suggestions when clicking on the search input
searchInput1.addEventListener("click", function () {
    showSuggestions1();
});




















//JavaScript code for making an AJAX request to the server.
document.querySelector(".searchButton").addEventListener("click", function () {
  const meetingId = document.getElementById("search-input").value;
  const meetingName = document.getElementById("search-input-1").value;
  const startDate = document.getElementById("startdate").value;

  // Send the data to the server for processing.
  $.ajax({
      type: "POST",
      url: "/searchMeetings",
      data: {
    	  meetingId: meetingId,
    	  meetingName: meetingName,
    	  startDate: startDate,
    	  
      },
      success: function (data) {
          // Handle the data received from the server and display it in a table.
          console.log(data);
          displayDataInTable(data);
      },
      error: function (error) {
          console.error("Error fetching data: " + error);
      }
  });
});

 
 

function displayDataInTable(data, userSessionId) {
	  const tableContainer = document.getElementById("table-container");
	  tableContainer.innerHTML = ""; // Clear any previous table content
 
	  if (data.length === 0) {
	    tableContainer.innerHTML = "No data found";
	    return;
	  }
 
	  const table = document.createElement("table");
	  table.classList.add("table", "table-sm", "table-responsive"); // Add Bootstrap table class if needed
 
	  const userType = '<%=userType%>';
	  const userEmpId = '<%=userEmpId%>';
	  let showActionColumn = false;
 
	  if (userType === 'admin') {
	    showActionColumn = true;
	  }
 
	  // Create table header with Action as the first column
	  const headerRow = table.insertRow(0);
	  const actionHeader = document.createElement("th");
	  actionHeader.textContent = "Action";
	  headerRow.appendChild(actionHeader);
 
	  for (const key in data[0]) {
	    if (data[0].hasOwnProperty(key) && key !== "mid" && key !== "ownerId") {
	      const th = document.createElement("th");
	      th.textContent = key;
	      headerRow.appendChild(th);
	    }
	  }
 
	  // Create table rows and cells
	  for (let i = 0; i < data.length; i++) {
	    const row = table.insertRow(i + 1);
 
	    // Create Action column for each row
	    const actionCell = row.insertCell(0);
 
	    if (showActionColumn || parseInt(data[i].ownerId, 10) === parseInt(userEmpId, 10)) {
	      const buttonContainer = document.createElement("div");
	      buttonContainer.classList.add("btn-container");
 
	      // Set the display property to inline-block to make buttons appear side by side
	      buttonContainer.style.display = "inline-block";
 
	      const updateButton = document.createElement("button");
	      updateButton.setAttribute('value', JSON.stringify(data[i]));
	      updateButton.textContent = "Update";
	      updateButton.setAttribute('onclick', 'updateMeetingDetails(this)');
 
	      const cancelButton = document.createElement("button");
	      cancelButton.setAttribute('value', JSON.stringify(data[i]));
	      cancelButton.textContent = "Cancel";
	      cancelButton.setAttribute('onclick', 'cancleMeetingDetails(this)');
 
	      buttonContainer.appendChild(updateButton);
	      buttonContainer.appendChild(cancelButton);
 
	      actionCell.appendChild(buttonContainer);
	    }
 
	    // Populate data in other cells
	    let cellIndex = 1; // Start from the next cell after the Action column
	    for (const key in data[i]) {
	      if (data[i].hasOwnProperty(key) && key !== "mid" && key !== "ownerId") {
	        const cell = row.insertCell(cellIndex);
	        cell.textContent = data[i][key];
	        cellIndex++;
	      }
	    }
	  }
 
	  tableContainer.appendChild(table);
	}
 

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 <%
/*  HttpSession httpSession = request.getSession();
 User user = (User)httpSession.getAttribute("userObject1");
 String userEmpId =Integer.toString(user.getUserId()); */
/*  String userType=user.getUserType(); */
/*  System.out.println(userEmpId); */
%>

 
var userEmpId = '<%=userEmpId%>';
var userType='<%=userType%>'
 
function updateMeetingDetails (element){
 	//console.log(data[i].empid);
 	let meetingObj = JSON.parse(element.value);
 	console.log(meetingObj);
 	 console.log(meetingObj.ownerId);
 	 console.log(meetingObj.mId);
 	 

 	  if (meetingObj.ownerId == userEmpId || userType=='admin') {
 		 window.location.href = "/updateMeetingForm?meetingId=" + meetingObj.meetingId + "&mId=" + meetingObj.mid;
 	  } else {
 	    alert("You are not authorized to update this meeting.");
 	  }
 }


function cancleMeetingDetails(element)
{
	let meetingObj = JSON.parse(element.value);
	  if (meetingObj.ownerId == userEmpId || userType=='admin') {
	        window.location.href = "/cancleMeetingForm?meetingId=" + meetingObj.meetingId + "&mId=" + meetingObj.mid;
	  } else {
	    alert("You are not authorized to update this meeting.");
	  }
	
	
	}












</script>
</body>
</html>