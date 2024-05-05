package com.itcrats.meetingmate.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MeetingFinding {

	
	private int meetingFindingNo; //meetingfindingno
	private String taskName; //taskname
	private long meetingId;  // dataType-long meetingid
	private String taskStartingDate;  //taskstartingdate
	private String taskEndingDate;  //taskEndingDate
	private String taskType;  //tasktype
	
	
	
}
