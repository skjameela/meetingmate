package com.itcrats.meetingmate.model;


import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
/**
 * @author harsha chava
 */
public class TempUser {
	
	 private int empId;
	 private String emailId;
	 private int passcode;
	 private LocalDateTime localDateTime;
	 

}
