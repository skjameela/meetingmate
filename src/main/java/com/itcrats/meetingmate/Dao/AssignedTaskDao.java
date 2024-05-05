package com.itcrats.meetingmate.Dao;

//import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.itcrats.meetingmate.RowMapper.AssignedTaskMapper;
import com.itcrats.meetingmate.RowMapper.MasterMeetingMapper;
import com.itcrats.meetingmate.controller.TaskController;
//import com.itcrats.meetingmate.RowMapper.MasterMeetingMapper;
import com.itcrats.meetingmate.model.AssignedTask;
//import com.itcrats.meetingmate.model.MasterMeeting;
import com.itcrats.meetingmate.model.MasterMeeting;
import com.itcrats.meetingmate.model.User;

@Repository
public class AssignedTaskDao {
	
	final static Logger logger= Logger.getLogger(TaskController.class);

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void createAssignedTaskTable() {

		String query = "CREATE TABLE IF NOT EXISTS AssignedTask(taskId int primary key  AUTO_INCREMENT, employeeId int, assignName varchar(255), taskName varchar(255), findingNo int, masterMeetingId BIGINT, description varchar(255), estStartDate DATETIME, estEndDate DATETIME, taskStatus varchar(255), remarks varchar(255), transferTo int)";
		this.jdbcTemplate.update(query);
		System.out.println("create table AssignedTask query executed");
		logger.info("assignedtask table created");
	}

	

	public int save(AssignedTask assignedTask) {

		String query = "INSERT INTO AssignedTask (employeeId, assignName, taskName, findingNo, masterMeetingId, description, estStartDate, estEndDate, taskStatus, remarks, transferTo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		int update = this.jdbcTemplate.update(query,
				new Object[] { assignedTask.getEmployeeId(), assignedTask.getAssignName(), assignedTask.getTaskName(),
						assignedTask.getFindingNo(), assignedTask.getMasterMeetingId(), assignedTask.getDescription(),
						assignedTask.getEstStartDate(), assignedTask.getEstEndDate(),assignedTask.getTaskStatus(),
						assignedTask.getRemarks(), assignedTask.getTransferTo()});

		return update;
	}

	public int delete(int taskId) {

		String query = "delete from AssignedTask where taskId=" + taskId;
		int update = this.jdbcTemplate.update(query);

		return update;

	}

	
	/*
	 * //fetching the todays task deatils both upcoming and inprogress public
	 * List<AssignedTask> getTasksByUserIdAndTodaysinprogress(int userId) {
	 * 
	 * String query =
	 * "SELECT * FROM assignedtask WHERE taskStatus = ? AND employeeId = ? AND DATE(estStartDate) = DATE(NOW())"
	 * ;
	 * 
	 * 
	 * 
	 * return jdbcTemplate.query(query, preparedStatement -> {
	 * preparedStatement.setString(1, "inprogress"); preparedStatement.setInt(2,
	 * userId); }, new AssignedTaskMapper()); }
	 * 
	 * //fetching the todays task deatils both upcoming and inprogress public
	 * List<AssignedTask> getTasksByUserIdAndTodaysupcoming(int userId) {
	 * 
	 * String query =
	 * "SELECT * FROM assignedtask WHERE taskStatus = ? AND employeeId = ? AND DATE(estStartDate) = DATE(NOW())"
	 * ;
	 * 
	 * return jdbcTemplate.query(query, preparedStatement -> {
	 * preparedStatement.setString(1, "upcoming"); preparedStatement.setInt(2,
	 * userId); }, new AssignedTaskMapper()); }
	 */
 
	
	
	

	//sagarika new
	public List<AssignedTask> getTasksByUserIdAndInprogress(int userId) {
		
		String query = "SELECT * FROM assignedtask WHERE taskStatus = ? AND employeeId = ?";

		return jdbcTemplate.query(query, preparedStatement -> {
			preparedStatement.setString(1, "inprogress");
			preparedStatement.setInt(2, userId);
		}, new AssignedTaskMapper());


	}

	//Sagarika new
	public List<AssignedTask> getTasksByUserIdAndUpcoming(int userid) {

		String query = "SELECT * FROM assignedtask WHERE taskStatus = ? AND employeeId = ?";
		return jdbcTemplate.query(query, preparedStatement -> {
			preparedStatement.setString(1, "upcoming");
			preparedStatement.setInt(2, userid);
			//     preparedStatement.setString(3, taskname);
		}, new AssignedTaskMapper());  

	}
	


	public List<String> autocompleteTaskIds(String prefix, String estStartDate, String taskName, User user) {
		// String sql = "SELECT taskId FROM assignedtask WHERE employeeId = ?";
		
		String sql = "SELECT taskId FROM assignedtask where taskId is not null";
		
		if(!"admin".equalsIgnoreCase(user.getUserType()) ) {
			
			sql += " AND employeeId = ?";	
		}
		
		// Add conditions based on the input parameters
		if (!prefix.isEmpty()) {
			sql += " AND taskId LIKE ?";
		}

		if (!estStartDate.toString().isEmpty()) {
			sql += " AND estStartDate = ?";
		}

		if (!taskName.isEmpty()) {
			sql += " AND taskName = ?";
		}

		sql += " LIMIT 5";

		// Prepare wildcard prefix and other parameters
		String wildcardPrefix = prefix + "%";
		List<Object> params = new ArrayList<>();
		//params.add(employeeId);
		
		if(!"admin".equalsIgnoreCase(user.getUserType()) ) {
			params.add(user.getUserId());
		}

		if (!prefix.isEmpty()) {
			params.add(wildcardPrefix);
		}

		if (!estStartDate.toString().isEmpty()) {
			params.add(estStartDate);
		}

		if (!taskName.isEmpty()) {
			params.add(taskName);
		}

		return jdbcTemplate.queryForList(sql, String.class, params.toArray());
	}





	public List<String> autocompleteAgendas(String prefix, String estStartDate, String taskId, User user) {
	//	String sql = "SELECT  taskName FROM assignedtask WHERE employeeId = ?";

		String sql = "SELECT taskName FROM assignedtask where taskName is not null";
		if(!"admin".equalsIgnoreCase(user.getUserType()) ) {
			sql += " AND employeeId = ?";
		}
		

		if (!prefix.isEmpty()) {
			sql += " AND taskName LIKE ?";
		}

		if (!estStartDate.isEmpty()) {
			sql += " AND estStartDate = ?";
		}

		if (!taskId.isEmpty()) {
			sql += " AND taskId = ?";
		}

		sql += " LIMIT 5";
		String wildcardPrefix = prefix + "%";


		List<String> args = new ArrayList<>();
		//args.add(wildcardPrefix);
		if(!"admin".equalsIgnoreCase(user.getUserType()) ) {
			args.add(String.valueOf(user.getUserId()));
		}

		if (!prefix.isEmpty()) {
			args.add(wildcardPrefix);
		}

		if (!estStartDate.isEmpty()) {
			args.add(estStartDate);
		}

		if (!taskId.isEmpty()) {
			args.add(taskId);
		}

		return jdbcTemplate.queryForList(sql, String.class, args.toArray());
	}
	
	
	
	
	public List<AssignedTask> searchTasks(String taskId, String taskName, String estStartDate, User user) {
	    String sql = "SELECT * FROM assignedtask WHERE 1=1";
 
	    // Create a list to hold query parameters
	    List<Object> params = new ArrayList<>();
 
	    if (taskId != null && !taskId.isEmpty()) {
	        sql += " AND taskId = ?";
	        params.add(Integer.parseInt(taskId));
	    }
	    if (taskName != null && !taskName.isEmpty()) {
	        sql += " AND taskName = ?";
	        params.add(taskName);
	    }
	    if (estStartDate != null && !estStartDate.isEmpty()) {
	        sql += " AND DATE(estStartDate) = ?";
	        params.add(estStartDate);
	    }
 
	    // Add the condition to check usession user ID against empid
	    if(!"admin".equalsIgnoreCase(user.getUserType()) ) {
			sql += " AND employeeId = ?"; // Assuming 'empid' is the field in the database
			params.add(user.getUserId());
			}
 
	    // Execute the query with parameters using the assignedTaskMapper
	    List<AssignedTask> assignedTasks = jdbcTemplate.query(sql, params.toArray(), new AssignedTaskMapper());
 
	    return assignedTasks;
	}



	/*
	 * public List<AssignedTask> searchTasks(String taskId, String taskName, String
	 * estStartDate) { String sql = "SELECT * FROM assignedtask WHERE 1=1";
	 * 
	 * // Create a list to hold query parameters List<Object> params = new
	 * ArrayList<>();
	 * 
	 * if (taskId != null && !taskId.isEmpty()) { sql += " AND taskId = ?";
	 * params.add(Integer.parseInt(taskId)); } if (taskName != null &&
	 * !taskName.isEmpty()) { sql += " AND taskName = ?"; params.add(taskName); } if
	 * (estStartDate != null && !estStartDate.isEmpty()) { sql +=
	 * " AND estStartDate = ?"; params.add(estStartDate); }
	 * 
	 * // Execute the query with parameters using the assignedTaskMapper
	 * List<AssignedTask> assignedTasks = jdbcTemplate.query(sql, params.toArray(),
	 * new AssignedTaskMapper());
	 * 
	 * return assignedTasks; }
	 */
	
	
	//Mrutyunjay new	
	public boolean updateTask(AssignedTask updateTask)  {
			
			System.out.println("Updating the DAO function");
			String sql  = "UPDATE assignedtask SET employeeId = ?, assignName = ?, taskName = ?, findingNo = ?, masterMeetingId = ?, description = ?, estStartDate = ?, estEndDate = ?, taskStatus = ?, remarks = ?, transferTo=? where taskId=? ";
			int res=jdbcTemplate.update(sql,
					
					updateTask.getEmployeeId(),
					updateTask.getAssignName(),
					updateTask.getTaskName(),
					updateTask.getFindingNo(),
					updateTask.getMasterMeetingId(),
					updateTask.getDescription(),
					updateTask.getEstStartDate(),
					updateTask.getEstEndDate(),
					updateTask.getTaskStatus(),
					updateTask.getRemarks(),
					updateTask.getTransferTo(),
					updateTask.getTaskId()
					
					);		
			if(res>0)return true;
			else return false;
		}
	//Mrutyunjay new	
			public boolean transferTask(AssignedTask transferTask)  {
					
					System.out.println("Updating the DAO function");
					String sql  = "UPDATE assignedtask SET employeeId = ?, assignName = ?, remarks = ? where taskId=? ";
					int res=jdbcTemplate.update(sql,
							
							transferTask.getEmployeeId(),
							transferTask.getAssignName(),
							transferTask.getRemarks(),
							transferTask.getTaskId()
							
							);		
					if(res>0)return true;
					else return false;
				}
	//new Mrutyunjay
			public AssignedTask getTasksByTaskId(int taskId) {
	 
				String query = "SELECT * FROM assignedtask WHERE taskId = ?";
				return jdbcTemplate.queryForObject(query, new Object[] { taskId }, new AssignedTaskMapper());
	 
			}
	
	public  AssignedTask getTaskById(int tId) {
        System.out.println("jameela says hello");
        String sql = "SELECT * FROM assignedtask WHERE taskId = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{tId}, new AssignedTaskMapper());

    }
	
	
	 public boolean isAuthorizedToUpdateMeeting(String userSessionId) {
	        // Replace this SQL query with your actual database query
	        String sql = "SELECT COUNT(*) FROM assignedtask WHERE employeeId = ? AND employeeId = ?";

	        int count = jdbcTemplate.queryForObject(sql,Integer.class,userSessionId);

	        return count > 0;
	    }
	 
	 
	 
	 
	 
	 public AssignedTask getAssignedTaskById(String taskId) {

			String query = "select * from AssignedTask where taskId=" + taskId;
			List<AssignedTask> assignedTask = new ArrayList<>();
			assignedTask = this.jdbcTemplate.query(query, new AssignedTaskMapper());

			if (assignedTask.isEmpty()) {
				return null;
			}

			else {
				return assignedTask.get(0);
			}

		}
	 
	 
	 


		public boolean cancelTask(AssignedTask assignedTask) {
			try {
				String sql = "UPDATE assignedtask SET taskStatus = 'task canceled' WHERE taskId = ?";
				 Object[] params = new Object[] {
				 assignedTask.getTaskId()	 
				 };
				// logger.info("cancel task dao function");
				int rowsUpdated = jdbcTemplate.update(sql,params);

				return rowsUpdated > 0;
			} catch (Exception e) {
				// Handle exceptions or log errors if needed
				e.printStackTrace();
				return false;
			}
		}
		
		
		
		public List<AssignedTask> getTaskByIdHome(String meetingId) {
		    String query = "select * from assignedtask where taskId=?";
		    List<AssignedTask> task = jdbcTemplate.query(query, new Object[]{meetingId}, new AssignedTaskMapper());
			/*
			 * logger.info("Fetching task details by meeting id");
			 */		   
		    return task;
		}
	

		
		
		
		
		
}
