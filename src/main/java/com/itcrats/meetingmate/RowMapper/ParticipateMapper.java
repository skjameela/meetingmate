package com.itcrats.meetingmate.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.itcrats.meetingmate.model.Participate;

public class ParticipateMapper implements RowMapper<Participate> {
	
	@Override
	public Participate mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		Participate participate = new Participate();
		participate.setEmpId(rs.getInt("empId"));
		participate.setEmpName(rs.getString("empName"));
		participate.setIsActive(rs.getBoolean("isActive"));
		participate.setMeetingId(rs.getLong("meetingId"));
		participate.setParticipantType(rs.getString("userStatus"));
		participate.setParticipantType(rs.getString("meetingOrganizer"));
      
		
		return participate;
	}

}
