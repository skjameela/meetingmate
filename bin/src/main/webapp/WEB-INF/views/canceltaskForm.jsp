<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.itcrats.meetingmate.model.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Cancel Task</title>
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
<%
User user= (User)session.getAttribute("userObject1");
%>
<%@ include file="./components/navbar.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <div class=" col-12 col-md-10 bg-all-forms">
       		<form class="py-5 px-3" id="personalForm"
					action="createtask" method="post">
        
            <!-- cancel Task -->
            <div class="row" id="canceltaskForm" >
            
            
            
       
        
           <input type="hidden" id="successMessage" value="${successMessage}"> 
                          <%
 
 AssignedTask task = (AssignedTask)request.getAttribute("task");
 String taskEmpId =Integer.toString(task.getTaskId());
 System.out.println(taskEmpId);
%> 
            	
					<div class="row" id="parentEleDiv">
						<div class="form-group col-12 mb-5">
							<label class="form-label font-weight-website"><b
								class="form-label text-danger mr-1">*</b>Indicates a required
								field</label>
								
								 <h3 class="text-center mt-4">Cancel Meeting</h3>
								 
						</div>
						<div class="form-group col-12 col-md-4 mb-5">
						<div class="position-relative">
							<label class="form-label font-weight-website" for="taskId">Task Id<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="taskId" name="taskId" value="${task.taskId}" readonly />
							</div>
						</div>
						
						<div class="form-group col-12 col-md-4 mb-5">
						<div class="position-relative">
							<label class="form-label font-weight-website" for="employeeId">Employee Id<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="employeeId" name="employeeId" value="${task.employeeId}" readonly />
						</div>
						</div>
						
						
						<div class="form-group col-12 col-md-4 mb-5">
						 <div class="position-relative">
							<label class="form-label font-weight-website" for="employeeName">Employee Name<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="employeeName" name="employeeName" value="${task.assignName}"
								readonly />
						</div>
						</div>
						
						<div class="form-group col-12 col-md-4 mb-5">
						 <div class="position-relative">
							<label class="form-label font-weight-website" for="taskName">Task Name<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="taskName" name="taskName" value="${task.taskName}" readonly />
							</div>
						</div>
						
						
						<div class="form-group col-12 col-md-4 mb-5">
						<div class="position-relative">
							<label class="form-label font-weight-website" for="findingNo">Finding No<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="findingNo" name="findingNo" value="${task.findingNo}" readonly />
						</div>
						</div>
						
						
						<div class="form-group col-12 col-md-4 mb-5">
						<div class="position-relative">
							<label class="form-label font-weight-website" for="meetingId">Meeting Id<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="meetingId" name="meetingId" value="${task.masterMeetingId}"  readonly/>
							</div>
						</div>
						
						
						<div class="form-group col-12 col-md-4 mb-5">
						<div class="position-relative">
							<label class="form-label font-weight-website" for="description">Description<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="description" name="description" value="${task.description}"  readonly/>
							</div>
						</div>
						
						
						<div class="form-group col-12 col-md-4 mb-5">
						<div class="position-relative">
							<label class="form-label font-weight-website"
								for="estStartDate">Estimate StartDate<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="estStartDate" name="estStartDate"
								value="${task.estStartDate}"  readonly/>
							</div>
						</div>

						<div class="form-group col-12 col-md-4 mb-5">
						<div class="position-relative">
							<label class="form-label font-weight-website"
								for="estEndDate">Estimate EndDate<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="estEndDate" name="estEndDate"
								value="${task.estEndDate}" readonly />
						</div>
						</div>

						
						<div class="form-group col-12 col-md-4 mb-5">
						<div class="position-relative">
							<label class="form-label font-weight-website" for="taskStatus">Task Status<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="taskStatus" name="taskStatus"
								value="${task.taskStatus}" readonly/>
						</div>
						</div>
						
						
						<div class="form-group col-12 col-md-4 mb-5">
						<div class="position-relative">
							<label class="form-label font-weight-website" for="videolink">Remarks<sup
								class="text-danger">*</sup></label> <input class="form-control"
								type="text" id="remarks" name="remarks" value="${meeting.remarks}"
								 readonly/>

						</div>
					
</div>
						
					</div>
					<div class="d-flex flex-row justify-content-end mr-5">
							<button class="btn custom-button font-weight-website zoom-ele"
								type="button" onclick="submitForm()">Cancle Meeting</button>
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
<%-- <%
// Assuming you have a Java object or a session attribute named "meeting"
// You need to retrieve and set the value of the "meeting" variable here
// For example, if it's a session attribute:
AssignedTask meeting = (AssignedTask) session.getAttribute("task");
%>
 --%>
 

   

const successMessage = document.getElementById('successMessage').value;
if (successMessage.trim() !== "") {
    // Display an alert with the success message
    alert(successMessage);
}


 function submitForm() {
    /// var formData = $("#personalForm").serialize();
    
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
         url: "/cancelTask",
         data:JSON.stringify(data),
         contentType:"application/json",
         processData:false,
         success: function (response) {
             // Display the success message from the response
             alert(response.successMessage);
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
 
 


 
  
 

</script>
</body>
</html>

