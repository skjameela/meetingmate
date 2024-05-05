package com.itcrats.meetingmate.controller;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itcrats.meetingmate.Dao.AssignedTaskDao;
import com.itcrats.meetingmate.Dao.UserDao;
import com.itcrats.meetingmate.model.AssignedTask;

@Controller
public class CreateTaskController 
{
	final static Logger logger=Logger.getLogger(CreateTaskController.class);
	@Autowired
	public AssignedTaskDao assignedTaskDao;
     @GetMapping("")
     public String createTask()
     {
    	 return "";
     }
     
//     @GetMapping("/taskhistory")
// 	public void gettaskhistroy() {
// 		ModelAndView mv = new ModelAndView();
// 		mv.setViewName("taskhistory");
// 	}
 	
 	@GetMapping("/createtask")
 	public void getcreatetask() {
 		ModelAndView mv = new ModelAndView();
 		logger.info("Admin redirected to createtask page");
 		mv.setViewName("createtask");
 	}
 	
 	@Autowired
 	private UserDao userDao;

// 	@ResponseBody
// 	 @GetMapping("/autocompleteemployeeid")
// 	  public List<String> searchTasks(@RequestParam("prefix") String prefix) {
// 	       return userDao.autocompleteEmployeeIds(prefix);
//
// 	 }
// 	
// 	@ResponseBody
// 	 @GetMapping("/autocompleteemployeename")
// 	  public List<String> searchTasks1(@RequestParam("prefix1") String prefix1) {
// 	       return userDao.autocompleteEmployeeName(prefix1);
//
// 	 }
     @PostMapping("/createTask")
     @ResponseBody
     public Map<String, String> storeTask(HttpServletRequest req,@RequestBody AssignedTask assignedTask)
     {
    	 logger.info("data recieved to create task");
    	 Map<String, String> response = new HashMap<>();
         System.out.println(assignedTask.getTaskId());
    	// ModelAndView mv=new ModelAndView();
    		
    //	 assignedTask.setEmployeeId(employeeId);
    	 
    	 assignedTask.setTaskStatus("upcoming");
    	 assignedTask.setTransferTo(0);
    	 if(assignedTask.getAssignName().equals("") || assignedTask.getDescription().equals("") || assignedTask.getEmployeeId()==0 || assignedTask.getEstEndDate()==null || assignedTask.getEstStartDate()==null)
    		 response.put("successMessage", "fill the * marked field properly.");
    	 else {
    	 int result=assignedTaskDao.save(assignedTask);
    	 if (result>0) {
             response.put("successMessage", "Task created successfully");
         } else {
             response.put("successMessage", "Something went wrong. Task not created.");
         }
    	 }
    	 return response;
     }
}
