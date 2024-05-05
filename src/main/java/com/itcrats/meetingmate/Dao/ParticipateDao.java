package com.itcrats.meetingmate.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.itcrats.meetingmate.RowMapper.ParticipateMapper;
import com.itcrats.meetingmate.model.Participate;

@Repository
public class ParticipateDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	public void createParticipateTable() {

		 

		String query = "CREATE TABLE IF NOT EXISTS Participate(empId int, empName varchar(255),meetingOrganizer varchar(255), meetingId BIGINT, isActive varchar(255), participantType varchar(255))";
		this.jdbcTemplate.update(query);
		System.out.println("create table Participate query executed");

 

	}

 

	public Participate getParticipateById(int empId) {

 

 

		String query = "select * from Participate where empId="+empId;
		List<Participate> participate = new ArrayList<>();
		participate = this.jdbcTemplate.query(query, new ParticipateMapper());

 

 

		if(participate.isEmpty()) {
			return null;
		}

 

		else {
			return participate.get(0);
		}

 

 

	}

 

	public int save(Participate participate) {

 

 

		String query = "INSERT INTO Participate (empId, empName,meetingOrganizer,isActive, participantType, meetingId) VALUES (?,?, ?, ?, ?, ?)";
		int update = this.jdbcTemplate.update(query,
				new Object[] { participate.getEmpId(), participate.getEmpName(),participate.getMeetingOrganizer(),participate.getIsActive(), participate.getParticipantType(), participate.getMeetingId()});

 

 

		return update;
	}

 

	public int delete(int empId) {

 

 

		String query = "delete from Participate where empId="+empId;
		int update = this.jdbcTemplate.update(query);

 

 

		return update;

 

 

	}
	
	
	
	
	
	
	
}
