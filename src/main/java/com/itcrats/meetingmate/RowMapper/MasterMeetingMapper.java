package com.itcrats.meetingmate.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.itcrats.meetingmate.model.MasterMeeting;

public class MasterMeetingMapper implements RowMapper<MasterMeeting> {

	@Override
	public MasterMeeting mapRow(ResultSet rs, int rowNum) throws SQLException {

		MasterMeeting masterMeeting = new MasterMeeting();
		masterMeeting.setMId(rs.getInt("mId"));
		masterMeeting.setMeetingId(rs.getLong("meetingId"));
		masterMeeting.setSubject(rs.getString("subject"));
		masterMeeting.setAgenda(rs.getString("agenda"));
		masterMeeting.setScheduleStartDate(rs.getDate("scheduleStartDate").toLocalDate());
		masterMeeting.setScheduleEndDate(rs.getDate("scheduleEndDate").toLocalDate());
		masterMeeting.setScheduleStartTime(rs.getTime("scheduleStartTime").toLocalTime());
		masterMeeting.setScheduleEndTime(rs.getTime("scheduleEndTime").toLocalTime());
		masterMeeting.setMeetingStatus(rs.getString("meetingStatus"));
		masterMeeting.setVedioLink(rs.getString("videoLink"));
		masterMeeting.setOwnerId(rs.getInt("ownerId"));
		masterMeeting.setRecurrence(rs.getString("recurrence"));
		masterMeeting.setRecurrencePattern(rs.getString("recurrencePattern"));
		masterMeeting.setIsFollowupMeet(rs.getBoolean("isFollowupMeet"));
		masterMeeting.setMasterMeetingId(rs.getLong("masterMeetingId"));
		masterMeeting.setRemarks(rs.getString("remarks"));
	

		
		return masterMeeting;
	}

}
