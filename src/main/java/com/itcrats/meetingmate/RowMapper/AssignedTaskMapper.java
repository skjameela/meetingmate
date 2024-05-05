package com.itcrats.meetingmate.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.itcrats.meetingmate.model.AssignedTask;

public class AssignedTaskMapper implements RowMapper<AssignedTask> {

	@Override
	public AssignedTask mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		AssignedTask assignedTask = new AssignedTask();
		
		assignedTask.setTaskId(rs.getInt("taskId"));
		assignedTask.setEmployeeId(rs.getInt("employeeId"));
		assignedTask.setAssignName(rs.getString("assignName"));
		assignedTask.setTaskName(rs.getString("taskName"));
		assignedTask.setFindingNo(rs.getInt("findingNo"));
		assignedTask.setMasterMeetingId(rs.getLong("masterMeetingId"));
		assignedTask.setDescription(rs.getString("description"));
		
		assignedTask.setEstStartDate(rs.getTimestamp("estStartDate").toLocalDateTime());
		assignedTask.setEstEndDate(rs.getTimestamp("estEndDate").toLocalDateTime());
				
		assignedTask.setTaskStatus(rs.getString("taskStatus"));
		assignedTask.setRemarks(rs.getString("remarks"));
		assignedTask.setTransferTo(rs.getInt("transferTo"));

		return assignedTask;
	}
	
}
