package com.itcrats.meetingmate.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Participate {


	private long meetingId; // dataType-long meetingid
	private int empId;  //empid
	private String empName; //empname
	private Boolean isActive; //active
	private String participantType; //n_H
	

	private String meetingOrganizer;
}
