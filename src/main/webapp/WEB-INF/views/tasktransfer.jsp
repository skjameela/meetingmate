<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.itcrats.meetingmate.model.User" 
    import="com.itcrats.meetingmate.model.AssignedTask"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Task Transfer</title>
<!-- IT Crats fav icon -->
<link rel="shortcut icon" type="image/x-icon"
	href="images/ITCrats_Logo.png" alt="IT CRATS FAV ICON" />


<style>

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

.suggestions:hover {
        box-shadow: 0px 1px 3px rgb(192, 185, 185);
  }

.suggestions1:hover {
        box-shadow: 0px 1px 3px rgb(192, 185, 185);
  }

.suggestions2:hover {
        box-shadow: 0px 1px 3px rgb(192, 185, 185);
  }
  
.selected-suggestion {
	background-color: rgba(0, 0, 0, 0.1); /* Light black background color */
}

</style>

<!-- Add Bootstrap 5 CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<%
User user= (User)session.getAttribute("userObject1");
%>
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
	<!-- Task Transfer design -->		
			
			<%
			HttpSession httpSession=request.getSession();
			
			AssignedTask task=(AssignedTask)httpSession.getAttribute("task");
			System.out.println(task.getTaskId());
			%>
	
	<div class="col-12 col-md-10  bg-all-forms">
     <form class="py-5 px-3" id="personalForm" action="transferTask" method="post"
      enctype="multipart/form-data">
      <div class="row">
      
      <input type="hidden" id="successMessage" value="${successMessage}"/> 
        <div class="form-group col-12 mb-5">
          <label class="form-label font-weight-website"><b class="form-label text-danger mr-1">*</b>
          Indicates a required field</label>
        </div>
        <br>
       
        <h3>Task Transfer</h3>

		 
		 <div class="form-group col-12 col-md-4 mb-5">
			<div class="position-relative">
				<label class="form-label font-weight-website" for="emploeeid">Employee Id<sup class="text-danger">*</sup></label>
					<input type="text" class="form-control"
						aria-label="Search by Employee ID" id="search-input" name="transferTo" required/>
				<div class="autocomplete-suggestions position-absolute rounded"
									id="suggestions"></div>
				</div>
			</div>
			
			
			<div class="form-group col-12 col-md-4 mb-5">
			<div class="position-relative">
				<!-- //<div class="input-group"> -->
				<label class="form-label font-weight-website" for="assignTransfer">Assign Transfer Employee Name<sup class="text-danger">*</sup></label>
					<input type="text" class="form-control"
						aria-label="Search by Employee name" id="search-input1" name="assignemployeename" required/>
				<!-- </div> -->
				<div class="autocomplete-suggestions position-absolute rounded"
									id="suggestions1"></div>
				</div>
			</div>
			
		 <div class="form-group col-12 col-md-4 mb-5">
          <label class="form-label font-weight-website" for="taskId">Task Id</label>
          <input class="form-control" type="text" id="taskId" name="taskId" value="<%=task.getTaskId() %>"
              readonly/>
        </div> 
			
		<div class="form-group col-md-4 mb-5">
          <label class="form-label font-weight-website" for="taskname">Task Name<sup class="text-danger">*</sup></label>
          <input class="form-control" type="text" id="taskname" name="taskname" value="<%=task.getTaskName()%>"required
             />
        </div>
        
        <div class="form-group col-12 col-md-4 mb-5">
           <label class="form-label font-weight-website" for="Description">Description</label>
           <input class="form-control" type="text"  placeholder="Optional" id="Description" name="Description" value=<%= task.getDescription() %> readonly/>
        </div>
        
        <div class="form-group col-12 col-md-4 mb-5">
           <label class="form-label font-weight-website" for="startdate">Planned Start Date<sup
                   class="text-danger">*</sup></label>
           <input class="form-control" type="datetime-local" id="startdate" name="startdate" value=<%=task.getEstStartDate() %> required />
        </div>
        
         <div class="form-group col-12 col-md-4 mb-5">
           <label class="form-label font-weight-website" for="estEndDate">Planned End Date<sup
                   class="text-danger">*</sup></label>
           <input class="form-control" type="datetime-local" id="estEndDate" name="estEndDate" value=<%=task.getEstEndDate() %> required>
        </div>
        
         <div class="form-group col-12 col-md-4 mb-5">
           <label class="form-label font-weight-website" for="Remark">Remarks</label>
           <input class="form-control" type="text"  placeholder="Optional" id="Remark" name="Remark" value=""/>
        </div>
            
        <div class="text-center">
        	<input class="btn custom-button font-weight-website zoom-ele"
								type="submit" onclick="submitForm()" value="Transfer Task"/>
       </div>
      </form>
     </div>
    </div>
    </div>
		<!-- <!-- Add Bootstrap 5 JavaScript (optional) -->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
		
		<%@ include file="./components/footer.jsp"%>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
			crossorigin="anonymous"></script>



		<!-- jQuery -->
		<script
      src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
      crossorigin="anonymous"
    ></script>

		<!-- Bootstrap JavaScript -->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
			integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
			crossorigin="anonymous"></script>


	<script>
		$(function() {
			$("input[name='numonly']").on('input', function(e) {
				$(this).val($(this).val().replace(/[^0-9]/g, ''));
			});
		});
		
		
		
		
	<!-- jQuery for getting suggestions to empid from usertable --------------------------->
		
		const searchInput = document.getElementById("search-input");
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

		    const prefix = searchInput.value.trim();
		    if (prefix === "") {
		        suggestionsDiv.innerHTML = "";
		        return;
		    }

		    fetch('/autocompleteemployeeid?prefix=' + prefix)
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
		
	<!------------------- jQuery for getting suggestions to empid from usertable --------------------------->
		
			const searchInput1 = document.getElementById("search-input1");
			const suggestionsDiv1 = document.getElementById("suggestions1");
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

			    const prefix1 = searchInput1.value.trim();
			    if (prefix1 === "") {
			        suggestionsDiv1.innerHTML = "";
			        return;
			    }
			    fetch('/autocompleteemployeename?prefix1=' + prefix1)
			        .then(response => response.json())
			        .then(data => {
			            suggestionsDiv1.innerHTML = "";
			            data.forEach((suggestion1, index) => {
			                const suggestionElement1 = document.createElement("div");
			                console.log(data);
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
			// Event listener to hide suggestions when clicking outside of the search input
			document.addEventListener("click", function (event) {
			    if (event.target !== searchInput1) {
			        hideSuggestions1();
			    }
			});
			// Event listener to show suggestions when clicking on the search input
			searchInput1.addEventListener("click", function () {
			    showSuggestions1();
			});
			const successMessage = document.getElementById('successMessage').value;
			if (successMessage.trim() !== "") {
			    // Display an alert with the success message
			    alert(successMessage);
			}
			function submitForm() {
		        /// var formData = $("#personalForm").serialize();
		        
		         var data={
		        		 taskId:document.getElementById("taskId").value,
		        		 employeeId: document.getElementById("search-input").value,
		        		 assignName: $('#search-input1').val(),
		        		 taskName: $('#taskName').val(),
		        		 //findingNo: $('#findingNo').val(), 
		        		 description: $('#Description').val(),
		        		 estStartDate: $('#startdate').val(),
		        		 estEndDate: $('#estEndDate').val(),
		        		 //taskStatus: $('#taskStatus').val(),
		        		 remarks: $('#Remark').val(),
		             	
		         }
		         console.log(data);
		         $.ajax({
		             type: "POST",
		             url: "/transferTask",
		             data:JSON.stringify(data),
		             contentType:"application/json",
		             processData:false,
		             success: function (response) {
		                 // Display the success message from the response
		                 alert(response.successMessage);
		                 console.log(data);
		                 console.log(JSON.stringify(data));
		                 window.location.href = "/taskhistory";
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
	</script>
	

</body>
</html>