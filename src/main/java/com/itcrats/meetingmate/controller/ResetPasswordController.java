package com.itcrats.meetingmate.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itcrats.meetingmate.Dao.UserDao;
import com.itcrats.meetingmate.model.User;
import com.itcrats.meetingmate.utility.FieldValidation;

@Controller
public class ResetPasswordController 
{
	final static Logger logger=Logger.getLogger(ResetPasswordController.class);
	@Autowired
	private UserDao userDao;
	
	@Autowired(required = false)
	private FieldValidation fieldValidation;;

	@GetMapping("/resetpassword")
	public String resetPassword()
	{
		logger.info("entered to resetpassword page.");
		//System.out.println("hello");
		return "ResetPassword";
	}

	@PostMapping("/resetpassworddata")
	public ModelAndView resetPasswordData(HttpServletRequest request,@RequestParam("oldpassword")String oldpassword,
			@RequestParam("newpassword")String newpassword,
			@RequestParam("confirmpassword")String confirmpassword)
	{
		logger.info("getting the data of reset password.");
		ModelAndView mv=new ModelAndView();
		try {
		HttpSession httpSession = request.getSession();
		User user=(User)httpSession.getAttribute("userObject1");
		if(newpassword.equals(confirmpassword) && oldpassword.equals(user.getPassword()))
		{
			logger.info("User entered data correctly");
			user.setPassword(newpassword);
			userDao.saveUpdatePassword(user.getEmailId(), confirmpassword);
			mv.addObject("status","Successfully Update");
			mv.setViewName("ResetPassword");
		}
		else 
		{
			if(oldpassword != user.getPassword())
			{
				logger.info("Old password is not correctd");
				mv.addObject("status","Failed to Update, Old Password is incorrect");
				mv.setViewName("ResetPassword");
			}
			else 
			{
				logger.info("new or confirm password not matched");
				mv.addObject("status","Failed to Update, Passwords are mismatching Or You may not follow the pattern..");
				mv.setViewName("ResetPassword");
			}
		}
		}catch(Exception err) {
			logger.error(err);
		}
		return mv;
	}
}
