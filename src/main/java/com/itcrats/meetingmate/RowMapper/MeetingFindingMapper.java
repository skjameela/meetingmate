package com.itcrats.meetingmate.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.itcrats.meetingmate.model.MeetingFinding;

public class MeetingFindingMapper implements RowMapper<MeetingFinding> {

	@Override
	public MeetingFinding mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		MeetingFinding meetingFinding = new MeetingFinding();
		
		meetingFinding.setMeetingFindingNo(rs.getInt("meetingFindingNo"));
		meetingFinding.setTaskName(rs.getString("taskName"));
		meetingFinding.setTaskStartingDate(rs.getString("taskStartingDate"));
		meetingFinding.setTaskEndingDate(rs.getString("taskEndingDate"));
		meetingFinding.setTaskType(rs.getString("taskType"));
		meetingFinding.setMeetingId(rs.getLong("meetingId"));
		
		
		return meetingFinding;
	}
	
}
