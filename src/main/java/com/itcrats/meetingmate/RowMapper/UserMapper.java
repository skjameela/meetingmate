package com.itcrats.meetingmate.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.itcrats.meetingmate.model.User;

public class UserMapper implements RowMapper<User>  {

	@Override
	public User mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		User user = new User();
		user.setUserId(rs.getInt("userId"));
		
		user.setEmailId(rs.getString("emailId"));
		user.setFirstName(rs.getString("firstName"));
		user.setLastName(rs.getString("lastName"));
		user.setMobileNo(rs.getString("mobileNo"));
		user.setPassword(rs.getString("password"));
		user.setUserType(rs.getString("userType"));
		user.setUserStatus(rs.getString("userStatus"));
		return user;
	}
	
	

}
