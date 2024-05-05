package com.itcrats.meetingmate.model;

//import javax.validation.constraints.NotBlank;
//import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {

	private int userId; // id
	private String firstName; // firstname
	private String lastName; // lastname
	private String emailId; // emailid
//	@NotBlank(message=" * Password field can't be blank")
//	@Size(min=8,max=20,message=" * Crush name should have character between 3-15 ")
	private String password; // password
	private String mobileNo; // mobileno
	private String userType; // usertype
	private String userStatus; // userstatus

}
