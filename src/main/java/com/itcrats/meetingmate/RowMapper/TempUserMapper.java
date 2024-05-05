package com.itcrats.meetingmate.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.itcrats.meetingmate.model.TempUser;




/**
 * @author harsha chava
 */
public class TempUserMapper implements RowMapper<TempUser>  {

	@Override
	public TempUser mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		TempUser tempUser = new TempUser();
		
		tempUser.setEmpId(rs.getInt("empId"));
		tempUser.setEmailId(rs.getString("emailId"));
		tempUser.setPasscode(rs.getInt("passcode"));
		tempUser.setLocalDateTime(rs.getTimestamp("localDateTime").toLocalDateTime());
		return tempUser;
	}
	
	

}