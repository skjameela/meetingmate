<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.itcrats.meetingmate.model.*" %>
<!DOCTYPE html>
<html>
<head>

<title>Task Update</title>

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
		  
		
			
			
		
	<!-- Task update design -->		
			
			
	
	<div class="col-12 col-md-10  bg-all-forms">
     <form class="py-5 px-3" id="personalForm" action="updateTask" method="post">
      
       <h3>Task Update</h3>
      
      <div class="row">
        <div class="form-group col-12 mb-5">
          <!-- <label class="form-label font-weight-website"><b class="form-label text-danger mr-1">*</b>
          Indicates a required field</label> -->
        </div>
        
       
       <!--  <h3>Task Update</h3> -->
       
       
       <input type="hidden" id="successMessagee" value="${successMessagee}"> 
        
<%
 AssignedTask task = (AssignedTask)request.getAttribute("task");
 String taskEmpId =Integer.toString(task.getTaskId());
 System.out.println(taskEmpId);
%> 
		<%
		  
	       String msg=(String)request.getAttribute("status");
	        if(msg!=null)out.println(msg);
	        
		%>
		 <div class="form-group col-12 col-md-4 mb-5">
          <label class="form-label font-weight-website" for="taskId">Task Id</label>
          <input class="form-control" type="text" id="taskId" name="taskId"
         readonly value='${task.taskId}'/>
        </div>
		 
		 
		 <div class="form-group col-12 col-md-4 mb-5">
			<div class="position-relative">
				<label class="form-label font-weight-website" for="employeeId">Employee Id<sup class="text-danger">*</sup></label>
					<input type="text" class="form-control"
						aria-label="Search by Employee ID" id="employeeId" name="employeeId" value='${task.employeeId}'required readonly/>
				<div class="autocomplete-suggestions position-absolute rounded"
									id="suggestions"></div>
				</div>
			</div>
			
			
			<div class="form-group col-12 col-md-4 mb-5">
			 <div class="position-relative">
				<label class="form-label font-weight-website" for="assignName">Assign Name<sup class="text-danger">*</sup></label>
					<input type="text" class="form-control"
						aria-label="Search by Employee name" id="assignName"  name ="assignName"value='${task.assignName}' required readonly/>
				<div class="autocomplete-suggestions position-absolute rounded"
									id="suggestions1"></div>
				</div>
			</div>
		
		
			
		<div class="form-group col-md-4 mb-5">
          <label class="form-label font-weight-website" for="taskName">Task Name<sup class="text-danger">*</sup></label>
          <input class="form-control" type="text" id="taskName" name="taskName" value='${task.taskName}' required readonly
             />
        </div>	
		
        <div class="form-group col-12 col-md-4 mb-5">
          <label class="form-label font-weight-website" for="findingNo">Finding No</label>
          <input class="form-control" type="text" id="findingNo" name="findingNo"
         readonly value='${task.findingNo}'/>
        </div>
        
        <div class="form-group col-12 col-md-4 mb-5">
          <label class="form-label font-weight-website" for="masterMeetingId">Meeting Id</label>
          <input class="form-control" type="text" id="masterMeetingId" name="masterMeetingId"
            readonly value='${task.masterMeetingId}'/>
        </div>
        
        <div class="form-group col-12 col-md-4 mb-5">
           <label class="form-label font-weight-website" for="description">Description</label>
           <input class="form-control" type="text"  placeholder="Optional" id="description" name="description" value='${task.description}' readonly/>
        </div>
        
 
        
       <!--  <div class="form-group col-12 col-md-4 mb-5">
           <label class="form-label font-weight-website" for="taskstatus">Task Status<sup
                   class="text-danger">*</sup></label>
           <input class="form-control" type="text"  id="taskstatus" name="taskstatus" />
        </div> -->
        
        
        <div class="form-group col-12 col-md-4 mb-5">
           <label class="form-label font-weight-website" for="estStartDate">Estimate Start Date<sup
                   class="text-danger">*</sup></label>
           <input class="form-control" type="datetime-local" id="estStartDate" name="estStartDate"  value='${task.estStartDate}' readonly required />
        </div>
        
         <div class="form-group col-12 col-md-4 mb-5">
           <label class="form-label font-weight-website" for="estEndDate">Estimate End Date<sup
                   class="text-danger">*</sup></label>
           <input class="form-control" type="datetime-local" id="estEndDate" name="estEndDate" value='${task.estEndDate}' readonly required>
        </div>


	
    <div class="form-group col-12 col-md-4 mb-5">
        <label class="form-label font-weight-website" for="taskStatus">Task Status<sup
                class="text-danger">*</sup></label>
        <div class="dropdown">
            <input type="text" class="form-control dropdown-toggle" id="taskStatus" name="taskStatus"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
            <ul class="dropdown-menu" aria-labelledby="taskstatus">
                <li><button class="dropdown-item" type="button" onclick="setOption('complete')">complete</button></li>
                <li><button class="dropdown-item" type="button" onclick="setOption('inprogress')">inprogress</button></li>
                <li><button class="dropdown-item" type="button" onclick="setOption('On Hold')">On Hold</button></li>
            </ul>
        </div>
    </div>
		
        
        
         <div class="form-group col-12 col-md-4 mb-5">
           <label class="form-label font-weight-website" for="remarks">Remarks</label>
           <input class="form-control" type="text"  placeholder="Optional" id="remarks" name="remarks" value="" />
        </div>
        
        <div class="text-center">
        	<button type="submit"onclick="submitForm()" class="btn btn-primary">Task Update</button>
        </div>
        
        
        
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
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
			integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
			crossorigin="anonymous"></script>

		<!-- Bootstrap JavaScript -->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
			integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
			crossorigin="anonymous"></script>



	<!-- Task Status dropdown option-->
	<script>
    function setOption(option) {
        document.getElementById('taskStatus').value = option;
    }
    </script>


	<script>
		$(function() {
			$("input[name='numonly']").on('input', function(e) {
				$(this).val($(this).val().replace(/[^0-9]/g, ''));
			});
		});
		
	</script>
	
	
	<script>    

    const successMessage = document.getElementById('successMessage').value;
    if (successMessage.trim() !== "") {
        // Display an alert with the success message
        alert(successMessage);
    }
    

     function submitForm() {
      
         var data={
        		 taskId:document.getElementById("taskId").value,
        		 employeeId: document.getElementById("employeeId").value,
        		 assignName: $('#assignName').val(),
        		 taskName: $('#taskName').val(),
        		 findingNo: $('#findingNo').val(),
        		 masterMeetingId: $('#masterMeetingId').val(),
        		 description: $('#description').val(),
        		 estStartDate: $('#estStartDate').val(),
        		 estEndDate: $('#estEndDate').val(),
        		 taskStatus: $('#taskStatus').val(),

        		 remarks: $('#remarks').val(),
             	 
         }
         $.ajax({
             type: "POST",
             url: "/updateTask",
             data: JSON.stringify(data),
           contentType:"application/json",
             processData:false,
             success: function (response) {
                 // Display the success message from the response
                 alert(response.successMessagee);
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
     
     
  
     const successMessagee = document.getElementById('successMessagee').value;
     if (successMessagee.trim() !== "") {
         // Display an alert with the success message
         alert(successMessagee);
     }


     
      
     

</script>
	

</body>
</html>