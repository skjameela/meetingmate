package com.itcrats.meetingmate.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.itcrats.meetingmate.Dao.FollowUpDao;
import com.itcrats.meetingmate.Dao.MasterMeetingDao;
import com.itcrats.meetingmate.Dao.ParticipateDao;
import com.itcrats.meetingmate.Dao.UserDao;
import com.itcrats.meetingmate.model.MasterMeeting;
import com.itcrats.meetingmate.model.Participate;
import com.itcrats.meetingmate.model.User;

@Controller
public class MeetingController {

	@Autowired
	UserDao userDao;

	@Autowired
	FollowUpDao followupDao;

	@Autowired
	ParticipateDao participateDao;

	final static Logger logger = Logger.getLogger(MeetingController.class);

	// Harsha New
	@GetMapping("/uploadmeeting")
	public void uploadMeeting() {
		ModelAndView mv = new ModelAndView();
		logger.info("User want to upload meeting");
		mv.setViewName("uploadmeeting");

	}

	// jameela new
	@GetMapping("/createmeeting")
	public ModelAndView getCreateMeeting() {
		ModelAndView mv = new ModelAndView();
		logger.info("User in create meeting page");
		mv.setViewName("createmeeting");
		return mv;
	}

	@GetMapping("/meetinghistory")
	public void getmeetinghistory(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		logger.info("User in meeting history page");

		// Clear the meetingId from the session
//	    HttpSession httpSession = request.getSession();
//	    httpSession.removeAttribute("meetingId");

		mv.setViewName("meetinghistory");
	}

	@PostMapping("/cancelcreatemeeting")

	public ModelAndView goBackToUploadMeeting() {

		logger.info("ccancelcreatemeeting method has been invoked");

		ModelAndView mv = new ModelAndView();

		String cancelCreateMeetingMsg = "You have choosen to cancel the creation of meeting";

		mv.addObject("cancelCreateMeetingMsg", cancelCreateMeetingMsg);

		mv.setViewName("createmeeting");

		return mv;

	}

	@PostMapping("/reflectmastermeeting")

	public ModelAndView reflectMasterMeeting(HttpServletRequest request, @RequestParam("subject") String subject,

			@RequestParam("organizer") String organizer, @RequestParam("recurrence") String recurrence,

			@RequestParam("recurrencePattern") String recurrencePattern,

			@RequestParam("requiredAttendees") String requiredAttendees, @RequestParam("meetingId") String meetingId,

			@RequestParam("optionalAttendees") String optionalAttendees, @RequestParam("agenda") String agenda,

			@RequestParam("scheduleStartDate") String scheduleStartDate,

			@RequestParam("scheduleEndDate") String scheduleEndDate,

			@RequestParam("scheduleStartTime") String scheduleStartTime,

			@RequestParam("scheduleEndTime") String scheduleEndTime,

			@RequestParam("meetingStatus") String meetingStatus) {

		logger.info("reflectmastermeeting method has been invoked");

		ModelAndView mv = new ModelAndView();
		String organizerNameAfterTrim = organizer.trim();
		User user = userDao.getUserByIdUsingName(organizerNameAfterTrim);
		if (user != null) {

			logger.info("Employee Id is ..." + user.getUserId());
			int empId = user.getUserId();
			mv.addObject("empId", empId);

		}

		logger.info("Employee Id is ..." + user.getUserId());

		mv.addObject("requiredAttendees", requiredAttendees);

		mv.addObject("subject", subject);

		mv.addObject("organizer", organizer);

		mv.addObject("meetingId", meetingId);

		mv.addObject("recurrence", recurrence);

		try {

			if (recurrencePattern == "") {

				logger.info("reflectmastermeeting recurrencePattern if executed");

				mv.addObject("recurrencePattern", "none");

			} else {

				logger.info("reflectmastermeeting recurrencePattern else executed");

				mv.addObject("recurrencePattern", recurrencePattern);

			}

			if (optionalAttendees == "") {

				logger.info("reflectmastermeeting optionalAttendees if executed");

				mv.addObject("optionalAttendees", "none");

			} else {

				logger.info("reflectmastermeeting optionalAttendees else executed");

				mv.addObject("optionalAttendees", optionalAttendees);

			}

			mv.addObject("agenda", agenda);

			mv.addObject("scheduleStartDate", scheduleStartDate);

			mv.addObject("scheduleEndDate", scheduleEndDate);

			mv.addObject("scheduleStartTime", scheduleStartTime);

			mv.addObject("scheduleEndTime", scheduleEndTime);

			mv.addObject("meetingStatus", meetingStatus);

			String videolink = "none";

			mv.addObject("videolink", videolink);

			mv.setViewName("createmastermeeting");

			return mv;

		} catch (Exception e) {

			logger.info("Exception was raised with " + e);

			e.printStackTrace();

			mv.addObject("status", e);

			mv.setViewName("displaymeetinginfo");

			return mv;

		}

	}

	@PostMapping("/createmastermeeting")
	public ModelAndView createMasterMeeting(HttpServletRequest request, @RequestParam("subject") String subject,

			@RequestParam("organizer") String organizer, @RequestParam("empId") int empId,

			@RequestParam("meetingId") String meetingId, @RequestParam("masterMeetingId") String masterMeetingId,

			@RequestParam("recurrence") String recurrence, @RequestParam("recurrencePattern") String recurrencePattern,

			@RequestParam("agenda") String agenda, @RequestParam("requiredAttendees") String requiredAttendees,

			@RequestParam("optionalAttendees") String optionalAttendees,

			@RequestParam("scheduleStartDate") String scheduleStartDate,

			@RequestParam("scheduleEndDate") String scheduleEndDate,

			@RequestParam("scheduleStartTime") String scheduleStartTime,

			@RequestParam("scheduleEndTime") String scheduleEndTime,

			@RequestParam("meetingStatus") String meetingStatus, @RequestParam("videolink") String videolink,

			@RequestParam("isFollowupMeet") String isFollowupMeet) {

		logger.info("createmastermeeting method has been invoked");

		ModelAndView mv = new ModelAndView();

		Long convertedMeetingId = Long.parseLong(meetingId);

		Long convertedMasterMeetingId;

		try {

			if (masterMeetingId == "") {

				logger.info("createmastermeeting masterMeetingId is empty if executed");

				convertedMasterMeetingId = Long.parseLong("000000000000");

			} else {
				logger.info("createmastermeeting masterMeetingId is empty else executed");

				convertedMasterMeetingId = Long.parseLong(masterMeetingId);
				MasterMeeting checkMeetingIdExists = masterMeetingDao
						.getMasterMeetingByMeetingId(convertedMasterMeetingId);
				if (checkMeetingIdExists == null) {
					logger.info("createmastermeeting  entered masterMeetingId doesn't exists ...");

					mv.addObject("status", "Entered masterMeetingId Doesn't Exists");

					mv.setViewName("meetinghistory");

					return mv;
				}

			}

			MasterMeeting masterMeeting = new MasterMeeting();

			Participate participate = new Participate();
			Participate participateOrg = new Participate();

			MasterMeeting meetingIdDuplicateCheck = masterMeetingDao.getMasterMeetingByMeetingId(convertedMeetingId);

			if (meetingIdDuplicateCheck != null) {

				logger.info("createmastermeeting meetingId already exists ...");

				mv.addObject("status", "Meeting Already Exists");

				mv.setViewName("meetinghistory");

				return mv;

			} else {

				logger.info("createmastermeeting masterMeetingId doesn't exist so creation is allowed ...");
				DateTimeFormatter formatterForDate = DateTimeFormatter.ofPattern("dd-MM-yyyy");
				LocalDate scheduleStartDateConverted = LocalDate.parse(scheduleStartDate, formatterForDate);
				LocalDate scheduleEndDateConverted = LocalDate.parse(scheduleEndDate, formatterForDate);

				DateTimeFormatter formatterForTime = DateTimeFormatter.ofPattern("HH:mm");

				LocalTime scheduleStartTimeConverted = LocalTime.parse(scheduleStartTime, formatterForTime);

				LocalTime scheduleEndTimeConverted = LocalTime.parse(scheduleEndTime, formatterForTime);

				// organizer name after trim
				String orgNameAfterTrim = organizer.trim();

				if (requiredAttendees != "") {

					logger.info("createmastermeeting requiredattendees match found ...");

					String[] requiredAttendeesNames = requiredAttendees.split(","); // Split names by comma and

					// space

					for (String requiredAttendeeName : requiredAttendeesNames) {

						String requiredAttendeeNameAfterTrim = requiredAttendeeName.trim();

						User user = userDao.getUserByIdUsingName(requiredAttendeeNameAfterTrim);

						if (user != null) {

							logger.info("createmastermeeting requiredattendees employee id found executed ...");

							int participateEmpId = user.getUserId();

							participate.setEmpId(participateEmpId);

						}

						participate.setEmpName(requiredAttendeeNameAfterTrim);

						participate.setIsActive(Boolean.parseBoolean("TRUE"));

						participate.setParticipantType("required");

						participate.setMeetingId(convertedMeetingId);

						participate.setMeetingOrganizer(orgNameAfterTrim);

						participateDao.save(participate);

						logger.info("createmastermeeting requiredattendees insertion completed ...");

					}
					User orgnizerAsUser = userDao.getUserByIdUsingName(orgNameAfterTrim);

					if (orgnizerAsUser != null) {
						int organizerEmpId = orgnizerAsUser.getUserId();
						participateOrg.setEmpId(organizerEmpId);
						participateOrg.setEmpName(orgNameAfterTrim);

						participateOrg.setIsActive(Boolean.parseBoolean("TRUE"));

						participateOrg.setParticipantType("required");

						participateOrg.setMeetingId(convertedMeetingId);

						participateOrg.setMeetingOrganizer(orgNameAfterTrim);

						participateDao.save(participateOrg);
						logger.info("createmastermeeting organizer insertion completed ...");

					}

				}
				

				if (optionalAttendees.equals("none")) {

					logger.info("createmastermeeting  no optionalattendees  found executed ...");

				} else {

					logger.info("createmastermeeting optionalattendees employee id found executed ...");

					String[] optionalAttendeesNames = optionalAttendees.split(","); // Split names by comma

					// and

					// space

					for (String optionalAttendeeName : optionalAttendeesNames) {

						String optionalAttendeeNameAfterTrim = optionalAttendeeName.trim();

						User user = userDao.getUserByIdUsingName(optionalAttendeeNameAfterTrim);

						if (user != null) {

							int participateEmpId = user.getUserId();

							participate.setEmpId(participateEmpId);

						}

						participate.setEmpName(optionalAttendeeNameAfterTrim);

						participate.setIsActive(Boolean.parseBoolean("TRUE"));

						participate.setParticipantType("optional");

						participate.setMeetingId(convertedMeetingId);

						participate.setMeetingOrganizer(orgNameAfterTrim);

						participateDao.save(participate);

						logger.info("createmastermeeting optionalattendees insertion completed ...");

					}

				}

				masterMeeting.setMeetingId(convertedMeetingId);

				masterMeeting.setOwnerId(empId);

				masterMeeting.setAgenda(agenda);

				masterMeeting.setMasterMeetingId(convertedMasterMeetingId);

				masterMeeting.setRecurrence(recurrence);

				masterMeeting.setRecurrencePattern(recurrencePattern);

				masterMeeting.setSubject(subject);

				masterMeeting.setScheduleStartDate(scheduleStartDateConverted);

				masterMeeting.setScheduleEndDate(scheduleEndDateConverted);

				masterMeeting.setScheduleStartTime(scheduleStartTimeConverted);

				masterMeeting.setScheduleEndTime(scheduleEndTimeConverted);

				masterMeeting.setMeetingStatus(meetingStatus);

				masterMeeting.setVedioLink(videolink);
				masterMeeting.setRemarks("none");

				masterMeeting.setIsFollowupMeet(Boolean.parseBoolean(isFollowupMeet));

				masterMeetingDao.save(masterMeeting);

				logger.info("createmastermeeting mastermeeting insertion completed ...");
				mv.addObject("status", "Meeting created successfully");

				mv.setViewName("meetinghistory");

				return mv;

			}

		} catch (Exception e) {

			logger.info("Exception was raised with " + e);

			e.printStackTrace();

			mv.addObject("status", e);

			mv.setViewName("meetinghistory");

			return mv;

		}

	}

	@PostMapping("/uploadFile")

	public ModelAndView uploadFile(@RequestParam("filename") MultipartFile file) {

		logger.info("createMeeting method has been invoked");

		ModelAndView mv = new ModelAndView();

		// creating map object

		Map<String, Object> meetingInfo = new LinkedHashMap<>();

		if (!file.isEmpty()) {

			logger.info("createMeeting file is not empty  executed and there is content");

			try {

				// Read the content of the uploaded file

				BufferedReader reader = new BufferedReader(new InputStreamReader(file.getInputStream()));

				String line;

				// if there is some content in line

				while ((line = reader.readLine()) != null) {

					// matcher pattern

					Matcher matcher = Pattern.compile("^(.*?):\\s+(.*)$").matcher(line);

					if (matcher.find()) {

						// if Optional Attendees or Required Attendees

						if (matcher.group(1).equals("Optional Attendees")

								|| matcher.group(1).equals("Required Attendees")) {

							String attendees = matcher.group(2);

							String[] attendeesArray = attendees.split(",");

							List<String> attendeeList = Arrays.asList(attendeesArray);
							String attendeeListString = attendeeList.toString();

							// Remove the square brackets
							String modifiedAttendeeListString = attendeeListString.substring(1,
									attendeeListString.length() - 1);

							String key = matcher.group(1);
//									.replaceAll("\\s", "")

							Object value = modifiedAttendeeListString;

							logger.info("createMeeting required and optional attendees readed successfully");

							// push the required and optional attendees key ,value

							meetingInfo.put(key, value);

						} else if (matcher.group(1).equals("Recurrence")) {

							if (matcher.group(2).equals("(none)")) {

								String key = matcher.group(1);
//								.replaceAll("\\s", "")

								Object value = matcher.group(2).replace("(", "").replace(")", "");

								logger.info("createMeeting (none) readed successfully");

								meetingInfo.put(key, value);

							} else {

								String key = matcher.group(1);
//								.replaceAll("\\s", "")

								Object value = matcher.group(2);

								logger.info("createMeeting other than (none) readed successfully");

								meetingInfo.put(key, value);

							}

						}

						// if Recurrence Pattern

						else if (matcher.group(1).equals("Recurrence Pattern")) {

							// // Split the pattern based on "every", "and", and "from"

							String recurrencePattern = matcher.group(2);

							String[] parts = recurrencePattern.split("every|and|from|,|16:00 to 16:30");

							List<String> weekdaysList = new ArrayList<>();

							// Extract weekdays (skip empty or whitespace-only parts)

							for (String part : parts) {

								System.out.println(part);

								String trimmedPart = part.trim();

								if (!trimmedPart.isEmpty()) {

									weekdaysList.add(trimmedPart);

								}

							}

							String weekdaysListString = weekdaysList.toString();

							// Remove the square brackets
							String modifiedweekdaysListString = weekdaysListString.substring(1,
									weekdaysListString.length() - 1);

							// push the weekdays key ,value

							String key = matcher.group(1);
//							.replaceAll("\\s", "")

							Object value = modifiedweekdaysListString;

							logger.info("createMeeting recuurencePattern  readed successfully");

							meetingInfo.put(key, value);

						} else if (matcher.group(1).equals("Start")) {

							String inputStartDateTime = matcher.group(2);

							String inputStartDate = inputStartDateTime.substring(4, 14);

							String inputStartTime = inputStartDateTime.substring(15, 20);

							String startDate = "Start Date";

							logger.info("createMeeting StartDate  readed successfully");

							meetingInfo.put(startDate, inputStartDate);

							String startTime = "Start Time";

							logger.info("createMeeting StartTime  readed successfully");

							meetingInfo.put(startTime, inputStartTime);

						} else if (matcher.group(1).equals("End")) {

							String inputEndDateTime = matcher.group(2);

							String inputEndDate = inputEndDateTime.substring(4, 14);

							String inputEndTime = inputEndDateTime.substring(15, 20);

							String endDate = "End Date";

							logger.info("createMeeting EndDate  readed successfully");

							meetingInfo.put(endDate, inputEndDate);

							String endTime = "End Time";

							logger.info("createMeeting EndTime  readed successfully");

							meetingInfo.put(endTime, inputEndTime);

						} else if (matcher.group(1).equals("Meeting Status")) {
							String key = matcher.group(1);
							String value = "Scheduled";
							meetingInfo.put(key, value);

						}

						else {

							if (matcher.group(1).equals("Meeting ID")) {

								String meetingId = matcher.group(2);

								String digitsOnly = meetingId.replaceAll("[^0-9]", "");

								String key = matcher.group(1);
//								.replaceAll("\\s", "")

								Object value = digitsOnly;

								logger.info("createMeeting  meetingId readed successfully");

								// push the remaining as key ,value pairs

								meetingInfo.put(key, value);

							} else {

								String key = matcher.group(1);
//								.replaceAll("\\s", "")

								Object value = matcher.group(2);

								logger.info("createMeeting rest are  readed successfully");

								// push the remaining as key ,value pairs

								meetingInfo.put(key, value);

							}

						}

					}

				}

			} catch (IOException e) {

				e.printStackTrace();

				logger.info("Exception was raised with " + e);

				e.printStackTrace();

				mv.addObject("status", e);

				mv.setViewName("displaymeetinginfo");

				return mv;

			}

		}
		Map<String, Object> orderedMeetingInfo = new LinkedHashMap<>();
		String[] order = { "Meeting ID", "Organizer", "Subject", "Agenda", "Recurrence", "Recurrence Pattern",
				"Start Date", "Start Time", "End Date", "End Time", "Required Attendees", "Optional Attendees",
				"Meeting Status", "Passcode", "Location" };
		for (String key : order) {

			if (meetingInfo.containsKey(key)) {
				orderedMeetingInfo.put(key, meetingInfo.get(key));

//		    	 if(key=="Required Attendees") {
//		    		 String abc=(String) meetingInfo.get(key);
//						
//		    		 abc.replaceAll("[", "").replaceAll("]", "");
//		    		 orderedMeetingInfo.put(key, abc);
//					}
//		    	 else {
//		    		 orderedMeetingInfo.put(key, meetingInfo.get(key));
//		    	 }

			}
		}
		mv.addObject("meetingInfo", meetingInfo);
		mv.addObject("orderedMeetingInfo", orderedMeetingInfo);

		mv.setViewName("displaymeetinginfo");

		return mv; // Return a result JSP page to display the file content

	}

	// jameela new
	@Autowired
	private MasterMeetingDao masterMeetingDao;

	@ResponseBody
	@GetMapping("/autocompletemaster")
	public List<String> searchmasterMeetings(HttpServletRequest request, @RequestParam("prefix") String prefix) {
		HttpSession httpSession = request.getSession();
		logger.info("User can select the information he want to access");

		return masterMeetingDao.autocompleteMasterMeetingIds(prefix);
	}

	@ResponseBody
	@GetMapping("/autocomplete")
	public List<String> searchMeetings(HttpServletRequest request, @RequestParam("prefix") String prefix) {
		HttpSession httpSession = request.getSession();
		logger.info("User can select the information he want to access");
		User user = (User) httpSession.getAttribute("userObject1");
		return masterMeetingDao.autocompleteMeetingIds(prefix, user.getUserId(), user.getUserType());
	}
	// @Autowired
	// private MasterMeetingDao masterMeetingDao;
	// @ResponseBody
	// @GetMapping("/autocomplete")
	// public List<String> searchMeetings(@RequestParam String prefix) {
	// return masterMeetingDao.autocompleteMeetingIds(prefix);
	// }
	// @Autowired
	// private MasterMeetingDao masterMeetingDao;

	// @ResponseBody
	// @GetMapping("/autocomplete")
	// public List<String> searchMeetings(HttpServletRequest request,
	// @RequestParam("prefix") String prefix,
	// @RequestParam(name = "selectedDate", required = false) String selectedDate,
	// @RequestParam(name = "agenda", required = false) String agenda) {
	// HttpSession httpSession = request.getSession();
	// User user = (User) httpSession.getAttribute("userObject1");
	//
	// if (selectedDate == null) {
	// selectedDate = ""; // Ensure selectedDate is not null
	// } else {
	// // Convert selectedDate to "yyyy-MM-dd" format
	// SimpleDateFormat inputFormat = new SimpleDateFormat("dd-MM-yyyy"); // Input
	// format "dd-MM-yyyy"
	// SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
	// try {
	// Date date = inputFormat.parse(selectedDate);
	// selectedDate = outputFormat.format(date);
	// } catch (ParseException e) {
	// // Handle parsing error, if any
	// }
	// }
	//
	// if (agenda == null) {
	// agenda = ""; // Ensure agenda is not null
	// }
	//
	// return masterMeetingDao.autocompleteMeetingIds(prefix, selectedDate, agenda,
	// user.getId());
	// }

	@ResponseBody
	@GetMapping("/autocompletemeetingname")
	public List<String> searchMeetingsName(HttpServletRequest request, @RequestParam("prefix") String prefix) {
		HttpSession httpSession = request.getSession();
		logger.info("meeting name suggestion");
		User user = (User) httpSession.getAttribute("userObject1");
		return masterMeetingDao.autocompleteMeetingNames(prefix, user.getUserId(), user.getUserType());
	}

//	@PostMapping("/searchMeetings")
//	@ResponseBody
//	public List<MasterMeeting> searchMeetings(HttpServletRequest request,
//			@RequestParam(name = "meetingId", required = false) String meetingId,
//			@RequestParam(name = "meetingName", required = false) String meetingName,
//			@RequestParam(name = "startDate", required = false) String startDate) {
//		logger.info("search for the meeting details");
//		logger.info("Received meetingId: " + meetingId);
//		logger.info("Received meetingName: " + meetingName);
//		logger.info("Received startDate: " + startDate);
//
//		// Call DAO methods based on the provided parameters and return the result.
//		List<MasterMeeting> meeting1 = masterMeetingDao.searchMeetingsByFied(meetingId, meetingName, startDate);
//		request.setAttribute("meeting1", meeting1);
//		System.out.println(meeting1);
//		return meeting1;
//	}

//	@PostMapping("/searchMeetings")
//	@ResponseBody
//	public List<MasterMeeting> searchMeetings(HttpServletRequest request,
//			@RequestParam(name = "meetingId", required = false) String meetingId,
//			@RequestParam(name = "meetingName", required = false) String meetingName,
//			@RequestParam(name = "startDate", required = false) String startDate)
//
//	{
//		logger.info("search for the meeting details");
//		logger.info("Received meetingId: " + meetingId);
//		logger.info("Received meetingName: " + meetingName);
//		logger.info("Received startDate: " + startDate);
//
//		// Call DAO methods based on the provided parameters and return the result.
//		List<MasterMeeting> meeting1 = masterMeetingDao.searchMeetingsByFied(meetingId, meetingName, startDate);
//		request.setAttribute("meeting1", meeting1);
//
//		System.out.println(meeting1);
//		return meeting1;
//	}

//	
//	@PostMapping("/searchMeetings")
//	@ResponseBody
//	public List<MasterMeeting> searchMeetings(HttpServletRequest request,
//	        @RequestParam(name = "meetingId", required = false) String meetingId,
//	        @RequestParam(name = "meetingName", required = false) String meetingName,
//	        @RequestParam(name = "startDate", required = false) String startDate) {
// 
//	    // Assuming the user role and ID are stored in session attributes
//		logger.info("meeting name suggestion");
//		HttpSession httpSession = request.getSession();
//		User user = (User) httpSession.getAttribute("userObject1");
//		String userRole=user.getUserType();
//		int userId=user.getUserId();
//		
// 
////	    logger.info("search for the meeting details");
////	    logger.info("Received meetingId: " + meetingId);
////	    logger.info("Received meetingName: " + meetingName);
////	    logger.info("Received startDate: " + startDate);
// 
//	    // Call DAO method based on the provided parameters and user role, then return the result
//	    List<MasterMeeting> meeting1 = masterMeetingDao.searchMeetingsByField(meetingId, meetingName, startDate, userRole, userId);
//	    request.setAttribute("meeting1", meeting1);
// 
//	    System.out.println(meeting1);
//	    return meeting1;
//	}

	@PostMapping("/searchMeetings")
	@ResponseBody
	public List<MasterMeeting> searchMeetings(HttpServletRequest request,
			@RequestParam(name = "meetingId", required = false) String meetingId,
			@RequestParam(name = "meetingName", required = false) String meetingName,
			@RequestParam(name = "startDate", required = false) String startDate) {

		// Assuming the user role and ID are stored in session attributes
		logger.info("meeting name suggestion");
		HttpSession httpSession = request.getSession();
		User user = (User) httpSession.getAttribute("userObject1");
		String userRole = user.getUserType();
		int userId = user.getUserId();

//	    logger.info("search for the meeting details");
//	    logger.info("Received meetingId: " + meetingId);
//	    logger.info("Received meetingName: " + meetingName);
//	    logger.info("Received startDate: " + startDate);

		// Call DAO method based on the provided parameters and user role, then return
		// the result
		List<MasterMeeting> meeting1 = masterMeetingDao.searchMeetingsByField(meetingId, meetingName, startDate,
				userRole, userId);
		request.setAttribute("meeting1", meeting1);

		System.out.println(meeting1);
		return meeting1;
	}

	//
	// @PostMapping("/updateMeeting")
	// public ModelAndView showUpdateMeetingForm(@RequestParam("meetingId") String
	// meetingId) {
	// ModelAndView mv = new ModelAndView();
	// MasterMeeting meeting = masterMeetingDao.getMeetingById(meetingId);
	// mv.addObject("meeting",meeting);
	// mv.setViewName("updateMeetingForm");
	//
	// return mv;
	// }

	//
	// @PostMapping("/updateMeeting")
	// public ModelAndView updateMeeting(@ModelAttribute("meeting") MasterMeeting
	// updatedMeeting) {
	// // Update the meeting details in the database (you may need to implement
	// this)
	// //masterMeetingDao.updateMeeting(updatedMeeting);
	//
	// // Redirect to a success page or display a success message
	// ModelAndView mv = new ModelAndView();
	// mv.setViewName("updateSuccess"); // Use the correct view name
	// return mv;
	// }

	@GetMapping("/updateMeetingForm")
	public ModelAndView showUpdateMeetingForm(HttpServletRequest request, @RequestParam("meetingId") String meetingId,
			@RequestParam("mId") String mId) {
		// Fetch the meeting details by meetingId (you may need to implement this)
		MasterMeeting meeting = masterMeetingDao.getMeetingById(meetingId, mId);
		System.out.println(meeting);
		// Create and set the ModelAndView with the meeting details and view name
		System.out.println(meeting);
		logger.info("updating meeting details ");
		ModelAndView mv = new ModelAndView();
		mv.addObject("meeting", meeting);
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("meeting", meeting);
		mv.setViewName("updateMeetingForm"); // Use the correct view name
		return mv;
	}

	@GetMapping("/cancleMeetingForm")
	public ModelAndView showCancleMeetingForm(HttpServletRequest request, @RequestParam("meetingId") String meetingId,
			@RequestParam("mId") String mId) {
		// Fetch the meeting details by meetingId (you may need to implement this)
		MasterMeeting meeting = masterMeetingDao.getMeetingById(meetingId, mId);

		// Create and set the ModelAndView with the meeting details and view name
		System.out.println(meeting);
		ModelAndView mv = new ModelAndView();
		HttpSession httpSession = request.getSession();
		logger.info("cancling the meeting");
		httpSession.setAttribute("meeting", meeting);
		mv.addObject("meeting", meeting);
		mv.setViewName("cancleMeetingForm"); // Use the correct view name
		return mv;
	}

	@PostMapping("/updateMeeting")

	@ResponseBody

	public Map<String, String> updateMeeting(@RequestBody MasterMeeting mastermeeting)

	{

		MasterMeeting masterMeeting = masterMeetingDao.getMeetingById(String.valueOf(mastermeeting.getMeetingId()),
				String.valueOf(mastermeeting.getMId()));

		logger.info("user clicking the update button for update the meeting");

		Map<String, String> response = new HashMap<>();

		if (mastermeeting.equals(masterMeeting))

		{

			response.put("successMessage", "Meeting details didn't change anything");

		}

		else

		{

			masterMeetingDao.updateMeeting(mastermeeting);

			response.put("successMessage",
					"Meeting details " + masterMeeting.getMeetingId() + " updated successfully.");

		}

		return response;

	}

	@PostMapping("/updateRecurrenceMeeting")

	@ResponseBody

	public Map<String, String> updateRecurenceMeeting(@RequestBody MasterMeeting mastermeeting)

	{

		MasterMeeting masterMeeting = masterMeetingDao.getMeetingById(String.valueOf(mastermeeting.getMeetingId()),
				String.valueOf(mastermeeting.getMId()));

		logger.info("User in the update recurrence meeting form");

		Map<String, String> response = new HashMap<>();

		if (mastermeeting.equals(masterMeeting))

		{

			response.put("successMessage", "Meeting details didn't change anything");

		}

		else

		{

			masterMeetingDao.updateRecurrenceMeeting(mastermeeting);

			response.put("successMessage",
					"Meeting details " + masterMeeting.getMeetingId() + " updated successfully.");

		}

		return response;

	}

	@PostMapping("/cancelRecurenceMeeting")

	@ResponseBody

	public Map<String, String> cancelRecurenceMeeting(@RequestBody MasterMeeting mastermeeting)

	{

		Map<String, String> response = new HashMap<>();

		MasterMeeting masterMeeting = masterMeetingDao.getMeetingById(String.valueOf(mastermeeting.getMeetingId()),
				String.valueOf(mastermeeting.getMId()));

		logger.info("User clicked the cancel recurrence meeting button");

		Map<String, String> response1 = new HashMap<>();

		if (mastermeeting.equals(masterMeeting))

		{

			response1.put("successMessage", "Meeting details didn't change anything");

		}

		else

		{

			response1.put("successMessage", "Meeting " + masterMeeting.getMeetingId() + " canceled successfully.");

			masterMeetingDao.cancelRecurenceMeeting(mastermeeting);

		}

		return response1;

	}

	@PostMapping("/cancelMeeting")

	@ResponseBody

	public Map<String, String> cancelMeeting(@RequestBody MasterMeeting mastermeeting) {
		Map<String, String> response = new HashMap<>();

		logger.info("User clicked the cancle button");

		MasterMeeting masterMeeting = masterMeetingDao.getMeetingById(String.valueOf(mastermeeting.getMeetingId()),
				String.valueOf(mastermeeting.getMId()));

		try {

			boolean updated = masterMeetingDao.cancelMeeting(mastermeeting);

			if (updated) {

				response.put("successMessage", "Meeting " + masterMeeting.getMeetingId() + " canceled successfully.");

			} else {

				response.put("errorMessage", "Meeting not found or could not be canceled.");

			}

		} catch (Exception e) {

			response.put("errorMessage", "Failed to cancel meeting: " + e.getMessage());

		}

		return response;

	}

//  @GetMapping("/searchMeetingRedirect")
//  public ModelAndView redirectSearchPage(@RequestParam("meetingid") String meetingid, @RequestParam("mid") String mid) {
//      ModelAndView mv = new ModelAndView();
//      MasterMeeting meetingdeatis = masterMeetingDao.getMeetingById(meetingid, mid);
//      mv.setViewName("meetinghistory");
//      mv.addObject("meetingdeatis", meetingdeatis); // Add the object with a key
//      return mv;
//  }

	@PostMapping("/searchMeetingRedirect")
	@ResponseBody
	public Map<String, Object> redirectSearchPage(HttpServletRequest req, @RequestBody Map<String, String> request) {
		String meetingid = request.get("meetingId");
		String randomVariable = request.get("randomVariable");
//      String mid = request.get("mid");
//      String throughHome=request.get("throughHome");

		Map<String, Object> response = new HashMap<>();

		// Set the redirect URL in the response
//      response.put("redirect", "/meetinghistory");
		HttpSession httpSession = req.getSession();
		httpSession.setAttribute("meetingId", meetingid);
		httpSession.setAttribute("randomVariable", randomVariable);
//		httpSession.setAttribute("throughHome", throughHome);
		System.out.println(meetingid);

		// Include the meetingdeatis object in the response
//      response.put("meetingdeatis", meetingdeatis);
//      System.out.println(meetingdeatis);

		return response;
	}

//    
//    @PostMapping("/searchMeetingRedirect")
//    public ModelAndView redirectSearchPage(HttpServletRequest req, @RequestBody Map<String, String> request) {
//        String meetingId = request.get("meetingId");
//        HttpSession httpSession = req.getSession();
//        httpSession.setAttribute("meetingId", meetingId);
//
//        ModelAndView modelAndView = new ModelAndView();
//        modelAndView.setViewName("meetinghistory");
//
//        return modelAndView;
//    }

	@PostMapping("/getMeetingIdDeatails")

	@ResponseBody
	public List<MasterMeeting> homePageMeetingDetails(HttpServletRequest request,
			@RequestBody Map<String, String> requestBody) {
		logger.info("search for the meeting details");
		String meetingId = requestBody.get("meetingId");
		logger.info("Received meetingId: " + meetingId);

		// Call DAO methods based on the provided parameters and return the result.
		List<MasterMeeting> meeting1 = masterMeetingDao.getMasterMeetingByIdHome(meetingId);
		request.setAttribute("meeting1", meeting1);

		System.out.println(meeting1);
		return meeting1;
	}

}