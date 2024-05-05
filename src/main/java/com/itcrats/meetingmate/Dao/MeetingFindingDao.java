package com.itcrats.meetingmate.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.itcrats.meetingmate.RowMapper.MeetingFindingMapper;
import com.itcrats.meetingmate.model.MeetingFinding;


@Repository
public class MeetingFindingDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public void createMeetingFindingTable() {
		
		String query = "CREATE TABLE IF NOT EXISTS MeetingFinding(meetingfindingno int, meetingid BIGINT,taskname varchar(255), taskstartingdate varchar(255), taskEndingDate varchar(255), tasktype varchar(255))";
		this.jdbcTemplate.update(query);
		System.out.println("create table MeetingFinding query executed");
		
	}
	
	public MeetingFinding getMeetingFindingById(int meetingfindingno) {

		String query = "select * from MeetingFinding where id="+meetingfindingno;
		List<MeetingFinding> meetingFinding = new ArrayList<>();
		meetingFinding = this.jdbcTemplate.query(query, new MeetingFindingMapper());

		if(meetingFinding.isEmpty()) {
			return null;
		}
		
		else {
			return meetingFinding.get(0);
		}

	}
	
	public int save(MeetingFinding meetingFinding) {

		String query = "INSERT INTO MeetingFinding (meetingfindingno, taskname, taskstartingdate, taskEndingDate, tasktype, meetingid) VALUES (?, ?, ?, ?, ?, ?)";
		int update = this.jdbcTemplate.update(query,
				new Object[] { meetingFinding.getMeetingFindingNo(), meetingFinding.getTaskName(), meetingFinding.getTaskStartingDate(), meetingFinding.getTaskEndingDate(), meetingFinding.getTaskType(), meetingFinding.getMeetingId()});

		return update;
	}
	
	public int delete(int meetingfindingno) {

		String query = "delete from MeetingFinding where id="+meetingfindingno;
		int update = this.jdbcTemplate.update(query);

		return update;

	}
	
}
