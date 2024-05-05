package com.itcrats.meetingmate.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FollowUp {

	
	private int folllowupId;//folllowupid
//	private long meetingId;  // dataType-long
	private long mastermeetingid;//n_H
	private String recurrence;//n_H
	private String  recurrencePattern;//n_H
	private String agenda;//agenda
	private String scheduleDate;//scheduledate
	private String actualDate;//actualdate
	private String startedTime;//startedtime
	private String endTime;//endtime
	private String meetingStatus;//meetingstatus
	private String vedioLink;//vediolink
	
}
