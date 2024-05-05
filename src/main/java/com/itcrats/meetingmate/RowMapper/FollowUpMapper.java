package com.itcrats.meetingmate.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.itcrats.meetingmate.model.FollowUp;

public class FollowUpMapper implements RowMapper<FollowUp> {

	@Override
	public FollowUp mapRow(ResultSet rs, int rowNum) throws SQLException {

		FollowUp followUp = new FollowUp();

		followUp.setFolllowupId(rs.getInt("followupId"));
		followUp.setMastermeetingid(rs.getLong("meetingId"));
		followUp.setRecurrence(rs.getString("recurrence"));
		followUp.setRecurrencePattern(rs.getString("recurrencePattern"));
//		followUp.setMeetingid(rs.getInt("meetingid"));
		followUp.setAgenda(rs.getString("agenda"));
		followUp.setScheduleDate(rs.getString("scheduleDate"));
		followUp.setActualDate(rs.getString("actualDate"));
		followUp.setStartedTime(rs.getString("startedTime"));
		followUp.setEndTime(rs.getString("endTime"));
		followUp.setMeetingStatus(rs.getString("meetingStatus"));
		followUp.setVedioLink(rs.getString("vedioLink"));

		return followUp;
	}

}
