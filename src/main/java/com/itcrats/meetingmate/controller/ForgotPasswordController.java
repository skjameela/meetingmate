package com.itcrats.meetingmate.controller;

/*import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;*/

import java.time.Duration;
import java.time.LocalDateTime;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itcrats.meetingmate.Dao.TempUserDao;
import com.itcrats.meetingmate.Dao.UserDao;
import com.itcrats.meetingmate.model.TempUser;
import com.itcrats.meetingmate.model.User;

/**
 * @author harsha chava
 */
@Controller
public class ForgotPasswordController {
	final static Logger logger = Logger.getLogger(ForgotPasswordController.class);

	@Autowired
	private UserDao userDao;

	@Autowired
	private TempUserDao tempUserDao;

	// method created by harsha chava
	@GetMapping("/forgotpasswordenteremployeeid")
	public void getForgotPasswordEnterEmployeeId() {
		logger.info("getForgotPasswordEnterEmployeeId method has been invoked");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("forgotpasswordenteremployeeid");

	}

	// method created by harsha chava
	@GetMapping("/signin")
	public void getSignInPage() {
		logger.info("getSignInPage method has been invoked");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("signin");

	}

	@GetMapping("/forgotpasswordresendpasscode")
	public ModelAndView resendPasscode(HttpServletRequest request) {
		logger.info("resend passcode method invoked");
		ModelAndView mv = new ModelAndView();
		HttpSession httpSession = request.getSession();

		int employeeIdConverted = (int) httpSession.getAttribute("employeeIdConverted");
		TempUser tempUser = tempUserDao.getTempUserById(employeeIdConverted);
		try {

			String emailIdAddress = (String) httpSession.getAttribute("emailIdAddress");
			String passcode = MailController.generatePasscode(6);// Enter the randomly generated passcode number
			// here
			MailController.sendMail(passcode, emailIdAddress);
			// Get the current date and time
			LocalDateTime currentDateTime = LocalDateTime.now();
			logger.info("forgot password  current local date..." + currentDateTime);

			TempUser tempUserSave = new TempUser();

			if (tempUser != null) {
				logger.info("forgot password  if tempuser exists  with employeeId..." + employeeIdConverted);

				int tempUserDelete = tempUserDao.delete(employeeIdConverted);
				logger.info("forgot password  if tempuser exists  with employeeId delete status..." + tempUserDelete);

				tempUserSave.setEmpId(employeeIdConverted);
				tempUserSave.setEmailId(emailIdAddress);
				tempUserSave.setPasscode(Integer.parseInt(passcode));
				tempUserSave.setLocalDateTime(currentDateTime);
				int resultOfTempUserForSave = tempUserDao.save(tempUserSave);
				logger.info("forgot password  if tempuser exists  with employeeId save status..."
						+ resultOfTempUserForSave);

			} else {
				logger.info("forgot password  if tempuser doesn't exists ...");
				tempUserSave.setEmpId(employeeIdConverted);
				tempUserSave.setEmailId(emailIdAddress);
				tempUserSave.setPasscode(Integer.parseInt(passcode));
				tempUserSave.setLocalDateTime(currentDateTime);
				int resultOfTempUserForSave = tempUserDao.save(tempUserSave);
				logger.info("forgot password  if tempuser exists  with employeeId save status..."
						+ resultOfTempUserForSave);

			}

			mv.setViewName("forgotpasswordvalidatepasscode");
			return mv;

		} catch (

		Exception e) {

			logger.info("Exception was raised with " + e);
			e.printStackTrace();
			mv.addObject("status", e);
			mv.setViewName("forgotpasswordenteremployeeid");
			return mv;

		}

	}

	// method created by harsha chava
	@PostMapping("/forgotpasswordenterpasscode")
	public ModelAndView getForgotPasswordSendPasscode(HttpServletRequest request,
			@RequestParam("employeeId") String employeeId) {
		logger.info("getForgotPasswordSendPasscode method has been invoked");
		int employeeIdConverted = Integer.parseInt(employeeId);
		logger.info("forgot password is..." + employeeIdConverted);

		User user = userDao.getUserById(employeeIdConverted);
		TempUser tempUser = tempUserDao.getTempUserById(employeeIdConverted);

		HttpSession httpSession = request.getSession();

		httpSession.setAttribute("employeeIdConverted", employeeIdConverted);

		ModelAndView mv = new ModelAndView();

		try {

			if (user != null) {
				logger.info("forgot password  user exists successful..." + employeeIdConverted);

				// Fetch user mail id from database
				String toMail = user.getEmailId(); // Replace with the recipient's email address
				httpSession.setAttribute("emailIdAddress", toMail);

				logger.info("forgot password  if user exists  retrieve mail successful..." + toMail);

				String passcode = MailController.generatePasscode(6);// Enter the randomly generated passcode number
																		// here
				MailController.sendMail(passcode, toMail);

				// Get the current date and time
				LocalDateTime currentDateTime = LocalDateTime.now();
				logger.info("forgot password  current local date..." + currentDateTime);

				TempUser tempUserSave = new TempUser();

				if (tempUser != null) {
					logger.info("forgot password  if tempuser exists  with employeeId..." + employeeIdConverted);

					int tempUserDelete = tempUserDao.delete(employeeIdConverted);
					logger.info(
							"forgot password  if tempuser exists  with employeeId delete status..." + tempUserDelete);

					tempUserSave.setEmpId(employeeIdConverted);
					tempUserSave.setEmailId(toMail);
					tempUserSave.setPasscode(Integer.parseInt(passcode));
					tempUserSave.setLocalDateTime(currentDateTime);
					int resultOfTempUserForSave = tempUserDao.save(tempUserSave);
					logger.info("forgot password  if tempuser exists  with employeeId save status..."
							+ resultOfTempUserForSave);

				} else {
					logger.info("forgot password  if tempuser doesn't exists ...");
					tempUserSave.setEmpId(employeeIdConverted);
					tempUserSave.setEmailId(toMail);
					tempUserSave.setPasscode(Integer.parseInt(passcode));
					tempUserSave.setLocalDateTime(currentDateTime);
					int resultOfTempUserForSave = tempUserDao.save(tempUserSave);
					logger.info("forgot password  if tempuser exists  with employeeId save status..."
							+ resultOfTempUserForSave);

				}

				mv.setViewName("forgotpasswordvalidatepasscode");
				return mv;
			} else {
				logger.info("forgot password  if user doesn't exists  with employeeId ..." + employeeIdConverted);
				mv.addObject("status", "Employee Id doesn't exists");
				mv.setViewName("forgotpasswordenteremployeeid");
				return mv;
			}

		} catch (Exception e) {

			logger.info("Exception was raised with " + e);
			e.printStackTrace();
			mv.addObject("status", e);
			mv.setViewName("forgotpasswordenteremployeeid");
			return mv;

		}

	}

	// method created by harsha chava
	@PostMapping("/forgotpasswordresetpassword")
	public ModelAndView getForgotPasswordValidatePasscode(HttpServletRequest request,
			@RequestParam("enteredpasscode") String enteredpasscode) {
		logger.info("forgotpasswordresetpassword method has been invoked");
		HttpSession httpSession = request.getSession();
		int employeeId = (int) httpSession.getAttribute("employeeIdConverted");

		ModelAndView mv = new ModelAndView();

		TempUser tempUser = tempUserDao.getTempUserById(employeeId);

		LocalDateTime passcodeSentTime = tempUser.getLocalDateTime();
		logger.info("forgot password  passcode sent localdatetime is ..." + passcodeSentTime);

		// Get the current LocalDateTime
		LocalDateTime currentDateTime = LocalDateTime.now();

		logger.info("forgot password  current localdatetime is ..." + currentDateTime);

		// Calculate the duration between the two LocalDateTime objects
		Duration duration = Duration.between(passcodeSentTime, currentDateTime);
		logger.info("forgot password  duration between passcode sent localdatetime and current localdatetime is ..."
				+ duration);

		try {
			// Check if the duration is less than or equal to 1 minute
			if (duration.getSeconds() <= 60) {
				logger.info(
						"forgot password  duration is less than or equal to 60seconds  between passcode sent localdatetime and current localdatetime successful ...");

				int actualPasscode = tempUser.getPasscode();
				int enteredPasscode = Integer.parseInt(enteredpasscode);
				if (enteredPasscode == actualPasscode) {
					logger.info(
							"forgot password  duration is less than or equal to 60seconds  between passcode sent localdatetime and current localdatetime and passcode matching successful ...");
					mv.setViewName("forgotpasswordresetpassword");
					return mv;

				} else {
					logger.info(
							"forgot password  duration is less than or equal to 60seconds  between passcode sent localdatetime and current localdatetime and passcode didn't matched...");
					mv.addObject("status", "Incorrect Passcode");
					mv.setViewName("forgotpasswordvalidatepasscode");
					return mv;

				}

			} else {
				logger.info(
						"forgot password  duration is  not less than or equal to 60seconds  between passcode sent localdatetime and current localdatetime successful ...");

				mv.addObject("status", "Passcode Expired");
				mv.setViewName("forgotpasswordvalidatepasscode");
				return mv;

			}
		} catch (Exception e) {

			logger.info("Exception was raised with " + e);
			e.printStackTrace();
			mv.addObject("status", e);
			mv.setViewName("forgotpasswordvalidatepasscode");
			return mv;

		}

	}

	// method created by harsha chava
	@PostMapping("/forgotpasswordpasswordreset")
	public ModelAndView resetPasswordAfterForgot(HttpServletRequest request,
			@RequestParam("enterPassword") String enterPassword,
			@RequestParam("confirmPassword") String confirmPassword) {
		logger.info("forgotpasswordpasswordreset method has been invoked");
		HttpSession httpSession = request.getSession();
		int employeeId = (int) httpSession.getAttribute("employeeIdConverted");
		ModelAndView mv = new ModelAndView();
		try {
			if (enterPassword.equals(confirmPassword)) {
				logger.info("forgot password entered and confirm password are same ...");
				int savePassword = userDao.savePassword(confirmPassword, employeeId);
				System.out.println(savePassword);
				mv.addObject("status", "password has been reset");
				mv.setViewName("signin");
				return mv;

			} else {
				logger.info("forgot password entered and confirm password are  not same ...");
				mv.addObject("status", "entered password and confirm password are not same");
				mv.setViewName("forgotpasswordresetpassword");
				return mv;

			}

		} catch (Exception e) {

			logger.info("Exception was raised with " + e);
			e.printStackTrace();
			mv.addObject("status", e);
			mv.setViewName("forgotpasswordresetpassword");
			return mv;

		}

	}

}
