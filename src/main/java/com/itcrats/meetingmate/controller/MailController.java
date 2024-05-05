package com.itcrats.meetingmate.controller;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;

/**
 * @author harsha chava
 */
public class MailController {
	
	final static Logger logger = Logger.getLogger(MailController.class);
	
	



	public static String generatePasscode(int length) {
        // Define characters allowed in the Passcode
        String allowedChars = "0123456789";

        // Create a random object
        Random random = new Random();

        // Create a StringBuilder to store the Passcode
        StringBuilder PasscodeBuilder = new StringBuilder(length);

        // Generate the Passcode by selecting random characters from allowedChars
        for (int i = 0; i < length; i++) {
            int randomIndex = random.nextInt(allowedChars.length());
            char randomChar = allowedChars.charAt(randomIndex);
            PasscodeBuilder.append(randomChar);
        }

        return PasscodeBuilder.toString();
    }
	
	
	


	
	public static void sendMail(String passcode,String toMail){

		

		String FromMail ="mishra.mrutyunjay@itcrats.com";

		String AppPass ="hlnfkknltsvdqstt";

		

		MailAuthenticatorController authenticator = new MailAuthenticatorController(FromMail,AppPass);

		Properties properties = System.getProperties();

		
		properties.put("mail.smtp.host","smtp.outlook.com");

		properties.put("mail.smtp.port", 587);

		properties.put("mail.smtp.secureConnection", false);

		properties.setProperty("mail.smtp.submitter",FromMail);

		properties.put("mail.smtp.auth", true);

		properties.put("mail.smtp.starttls.enable", true);

		logger.info("Connection was building to send mail to user with Host smtp.outlook.com  Host 587");



		Session session = Session.getInstance(properties, authenticator);

		session.setDebug(true);

		String lineSeperator = System.lineSeparator();

		String body = "Hello user"+lineSeperator+lineSeperator+"your passcode is "+passcode+lineSeperator+lineSeperator+"Regards"+lineSeperator+"Meetingmate-User";



		MimeMessage mimeMessage = new MimeMessage(session);

		boolean mailStatus = true;



		try {

			mimeMessage.setFrom(new InternetAddress(FromMail));

			mimeMessage.addRecipients(Message.RecipientType.TO, toMail);

			logger.info("Address was set for From Mail "+FromMail+" and To Mail "+toMail);



			mimeMessage.setSubject("MeetingMate-User Identification");

			mimeMessage.setContent(body, "text/plain");

			mailStatus = true;



			Transport.send(mimeMessage);

			if(mailStatus == false) {

				logger.info("Mail was not sent to user");

			}else {

				logger.info("Mail was sent succesfully to user with passcode with Mail Status "+mailStatus);

			}



		} catch (AddressException e) {

			mailStatus = false;

			logger.info("AddressException was raised with "+e+"/n Mail status set to "+mailStatus);

			e.printStackTrace();

		} catch (MessagingException e) {

			mailStatus = false;

			logger.info("MessagingException was raised with "+e+"/n Mail status set to "+mailStatus);

			e.printStackTrace();

		}

		

	}
	
	
	

}














