package com.itcrats.meetingmate.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.itcrats.meetingmate.RowMapper.TempUserMapper;
import com.itcrats.meetingmate.model.TempUser;

@Repository

/**
 * @author harsha chava
 */
public class TempUserDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

 

	// method written by harsha chava
	public void createTempUserTable() {

 

		String query = "CREATE TABLE IF NOT EXISTS TEMPUSER(empId int primary key,emailId  varchar(255),passcode int,localDateTime DATETIME ,unique (emailid) )";
		this.jdbcTemplate.update(query);
		System.out.println("create table tempquery executed");
	}

	// method written by harsha chava
	public int save(TempUser tempUser) {

		 

		String query = "INSERT INTO TEMPUSER (empId,emailId,passcode,localDateTime) VALUES (?,?,?,?)";

 

		int update = this.jdbcTemplate.update(query,
				new Object[] {tempUser.getEmpId(),tempUser.getEmailId(),tempUser.getPasscode(),tempUser.getLocalDateTime()});
		return update;
	}
	
	
	// method written by harsha chava
	public TempUser getTempUserById(int empId) {

 

		String query = "select * from TempUser where empId=" + empId;
		List<TempUser> tempUsers = new ArrayList<>();
		tempUsers = this.jdbcTemplate.query(query, new TempUserMapper());

 

		if (tempUsers.isEmpty()) {
			return null;
		} else {
			return tempUsers.get(0);
		}
	}
	
	// method written by harsha chava
	public int delete(int empId) {

		String query = "delete from TempUser where empId="+empId;
		int update = this.jdbcTemplate.update(query);

		return update;

	}
	

 



}


	

 

