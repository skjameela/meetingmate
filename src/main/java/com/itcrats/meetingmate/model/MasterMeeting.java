package com.itcrats.meetingmate.model;

import java.time.LocalDate;
import java.time.LocalTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MasterMeeting {
	
	private int mId;
	private long meetingId; //dataType- long meetingid 
	private int ownerId;  //n_H empid
	private String subject;
	private String agenda;  //agenda
	private String recurrence; //n_H
	private String  recurrencePattern; //n_H
	private LocalDate scheduleStartDate;  //scheduledate
	private LocalDate scheduleEndDate;  //scheduledate
	private LocalTime scheduleStartTime;  //startedtime
	private LocalTime scheduleEndTime;  //endtime
	private String meetingStatus;  //meetingstatus
	private String vedioLink;  //vediolink
	private Boolean isFollowupMeet; //n_H isfollowupmeet
	private long masterMeetingId; //n_H mastermeetingid
	private String remarks;


	
	
	
	
}
