package com.itcrats.meetingmate.controller;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itcrats.meetingmate.Dao.AssignedTaskDao;
import com.itcrats.meetingmate.Dao.MasterMeetingDao;
import com.itcrats.meetingmate.Dao.UserDao;
import com.itcrats.meetingmate.model.AssignedTask;
import com.itcrats.meetingmate.model.MasterMeeting;
import com.itcrats.meetingmate.model.User;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
public class LoginController {

	final static Logger logger = Logger.getLogger(LoginController.class);
	@Autowired
	private UserDao userDao;

	@GetMapping("/login")
	public String goToLoginPage() {
		logger.info("user enterd to the application");
		return "signin";
	}
	
	@Autowired
	private MasterMeetingDao masterMeetingDao;
	
	@Autowired
	private AssignedTaskDao assignedTaskDao;	

//	@GetMapping("/login")
//	public String goToHomePage() {
//		System.out.println(2);
//		return "homepage";
//	}
	
	@PostMapping("/login")
	public ModelAndView loginAdmin(HttpServletRequest request, @RequestParam("emailid") String emailId,
	        @RequestParam("password") String password) {
		logger.info("user coming into login process");
		ModelAndView mv = new ModelAndView();
        logger.info(emailId);
	    User user = userDao.getUserByEmailIdAndPassword(emailId, password);
        //String sign=user.getUserType();
	    if (user != null) {
	    	String sign=user.getUserStatus();
	    	if(sign.equals("active")) {
	    		mv.addObject("status", "User is already Logged In!");
	    		mv.setViewName("signin");
	    	}
	    	else {
	        HttpSession httpSession = request.getSession();
	        mv.addObject("status", user.getFirstName() + " Successfully Logged In!");
	        userDao.saveUpdateStatus("active",emailId);
            request.setAttribute("userObject", user);
	        httpSession.setAttribute("userObject1", user);
	        // Fetch today's meetings for the logged-in user
	        List<MasterMeeting> todayMeetings = masterMeetingDao.getMeetingsByTodayDateAndUserId(user.getUserId());
	       // List<AssignedTask>   progressTasks=assignedTaskDao.getTasksByUserIdAndInprogress(user.getUserId());
	        List<AssignedTask> inprogressTasks=assignedTaskDao.getTasksByUserIdAndInprogress(user.getUserId());
	        List<AssignedTask> upcomingTasks=assignedTaskDao.getTasksByUserIdAndUpcoming(user.getUserId());
	        mv.addObject("progressTasks",inprogressTasks);
	        mv.addObject("upcomingTasks",upcomingTasks);
	        mv.addObject("todayMeetings", todayMeetings);
//	        HttpSession session = request.getSession(false);
//            if(session == null){
////                LOG.info("Unable to find session. Creating a new session");
//            	System.out.println(",,,,,,,,,,,");
//                session = request.getSession(true);
//            } else if(session != null) {
//            	 session = request.getSession(true);
//				System.out.println("not");
//			}
//            mv.addObject("progressTasks",progressTasks);
	        mv.setViewName("homepage");
	    } }else {
	    	logger.error("user is null");
	    	//if(user.getEmailId()!=emailId)
	        mv.addObject("status", "Something wrong with username or password..");
	        mv.setViewName("signin");
	    }
		return mv;
    }
	
	//signinsuccessful page controller
	@PostMapping("/logout")
	public String loggingOut(HttpServletRequest request)
	{
		logger.info("user pressed logout button");
		HttpSession httpSession = request.getSession();
		User user=(User)httpSession.getAttribute("userObject1");
		if(user!=null) {
		userDao.saveUpdateStatus("inactive",user.getEmailId());
		logger.info("userStatus changed to inactive");
		httpSession.setAttribute("meetingId", "0");
		return "signin";
		}
		else{	
			httpSession.setAttribute("meetingId", "0");
		return "signin";
		}
	}
	
	
	
	@GetMapping("/homepage")
	public ModelAndView getHomePage(HttpServletRequest request)
  	{
	    ModelAndView mv = new ModelAndView();

        HttpSession httpSession = request.getSession();
        User user=(User)httpSession.getAttribute("userObject1");
        List<MasterMeeting> todayMeetings = masterMeetingDao.getMeetingsByTodayDateAndUserId(user.getUserId());
      //  List<AssignedTask>   progressTasks=assignedTaskDao.getTasksByUserIdAndInprogress(user.getUserId());
        List<AssignedTask> inprogressTasks=assignedTaskDao.getTasksByUserIdAndInprogress(user.getUserId());   
        List<AssignedTask> upcomingTasks=assignedTaskDao.getTasksByUserIdAndUpcoming(user.getUserId());
        
        mv.addObject("progressTasks",inprogressTasks);
        mv.addObject("upcomingTasks",upcomingTasks);
        mv.addObject("todayMeetings", todayMeetings);
        
        for (MasterMeeting meeting : todayMeetings) {
            System.out.println("Meeting ID: " + meeting.getAgenda());
            System.out.println("Meeting Date: " + meeting.getMeetingId());
            System.out.println("Meeting Title: " + meeting.getAgenda());
            System.out.println("MID : " +meeting.getMId());
        	
        	
         	logger.info("Meeting ID: " + meeting.getAgenda());
        	logger.info("Meeting Date: " + meeting.getMeetingId());
        	logger.info("Meeting Title: " + meeting.getAgenda());
        	
        	System.out.println(meeting);
        }
        	
       

            // Print other properties as needed
            //System.out.println();
            HttpSession session = request.getSession(false);
            if(session == null){
//                LOG.info("Unable to find session. Creating a new session");
            	System.out.println(".........");
                session = request.getSession(true);
            }
  		 mv.setViewName("homepage");
  		 
  	
        return mv;
  	}
}