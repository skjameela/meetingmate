package com.itcrats.meetingmate.controller;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

import org.apache.log4j.Logger;


/**
 * @author harsha chava
 */

public class MailAuthenticatorController extends Authenticator {
	
	final static Logger logger = Logger.getLogger(MailAuthenticatorController.class);

	private PasswordAuthentication authentication;


 

	public MailAuthenticatorController(String fromMail,String appPass) {
		String username = fromMail; 
		String password = appPass; //appPassword
		System.out.println(username+" "+password);
		authentication = new PasswordAuthentication(username, password);
		logger.info("authentication is"+authentication);
	}

 

	public PasswordAuthentication getPasswordAuthentication() {
		return authentication;
	}

 

}