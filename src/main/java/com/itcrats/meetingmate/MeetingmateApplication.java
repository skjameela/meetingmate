package com.itcrats.meetingmate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.server.WebServerFactoryCustomizer;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.Bean;

import com.itcrats.meetingmate.Dao.AssignedTaskDao;
import com.itcrats.meetingmate.Dao.FollowUpDao;
import com.itcrats.meetingmate.Dao.MasterMeetingDao;
import com.itcrats.meetingmate.Dao.MeetingFindingDao;
import com.itcrats.meetingmate.Dao.ParticipateDao;
import com.itcrats.meetingmate.Dao.TempUserDao;
import com.itcrats.meetingmate.Dao.UserDao;

@ServletComponentScan
@SpringBootApplication
//@ComponentScan(basePackages="com.itcrats.meetingmate")
public class MeetingmateApplication implements CommandLineRunner {
	
	@Autowired
	private UserDao  userDao ;
	
	@Autowired
	private AssignedTaskDao assignedTaskDao;
	
	@Autowired
	private FollowUpDao followUpDao;
	
	@Autowired
	private MasterMeetingDao masterMeetingDao;
	
	@Autowired
	private MeetingFindingDao meetingFindingDao;
	
	@Autowired
	private ParticipateDao participateDao;
	
	@Autowired
	private TempUserDao tempUserDao;
	
	
	


	public static void main(String[] args) {
		SpringApplication.run(MeetingmateApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		// TODO Auto-generated method stub
		this.assignedTaskDao.createAssignedTaskTable();
		this.followUpDao.createFollowUpTable();
		this.masterMeetingDao.createMasterMeetingTable();
		this.meetingFindingDao.createMeetingFindingTable();
		this.participateDao.createParticipateTable();
		this.userDao.createUserTable();
		this.tempUserDao.createTempUserTable();
	}
	
	@Bean
	public WebServerFactoryCustomizer<TomcatServletWebServerFactory> sessionManagerCustomizer() {

	        TomcatServletWebServerFactory factory = new TomcatServletWebServerFactory();

	        return server -> server.addContextCustomizers(context -> context.setSessionTimeout(24 * 60));

	}

}
