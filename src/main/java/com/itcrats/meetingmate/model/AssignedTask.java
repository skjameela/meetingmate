package com.itcrats.meetingmate.model;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AssignedTask {

	private int taskId; 
	private int employeeId;
	private String assignName;
	private String taskName;
	private int findingNo;
	private long masterMeetingId;
	private String description;
	private LocalDateTime estStartDate;
	private LocalDateTime estEndDate;
	private String taskStatus;
	private String remarks;
	private int transferTo;
		
	
}
