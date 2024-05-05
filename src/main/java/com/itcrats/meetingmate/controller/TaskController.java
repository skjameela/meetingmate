package com.itcrats.meetingmate.controller;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itcrats.meetingmate.Dao.AssignedTaskDao;
import com.itcrats.meetingmate.Dao.UserDao;
import com.itcrats.meetingmate.model.AssignedTask;
import com.itcrats.meetingmate.model.User;

@Controller
public class TaskController {
	
final static Logger logger= Logger.getLogger(TaskController.class);
	
	@GetMapping("/taskhistory")
	public void gettaskhistroy() {
		logger.info("User searched task details");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("taskhistory");
	}
	@Autowired
	private AssignedTaskDao assignedTaskDao;
	
	@Autowired
	private UserDao userDao;
	
	@ResponseBody
	@GetMapping("/autocompleteemployeeid")
	public List<String> searchTasks(@RequestParam("prefix") String prefix) {
		logger.info("User history task details by taskId");
		return userDao.autocompleteEmployeeIds(prefix);
	}

	@ResponseBody
	@GetMapping("/autocompleteemployeename")
	public List<String> searchTasks1(@RequestParam("prefix1") String prefix1) {
		logger.info("User searched task details by taskName");
		return userDao.autocompleteEmployeeName(prefix1);
	}

	@GetMapping("/current_inprogress_task")
	public ModelAndView getcurrent_inprogress_task(HttpServletRequest request)
 	{
	    ModelAndView mv = new ModelAndView();
	    logger.info("User history task details of upcoming and inprogress task ");
       HttpSession httpSession = request.getSession();
       User user=(User)httpSession.getAttribute("userObject1");
       
       List<AssignedTask>  progressTasks1 = assignedTaskDao.getTasksByUserIdAndInprogress(user.getUserId());
       List<AssignedTask>  upcomingTasks1 = assignedTaskDao.getTasksByUserIdAndUpcoming(user.getUserId());
       mv.addObject("progressTasks1", progressTasks1);
       mv.addObject("upcomingTasks1", upcomingTasks1);
       return mv;
 	}
	
	@ResponseBody
	@GetMapping("/autocompletetaskid")
	public List<String> searchTasks(
	    HttpServletRequest request,
	    @RequestParam("prefix") String prefix,
	    @RequestParam(value = "startDate", required = false, defaultValue = "") String startDate,
	    @RequestParam(value = "agenda", required = false, defaultValue = "") String agenda
	) {
		logger.info("User searched task details by taskId");
	    HttpSession httpSession = request.getSession();
	    User user = (User) httpSession.getAttribute("userObject1");
	    return assignedTaskDao.autocompleteTaskIds(prefix, startDate, agenda, user);
	}

	@ResponseBody
	@GetMapping("/autocompletetaskname")
	public List<String> searchAgendas(
	    HttpServletRequest request,
	    @RequestParam("prefix") String prefix,
	    @RequestParam(value = "startDate", required = false, defaultValue = "") String startDate,
	    @RequestParam(value = "taskId", required = false, defaultValue = "") String taskId
	) {
		logger.info("User searched task details by taskName");
	    HttpSession httpSession = request.getSession();
	    User user = (User) httpSession.getAttribute("userObject1");
	    return assignedTaskDao.autocompleteAgendas(prefix, startDate, taskId, user);
	}
	
    @Autowired
    private AssignedTaskDao assignTaskDAO;

//    @PostMapping("/searchTasks")
//    @ResponseBody
//    public List<AssignedTask> searchTasks(
//            @RequestParam(name = "taskId", required = false) String taskId,
//            @RequestParam(name = "taskName", required = false) String taskName,
//            @RequestParam(name = "startDate", required = false) String startDate) {
//
//        // Calling DAO methods based on the provided parameters and return the result.
//        List<AssignedTask> tasks = assignTaskDAO.searchTasks(taskId, taskName, startDate);
//        return tasks;
//    }
    @PostMapping("/searchTasks")
	@ResponseBody
	public List<AssignedTask> searchTasks1(HttpServletRequest request,
	        @RequestParam(name = "taskId", required = false) String taskId,
	        @RequestParam(name = "taskName", required = false) String taskName,
	        @RequestParam(name = "startDate", required = false) String startDate) {
 
	    // Get the user session information (usessionUserId) from your session management mechanism.
	    // This will depend on how you manage user sessions in your application.
 
	    // Ensure usessionUserId is set appropriately.
    	  logger.info("User clicked the searched task button");
		  HttpSession httpSession = request.getSession();
		    User user = (User) httpSession.getAttribute("userObject1");
		
	     // Replace this with your session retrieval mechanism.
 
	    // Calling DAO methods based on the provided parameters and usessionUserId
	    List<AssignedTask> tasks = assignedTaskDao.searchTasks(taskId, taskName, startDate, user);
	    return tasks;
	}
    
    
    @PostMapping("/updateTask")
    @ResponseBody
    public Map<String, String> updateMeeting( @RequestBody AssignedTask assignedTask) {
        Map<String, String> response = new HashMap<>();
        System.out.println(assignedTask.getTaskId());
        System.out.println("rrrrrrrrrrrrrrrrrrrrrrrrrr");
       // logger.info("User clicked the cancel task button");

        try {
        	AssignedTask assign=assignedTaskDao.getTasksByTaskId(assignedTask.getTaskId());
        	logger.info("if user not changed anything getting Not changed anything");
        	if(assignedTask.equals(assign)) {
        		response.put("successMessage", "Not changed anything.");
        	}
        	if(assignedTask.getTaskStatus().equals(""))response.put("successMessage", "please fill the task status.");
        	else {
            boolean updated = assignedTaskDao.updateTask(assignedTask);
            logger.info("user updated task details");

            if (updated) {
                response.put("successMessage", "Task updated successfully, TaskId:" + assignedTask.getTaskId());
            } else {
                response.put("successMessage", "Task not found or could not be updated.");
            }}
        } catch (Exception error) {
            response.put("successMessage", "Failed to update Task: " + error.getMessage());
        }

        return response;
    }
    
//    @GetMapping("/transferTaskForm")
//    public ModelAndView showTaskAtTransferPage(HttpServletRequest req,@RequestParam("taskId") String taskId)
//    {
//    	AssignedTask assignedTask=assignedTaskDao.getAssignedTaskById(taskId);
//    	ModelAndView mv=new ModelAndView();
//    	mv.addObject("taskOb",assignedTask);
//    	set
//    }
    @PostMapping("/transferTask")
    @ResponseBody
    public Map<String, String> taskTransfer(  		
  		@RequestBody AssignedTask transferTask
    		) {
        System.out.println("hello 1234");
        Map<String, String> response = new HashMap<>();
        System.out.println(transferTask.getTaskId());
        System.out.println("rrrrrrrrrrrrrrrrrrrrrrrrrr");
       // logger.info("User clicked the cancel task button");
 
        try {
        	AssignedTask assign=assignedTaskDao.getTasksByTaskId(transferTask.getTaskId());
        	if(transferTask.equals(assign)) {
        		response.put("successMessage", "Not changed anything.");
        	}
        	if(transferTask.getAssignName().equals("") || transferTask.getEmployeeId()==0)response.put("successMessage", "please fill the task status.");
        	else {
            boolean updated = assignedTaskDao.transferTask(transferTask);
 
            if (updated) {
                response.put("successMessage", "Task transfered successfully, TaskId:" + transferTask.getTaskId());
            } else {
                response.put("successMessage", "Task not found or could not be updated.");
            }}
        } catch (Exception error) {
            response.put("successMessage", "Failed to update Task: " + error.getMessage());
        }
 
        return response;
//    	ModelAndView mv=new ModelAndView();
//    	AssignedTask assignedTask=assignedTaskDao.getTaskById(taskId);
//    	assignedTask.setTransferTo(transferTo);
 
    	//create a assigningtask object and set the values
//    	AssignedTask assigingTask = new AssignedTask();
//    	assigingTask.setTaskId(taskId);
//    	assigingTask.setEmployeeId(employeeId);
//    	assigingTask.setAssignName(assignName);
//    	assigingTask.setTaskName(taskName);
//    	assigingTask.setFindingNo(findingNo);
//    	assigingTask.setMasterMeetingId(masterMeetingId);
//  	assigingTask.setDescription(description);
//  	assigingTask.setEstStartDate(stDate);
//  	assigingTask.setEstEndDate(enDate);
//  	assigingTask.setTaskStatus(taskStatus);
//  	assigingTask.setRemarks(remarks);
 
  	//update the meeting details in the database
//    	assignedTaskDao.updateTask(assignedTask);
//    	AssignedTask assignedTask_1=new AssignedTask();
//    	assignedTask_1.setAssignName(empName);
//    	assignedTask_1.setDescription(assignedTask.getDescription());
//    	assignedTask_1.setEmployeeId(transferTo);
//    	assignedTask_1.setEstEndDate(assignedTask.getEstEndDate());
//    	assignedTask_1.setEstStartDate(assignedTask.getEstStartDate());
//    	assignedTask_1.setFindingNo(assignedTask.getFindingNo());
//    	assignedTask_1.setMasterMeetingId(assignedTask.getMasterMeetingId());
//    	assignedTask_1.setRemarks(assignedTask.getRemarks());
//    	assignedTask_1.setTaskName(assignedTask.getTaskName());
//    	assignedTask_1.setTaskStatus(assignedTask.getTaskStatus());
//    	assignedTask_1.setTransferTo(0);
//    	
//    	
//    	assignedTaskDao.save(assignedTask_1);
//    	
//  	
//
//    	//create a success messag
//
//   	mv.setViewName("taskhistory");
//      mv.addObject("status", "Successfully Transfered");
//    	return mv;
 
  }

        

       

        

        @GetMapping("/updateTaskForm")

        public ModelAndView showtaskUpdate(HttpServletRequest request, @RequestParam("taskId") int taskId) {

            // Fetch the meeting details by meetingId (you may need to implement this)

        	AssignedTask task = assignedTaskDao.getTaskById(taskId);

     

            // Create and set the ModelAndView with the meeting details and view name

            System.out.println(task);

            logger.info("Updating meeting details");

            ModelAndView mv = new ModelAndView();

            mv.addObject("task", task);

            HttpSession httpSession = request.getSession();

            httpSession.setAttribute("task", task);

            mv.setViewName("taskupdate"); // Use the correct view name

            return mv;

        }
    
//    @GetMapping("/transferTaskForm")
//    public String taskTransfer()
//    {
//    	return "tasktransfer";
//    }
    
    @GetMapping("/transferTaskForm")
    public ModelAndView showtaskTransfer(HttpServletRequest req,@RequestParam("taskId") String taskId) {
        // Fetch the meeting details by meetingId (you may need to implement this)
    	int tId=Integer.parseInt(taskId);
    	AssignedTask task = assignedTaskDao.getTaskById(tId);

        // Create and set the ModelAndView with the meeting details and view name
        System.out.println(tId);
        
        ModelAndView mv = new ModelAndView();
        mv.addObject("task", task);
        HttpSession httpSession=req.getSession();
        httpSession.setAttribute("task", task);
        mv.setViewName("tasktransfer"); // Use the correct view name
        return mv;
    }
    @GetMapping("/canceltaskForm")
    public ModelAndView showCancelMeetingForm(HttpServletRequest request,@RequestParam("taskId") String taskId) {
        // Fetch the meeting details by meetingId (you may need to implement this)
        AssignedTask task = assignedTaskDao. getAssignedTaskById(taskId);

        // Create and set the ModelAndView with the meeting details and view name
        System.out.println(task);
        ModelAndView mv = new ModelAndView();
        //HttpSession httpSession = request.getSession();
      //  logger.info("canceling the task");
        request.setAttribute("task", task);
        mv.addObject("task", task);
        mv.setViewName("canceltaskForm"); // Use the correct view name
        return mv;
    }
    




 @PostMapping("/cancelTask")
    @ResponseBody
    public Map<String, String> cancelMeeting( @RequestBody AssignedTask assignedTask) {
        Map<String, String> response = new HashMap<>();
        System.out.println(assignedTask.getTaskId());
        System.out.println("rrrrrrrrrrrrrrrrrrrrrrrrrr");
       // logger.info("User clicked the cancle task button");

        try {
            boolean updated = assignedTaskDao.cancelTask(assignedTask);

            if (updated) {
                response.put("successMessage", "Task canceled successfully, TaskId:" + assignedTask.getTaskId());
            } else {
                response.put("errorMessage", "Task not found or could not be canceled.");
            }
        } catch (Exception e) {
            response.put("errorMessage", "Failed to cancel Task: " + e.getMessage());
        }

        return response;
    }
    @PostMapping("/searchTaskRedirect")
 @ResponseBody
 public Map<String, Object> redirectSearchPage(HttpServletRequest req,@RequestBody Map<String, String> request) {
      String taskid = request.get("taskId");
      String randomVariable=request.get("randomVariable");
//      String mid = request.get("mid");
//      String throughHome=request.get("throughHome");
  
  
      Map<String, Object> response = new HashMap<>();
      
       //Set the redirect URL in the response
  
 		HttpSession httpSession = req.getSession();
 		httpSession.setAttribute("taskId", taskid);
 		httpSession.setAttribute("randomVariable",randomVariable);
// 		httpSession.setAttribute("throughHome", throughHome);
 		System.out.println(taskid);
         
  
      
  
  
      return response;
 }
  
  
  
 @PostMapping("/getTaskIdDeatails")
  
 @ResponseBody
 public List<AssignedTask> homePageTaskDetails(HttpServletRequest request, @RequestBody Map<String, String> requestBody) {
      logger.info("search for the task details");
      String taskId = requestBody.get("taskId");
      logger.info("Received taskId: " + taskId);
  
      // Call DAO methods based on the provided parameters and return the result.
      List<AssignedTask> task1 = assignedTaskDao.getTaskByIdHome(taskId);
      request.setAttribute("task1", task1);
  
      System.out.println(task1);
      return task1;
 }
}
