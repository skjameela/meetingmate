package com.itcrats.meetingmate.Dao;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.itcrats.meetingmate.RowMapper.MasterMeetingMapper;
import com.itcrats.meetingmate.controller.MeetingController;
import com.itcrats.meetingmate.model.MasterMeeting;

@Repository
public class MasterMeetingDao {
	final static Logger logger = Logger.getLogger(MeetingController.class);

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void createMasterMeetingTable() {

		String query = "CREATE TABLE IF NOT EXISTS MasterMeeting(mId int primary key AUTO_INCREMENT,meetingId BIGINT,ownerId int,subject varchar(255), agenda varchar(255),recurrence varchar(255),recurrencePattern varchar(255),masterMeetingId BIGINT, scheduleStartDate DATE, scheduleEndDate DATE, scheduleStartTime TIME , scheduleEndTime TIME, meetingStatus varchar(255), videoLink varchar(255), isFollowupMeet BOOLEAN,remarks varchar(255))";
		this.jdbcTemplate.update(query);
		System.out.println("create table MasterMeeting query executed");
		logger.info("master meeting table created");

	}

    public MasterMeeting getMasterMeetingByMeetingId(long meetingId) {
    	 
        String query = "select * from MasterMeeting where meetingId=" + meetingId;
        List<MasterMeeting> masterMeeting = new ArrayList<>();
        masterMeeting = this.jdbcTemplate.query(query, new MasterMeetingMapper());
        logger.info("Fetching meeting details by meetingId");
        if (masterMeeting.isEmpty()) {
            return null;
        } else {
            return masterMeeting.get(0);
        }
 
    }
   
   
//    public MasterMeeting getMasterMeetingByMasterMeetingId(long masterMeetingId) {
// 
//        String query = "select * from MasterMeeting where masterMeetingId=" + masterMeetingId;
//        List<MasterMeeting> masterMeeting = new ArrayList<>();
//        masterMeeting = this.jdbcTemplate.query(query, new MasterMeetingMapper());
//        logger.info("Fetching meeting details by masterMeetingId");
//        if (masterMeeting.isEmpty()) {
//            return null;
//        } else {
//            return masterMeeting.get(0);
//        }
// 
//    }
	
	


	// method created by harsha chava

	public int save(MasterMeeting masterMeeting) {

		String query = "INSERT INTO MasterMeeting (meetingId,ownerId,subject,agenda,recurrence,recurrencePattern,masterMeetingId,scheduleStartDate,scheduleEndDate,scheduleStartTime,scheduleEndTime,meetingStatus,videoLink,isFollowupMeet,remarks) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)";

		int update = this.jdbcTemplate.update(query,

				new Object[] { masterMeeting.getMeetingId(), masterMeeting.getOwnerId(), masterMeeting.getSubject(),
						masterMeeting.getAgenda(), masterMeeting.getRecurrence(), masterMeeting.getRecurrencePattern(),
						masterMeeting.getMasterMeetingId(), masterMeeting.getScheduleStartDate(),
						masterMeeting.getScheduleEndDate(), masterMeeting.getScheduleStartTime(),
						masterMeeting.getScheduleEndTime(), masterMeeting.getMeetingStatus(),
						masterMeeting.getVedioLink(), masterMeeting.getIsFollowupMeet(),masterMeeting.getRemarks() });

		return update;

	}

	public int delete(long meetingId) {

		String query = "delete from MasterMeeting where meetingId=" + meetingId;
		int update = this.jdbcTemplate.update(query);
		logger.info("deleting meeting details by meeting id");
		return update;

	}

//	    

//		public List<MasterMeeting> getMeetingByTodayDate(int userId) {

//			String query = "select * from MASTERMEETING where scheduledate='"+LocalDate.now() +"'and ownerId='"+userId+"'";

//			List<MasterMeeting> meetings = new ArrayList<>();

//			meetings = this.jdbcTemplate.query(query, new MasterMeetingMapper());

//

//			return meetings;

//		}
	
	
	

	// Jameela New
//	public List<MasterMeeting> getMeetingsByTodayDateAndUserId(int userId) {
//
//		// Assuming you have a follow-up table called FOLLOWUP_TABLE with ownerId and
//		// meetingid
//		String followUpQuery = "SELECT meetingId FROM participate WHERE empId = ?";
//
//		// Assuming you have a MASTERMEETING table with meetingid and scheduledate
//		String masterMeetingQuery = "SELECT * FROM MASTERMEETING WHERE meetingId IN (?) AND schedulestartdate = ?";
//
//		LocalDate today = LocalDate.now();
//		String dateAsString = today.toString();
//
//		// Get a list of meetingids associated with the user
//		List<Long> meetingIds = jdbcTemplate.queryForList(followUpQuery, new Object[] { userId }, Long.class);
//
//		// Convert the list of meetingids to a comma-separated string
//		String meetingIdsStr = String.join(",", meetingIds.stream().map(String::valueOf).toArray(String[]::new));
//		logger.info("fetching today meeting details of that particular user ");
//		// Fetch meetings from MASTERMEETING based on meetingids and scheduledate
//		List<MasterMeeting> meetings = jdbcTemplate.query(masterMeetingQuery,
//				new Object[] { meetingIdsStr, dateAsString }, new MasterMeetingMapper());
//
//		return meetings;
//
	
//	}
	
	
	public List<MasterMeeting> getMeetingsByTodayDateAndUserId(int userId) {
	    String followUpQuery = "SELECT meetingId FROM participate WHERE empId = ?";

	    String masterMeetingQuery = "SELECT * FROM MASTERMEETING WHERE meetingId = ? AND schedulestartdate = ?";

	    LocalDate today = LocalDate.now();
	    String dateAsString = today.toString();

	    List<Long> meetingIds = jdbcTemplate.queryForList(followUpQuery, new Object[] { userId }, Long.class);

	    List<MasterMeeting> meetings = new ArrayList<>();

	    for (Long meetingId : meetingIds) {
	        List<MasterMeeting> results = jdbcTemplate.query(masterMeetingQuery,
	                new Object[] { meetingId, dateAsString }, new MasterMeetingMapper());

	        meetings.addAll(results);
	    }

	    return meetings;
	}

	
	
	
	
	
	
	
	
//	public List<MasterMeeting> getMeetingsByTodayDateAndUserId(int userId) {
//	    // Assuming you have a follow-up table called FOLLOWUP_TABLE with ownerId and meetingid
//	    String followUpQuery = "SELECT meetingId FROM participate WHERE empId = ?";
//
//	    // Assuming you have a MASTERMEETING table with meetingid and scheduledate
//	    String masterMeetingQuery = "SELECT * FROM MASTERMEETING WHERE meetingId = ? AND schedulestartdate = ?";
//
//	    LocalDate today = LocalDate.now();
//	    String dateAsString = today.toString();
//
//	    // Get a list of meeting IDs associated with the user
//	    List<Long> meetingIds = jdbcTemplate.queryForList(followUpQuery, new Object[] { userId }, Long.class);
//
//	    List<MasterMeeting> meetings = new ArrayList<>();
//
//	    // Loop through each meeting ID and fetch details
//	    for (Long meetingId : meetingIds) {
//	        // Fetch details from MASTERMEETING for the current meeting ID and scheduled date
//	        MasterMeeting meeting = jdbcTemplate.queryForObject(masterMeetingQuery,
//	                new Object[] { meetingId, dateAsString }, new MasterMeetingMapper());
//
//	        if (meeting != null) {
//	            meetings.add(meeting);
//	        }
//	    }
//
//	    return meetings;
//	}

	
	
	
	

//    public List<String> autocompleteMeetingIds(String prefix) {

//        String sql = "SELECT meetingId FROM mastermeeting WHERE meetingid LIKE ? LIMIT 5"; // Adjust the query as needed

//        String likePrefix = prefix + "%";

//       return jdbcTemplate.queryForList(sql, String.class, likePrefix);

//   }

//	

	// Jameela New
	public List<String> autocompleteMasterMeetingIds(String prefix) {
		String sql = "SELECT meetingId FROM mastermeeting WHERE meetingId LIKE ? LIMIT 5";
		String wildcardPrefix = prefix + "%"; // Add the '%' wildcard to match any characters after the prefix
		logger.info("Meeting suggestions of meeting id dao function");
		Object[] params = { wildcardPrefix };

		return jdbcTemplate.queryForList(sql, String.class, params);
	}
	
	
	

	// Jameela New
//	public List<String> autocompleteMeetingIds(String prefix, int ownerId) {
//		String sql = "SELECT meetingId FROM participate WHERE meetingId LIKE ? and empId=? LIMIT 5";
//		String wildcardPrefix = prefix + "%"; // Add the '%' wildcard to match any characters after the prefix
//		logger.info("Meeting suggestions of meeting id dao function");
//		Object[] params = { wildcardPrefix, ownerId };
//
//		return jdbcTemplate.queryForList(sql, String.class, params);
//	}
	
	
	  public List<String> executeQueryAndRetrieveResults(String sql, Object[] params) {

	        return jdbcTemplate.queryForList(sql, String.class, params);

	    }

	 
	
	 public List<String> autocompleteMeetingIds(String prefix, int ownerId, String userType) {

	        String sql;

	        Object[] params;

	        String wildcardPrefix = prefix + "%"; // Add the '%' wildcard to match any characters after the prefix

	        logger.info("Meeting suggestions of meeting ID in DAO function");

	 

	        if ("admin".equals(userType)) {

	            // For admin users, retrieve all distinct meeting IDs

	            sql = "SELECT DISTINCT meetingId FROM participate WHERE meetingId LIKE ? LIMIT 5";

	            params = new Object[] { wildcardPrefix };

	        } else {

	            // For other users, retrieve meeting IDs based on their ID

	            sql = "SELECT DISTINCT meetingId FROM participate WHERE meetingId LIKE ? AND empId = ? LIMIT 5";

	            params = new Object[] { wildcardPrefix, ownerId };

	        }

	 

	        // Execute your database query and return the results as a list of strings

	        // Use your database access code here to execute the query

	        List<String> meetingSuggestions = executeQueryAndRetrieveResults(sql, params);

	 

	        return meetingSuggestions;

	    }
	 
	 
	 //jameela
	    public List<String> autocompleteMeetingNames(String prefix, int employeeId, String userType) {

	        String sql;

	        String wildcardPrefix = prefix + "%"; // Add the '%' wildcard to match any characters after the prefix

	 

	        if ("admin".equals(userType)) {

	            // Admins can fetch all agendas

	            sql = "SELECT DISTINCT agenda FROM mastermeeting WHERE agenda LIKE ?";

	            return jdbcTemplate.queryForList(sql, String.class, wildcardPrefix);

	        } else {

	            // Non-admin employees can only fetch agendas they are participating in

	            sql = "SELECT DISTINCT mm.agenda FROM mastermeeting mm " +

	                  "JOIN participate p ON mm.meetingId = p.meetingId " +

	                  "WHERE mm.agenda LIKE ? AND p.empId = ? " +

	                  "LIMIT 5";

	            return jdbcTemplate.queryForList(sql, String.class, wildcardPrefix, employeeId);

	        }

	    }

	
	
	

//	public List<String> autocompleteMeetingIds(String prefix, String selectedDate, String agenda, int ownerId) {
//	    String sql = "SELECT DISTINCT mm.meetingId " +
//	                 "FROM mastermeeting mm " +
//	                 "INNER JOIN participate p ON mm.meetingId = p.meetingId " +
//	                 "WHERE (mm.meetingId LIKE ? ";
//
//	    List<Object> params = new ArrayList<>();
//	    params.add(prefix + "%"); // Add the '%' wildcard to match any characters after the prefix
//
//	    if (selectedDate != null && !selectedDate.isEmpty()) {
//	        sql += "AND mm.scheduleDate = ? ";
//	        params.add(selectedDate);
//	    }
//
//	    if (agenda != null && !agenda.isEmpty()) {
//	        sql += "AND mm.agenda LIKE ? ";
//	        params.add("%" + agenda + "%"); // Add '%' wildcards to match any characters before and after the agenda
//	    }
//
//	    sql += ") AND p.ownerId = ? LIMIT 5";
//
//	    params.add(ownerId);
//
//	    return jdbcTemplate.queryForList(sql, String.class, params.toArray());
//	}

//	public List<String> autocompleteMeetingNames(String prefix) {
//	    String sql = "SELECT agenda FROM mastermeeting WHERE agenda LIKE ? LIMIT 5";
//	    String wildcardPrefix = prefix + "%"; // Add the '%' wildcard to match any characters after the prefix
//	  
//
//	    return jdbcTemplate.queryForList(sql, String.class, wildcardPrefix);
//	}

	    
//	public List<String> autocompleteMeetingNames(String prefix, int employeeId) {
//		String sql = "SELECT mm.agenda FROM mastermeeting mm " + "JOIN participate p ON mm.meetingId = p.meetingId "
//				+ "WHERE mm.agenda LIKE ? AND p.empId = ? " + "LIMIT 5";
//		String wildcardPrefix = prefix + "%"; // Add the '%' wildcard to match any characters after the prefix
//		logger.info("meeting name suggestions of dao function");
//		return jdbcTemplate.queryForList(sql, String.class, wildcardPrefix, employeeId);
//	}

//	public List<MasterMeeting> searchMeetingsByFied(String meetingId, String meetingName, String startDate) {
//		String sql = "SELECT * FROM mastermeeting WHERE 1=1";
//
//		// Create a list to hold query parameters
//		List<Object> params = new ArrayList<>();
//		logger.info("searching meeting deatails bu meeting meeting name meeting date");
//		if (meetingId != null && !meetingId.isEmpty()) {
//			sql += " AND meetingId = ?";
//			params.add(Long.parseLong(meetingId));
//		}
//		if (meetingName != null && !meetingName.isEmpty()) {
//			sql += " AND agenda = ?";
//			params.add(meetingName);
//		}
//		if (startDate != null && !startDate.isEmpty()) {
//			sql += " AND scheduleStartDate = ?";
//			params.add(startDate);
//		}
//
//		// Execute the query with parameters using the assignedTaskMapper
//		List<MasterMeeting> assignedMeetings = jdbcTemplate.query(sql, params.toArray(), new MasterMeetingMapper());
//
//		return assignedMeetings;
//	}
	
	    
	    
	    //jameela
//	    public List<MasterMeeting> searchMeetingsByFied(String meetingId, String meetingName, String startDate) {
//
//			
//
//			
//
//			String sql = "SELECT * FROM mastermeeting WHERE 1=1";
//
//	 
//
//			// Create a list to hold query parameters
//
//			List<Object> params = new ArrayList<>();
//
//			logger.info("searching meeting deatails bu meeting meeting name meeting date");
//			logger.info("Constructed SQL Query: " + sql);
//			logger.info("Query Parameters: " + params);
//
//
//			if (meetingId != null && !meetingId.isEmpty()) {
//
//				sql += " AND meetingId = ?";
//
////				params.add(Long.parseLong(meetingId));
//
//				params.add(meetingId);
//
//	 
//
//			
//
//			}
//
//			if (meetingName != null && !meetingName.isEmpty()) {
//
//				sql += " AND agenda = ?";
//
//				params.add(meetingName);
//
//			}
//
//			if (startDate != null && !startDate.isEmpty()) {
//
//				sql += " AND scheduleStartDate = ?";
//
//				params.add(startDate);
//
//			}
//
//	 
//
//			  if (params.isEmpty()) {
//
//			        // No conditions provided, so return an empty list
//
//			        return Collections.emptyList();
//
//			    } else {
//
//			        // Execute the query with parameters using the assignedTaskMapper
//
//			        List<MasterMeeting> assignedMeetings = jdbcTemplate.query(sql, params.toArray(), new MasterMeetingMapper());
//
//			        return assignedMeetings;
//
//			    }
//
//		}


//	    
//	    public List<MasterMeeting> searchMeetingsByField(String meetingId, String meetingName, String startDate, String userRole, int userId) {
//	        String sql = "SELECT * FROM mastermeeting WHERE 1=1";
//	        List<Object> params = new ArrayList<>();
// 
//	        if (meetingId != null && !meetingId.isEmpty()) {
//	            sql += " AND meetingId = ?";
//	            params.add(meetingId);
//	        }
// 
//	        if (meetingName != null && !meetingName.isEmpty()) {
//	            sql += " AND agenda = ?";
//	            params.add(meetingName);
//	        }
// 
//	        if (startDate != null && !startDate.isEmpty()) {
//	            sql += " AND scheduleStartDate = ?";
//	            params.add(startDate);
//	        }
// 
//	        if (userRole.equals("admin")) {
//	            // If the user is an admin, fetch all meetings
//	            List<MasterMeeting> assignedMeetings = jdbcTemplate.query(sql, params.toArray(), new MasterMeetingMapper());
//	            return assignedMeetings;
//	        } else if (userRole.equals("user")) {
//	            // If the user is a participant, fetch meetings where the participant's empId matches
//	            String participantSql = "SELECT meetingId FROM participate WHERE empId = ?";
//	            List<Long> meetingIds = jdbcTemplate.queryForList(participantSql, new Object[]{userId}, Long.class);
// 
//	            if (meetingIds.isEmpty()) {
//	                // If no meetings found for the user, return an empty list
//	                return Collections.emptyList();
//	            } else {
//	                // If meetings are found for the user, construct SQL to fetch those meetings
//	                sql += " AND meetingId IN (";
//	                for (int i = 0; i < meetingIds.size(); i++) {
//	                    sql += "?";
//	                    if (i < meetingIds.size() - 1) {
//	                        sql += ", ";
//	                    }
//	                    params.add(meetingIds.get(i));
//	                }
//	                sql += ")";
// 
//	                List<MasterMeeting> assignedMeetings = jdbcTemplate.query(sql, params.toArray(), new MasterMeetingMapper());
//	                return assignedMeetings;
//	            }
//	        } else {
//	            // For any other user role, return an empty list
//	            return Collections.emptyList();
//	        }
//	    }
// 

	
	    

public List<MasterMeeting> searchMeetingsByField(String meetingId, String meetingName, String startDate, String userRole, int userId) {
	        String sql = "SELECT * FROM mastermeeting WHERE 1=1";
	        List<Object> params = new ArrayList<>();
 
	        if (meetingId != null && !meetingId.isEmpty()) {
	            sql += " AND meetingId = ?";
	            params.add(meetingId);
	        }
 
	        if (meetingName != null && !meetingName.isEmpty()) {
	            sql += " AND agenda = ?";
	            params.add(meetingName);
	        }
 
	        if (startDate != null && !startDate.isEmpty()) {
	            sql += " AND scheduleStartDate = ?";
	            params.add(startDate);
	        }
 
	        if (userRole.equals("admin")) {
	            // If the user is an admin, fetch all meetings
	            List<MasterMeeting> assignedMeetings = jdbcTemplate.query(sql, params.toArray(), new MasterMeetingMapper());
	            return assignedMeetings;
	        } else if (userRole.equals("user")) {
	            // If the user is a participant, fetch meetings where the participant's empId matches
	            String participantSql = "SELECT meetingId FROM participate WHERE empId = ?";
	            List<Long> meetingIds = jdbcTemplate.queryForList(participantSql, new Object[]{userId}, Long.class);
 
	            if (meetingIds.isEmpty()) {
	                // If no meetings found for the user, return an empty list
	                return Collections.emptyList();
	            } else {
	                // If meetings are found for the user, construct SQL to fetch those meetings
	                sql += " AND meetingId IN (";
	                for (int i = 0; i < meetingIds.size(); i++) {
	                    sql += "?";
	                    if (i < meetingIds.size() - 1) {
	                        sql += ", ";
	                    }
	                    params.add(meetingIds.get(i));
	                }
	                sql += ")";
 
	                List<MasterMeeting> assignedMeetings = jdbcTemplate.query(sql, params.toArray(), new MasterMeetingMapper());
	                return assignedMeetings;
	            }
	        } else {
	            // For any other user role, return an empty list
	            return Collections.emptyList();
	        }
	    }

	// jameela new
	public MasterMeeting getMeetingById(String meetingId, String mId) {
		logger.info("fetching meeting details by meeting id and mid");
		String sql = "SELECT * FROM mastermeeting WHERE meetingId = ? and mId=?";

		return jdbcTemplate.queryForObject(sql, new Object[] { meetingId, mId }, new MasterMeetingMapper());

	}

	public boolean isAuthorizedToUpdateMeeting(String userSessionId) {
		// Replace this SQL query with your actual database query
		String sql = "SELECT COUNT(*) FROM mastermeeting WHERE ownerId = ? AND ownerId = ?";
		logger.info(" Checking user ca able update the meeting details");
		int count = jdbcTemplate.queryForObject(sql, Integer.class, userSessionId);

		return count > 0;
	}

	public void updateMeeting(MasterMeeting updatedMeeting) {
		String sql = "UPDATE mastermeeting SET agenda=?, scheduleStartDate=?, scheduleEndDate=?, scheduleStartTime=?, scheduleEndTime=?, meetingstatus=?, videoLink=?, isfollowupmeet=?, ownerId=?, recurrence=?, recurrencePattern=?, masterMeetingId=?, subject=?,remarks=? WHERE meetingId=? AND mId=?";
		logger.info("updating meeting details dao function");
		Object[] params = new Object[] { updatedMeeting.getAgenda(), updatedMeeting.getScheduleStartDate(),
				updatedMeeting.getScheduleEndDate(), updatedMeeting.getScheduleStartTime(),
				updatedMeeting.getScheduleEndTime(), updatedMeeting.getMeetingStatus(), updatedMeeting.getVedioLink(),
				updatedMeeting.getIsFollowupMeet(), updatedMeeting.getOwnerId(), updatedMeeting.getRecurrence(),
				updatedMeeting.getRecurrencePattern(), updatedMeeting.getMasterMeetingId(), updatedMeeting.getSubject(),updatedMeeting.getRemarks(),
				updatedMeeting.getMeetingId(), updatedMeeting.getMId() };

		jdbcTemplate.update(sql, params);
	}

	public boolean cancelMeeting(MasterMeeting updatedMeeting) {
		try {
			String sql = "UPDATE mastermeeting SET meetingStatus = ? ,remarks=? WHERE meetingId = ? and mId=?";
			Object[] params = new Object[] {"meeting cancled",updatedMeeting.getRemarks(), updatedMeeting.getMeetingId(), updatedMeeting.getMId()

			};
			logger.info("cancle meeting dao function");
			int rowsUpdated = jdbcTemplate.update(sql, params);

			return rowsUpdated > 0;
		} catch (Exception e) {
			// Handle exceptions or log errors if needed
			e.printStackTrace();
			return false;
		}
	}

	public int updateRecurrenceMeeting(MasterMeeting masterMeeting) {

		String query = "INSERT INTO MasterMeeting (meetingId,ownerId,subject,agenda,recurrence,recurrencePattern,masterMeetingId,scheduleStartDate,scheduleEndDate,scheduleStartTime,scheduleEndTime,meetingStatus,videoLink,isFollowupMeet,remarks) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)";
		int update = this.jdbcTemplate.update(query,
				new Object[] { masterMeeting.getMeetingId(), masterMeeting.getOwnerId(), masterMeeting.getSubject(),
						masterMeeting.getAgenda(), masterMeeting.getRecurrence(), masterMeeting.getRecurrencePattern(),
						masterMeeting.getMasterMeetingId(), masterMeeting.getScheduleStartDate(),
						masterMeeting.getScheduleEndDate(), masterMeeting.getScheduleStartTime(),
						masterMeeting.getScheduleEndTime(), masterMeeting.getMeetingStatus(),
						masterMeeting.getVedioLink(), masterMeeting.getIsFollowupMeet(),masterMeeting.getRemarks() });
		logger.info("updating recurrence meeting dao function");
		System.out.print(update);
		return update;
	}

	public int cancelRecurenceMeeting(MasterMeeting masterMeeting) {

		String query = "INSERT INTO MasterMeeting (meetingId,ownerId,subject,agenda,recurrence,recurrencePattern,masterMeetingId,scheduleStartDate,scheduleEndDate,scheduleStartTime,scheduleEndTime,meetingStatus,videoLink,isFollowupMeet,remarks) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)";
		int update = this.jdbcTemplate.update(query,
				new Object[] { masterMeeting.getMeetingId(), masterMeeting.getOwnerId(), masterMeeting.getSubject(),
						masterMeeting.getAgenda(), masterMeeting.getRecurrence(), masterMeeting.getRecurrencePattern(),
						masterMeeting.getMasterMeetingId(), masterMeeting.getScheduleStartDate(),
						masterMeeting.getScheduleEndDate(), masterMeeting.getScheduleStartTime(),
						masterMeeting.getScheduleEndTime(), "meeting canceled", masterMeeting.getVedioLink(),
						masterMeeting.getIsFollowupMeet(),masterMeeting.getRemarks() });
		logger.info("cancle recurrence meeting dao function");
		System.out.print(update);
		return update;
	}
	
	
	public List<MasterMeeting> getMasterMeetingByIdHome(String meetingId) {
	    String query = "select * from MasterMeeting where meetingId=?";
	    List<MasterMeeting> masterMeeting = jdbcTemplate.query(query, new Object[]{meetingId}, new MasterMeetingMapper());
	    logger.info("Fetching meeting details by meeting id");
	    return masterMeeting;
	}


}
