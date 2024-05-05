package com.itcrats.meetingmate.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.itcrats.meetingmate.RowMapper.FollowUpMapper;
import com.itcrats.meetingmate.model.FollowUp;

@Repository
public class FollowUpDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void createFollowUpTable() {

		String query = "CREATE TABLE IF NOT EXISTS FollowUp(followupid int primary key auto_increment, mastermeetingid BIGINT,recurrence varchar(255),recurrencePattern varchar(255), agenda varchar(255), scheduledate varchar(255), actualdate varchar(255), startedtime varchar(255), endtime varchar(255), meetingstatus varchar(255), videolink varchar(255))";
		this.jdbcTemplate.update(query);
		System.out.println("create table FollowUp query executed");

	}

	

	public FollowUp getFollowUpById(int followupId) {

		String query = "select * from FollowUp where id="+followupId;
		List<FollowUp> followUp = new ArrayList<>();
		followUp = this.jdbcTemplate.query(query, new FollowUpMapper());
		if(followUp.isEmpty()) {
			return null;
		}
		else {
			return followUp.get(0);
		}
	}

	

	public int save(FollowUp followUp) {

		String query = "INSERT INTO FollowUp (agenda,recurrence,recurrencePattern, scheduledate, actualdate, startedtime, endtime, meetingstatus, videolink, mastermeetingid) VALUES (?, ?, ?, ?, ?, ?, ?, ?,?,?)";
		int update = this.jdbcTemplate.update(query,
				new Object[] { followUp.getAgenda(),followUp.getRecurrence(),followUp.getRecurrencePattern(), followUp.getScheduleDate(), followUp.getActualDate(), followUp.getStartedTime(), followUp.getEndTime(), followUp.getMeetingStatus(), followUp.getVedioLink(), followUp.getMastermeetingid()});
		return update;

	}

	

	public int delete(int followupId) {

		String query = "delete from FollowUp where id="+followupId;
		int update = this.jdbcTemplate.update(query);
		return update;
	}
}
