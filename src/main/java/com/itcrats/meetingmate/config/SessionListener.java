package com.itcrats.meetingmate.config;

//import javax.servlet.ServletContext;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebListener;
//import javax.servlet.http.HttpSessionEvent;
//import javax.servlet.http.HttpSessionListener;
//
//import org.springframework.context.annotation.Configuration;
//
////@Configuration
//@WebListener
//public class SessionListener implements HttpSessionListener {
//
//    @Override
//    public void sessionCreated(HttpSessionEvent event) {
//        System.out.println("session created");
//        event.getSession().setMaxInactiveInterval(15);
//    }
//    
//    public void onStartup(ServletContext servletContext) throws ServletException {
////        super.onStartup(servletContext);
//    	System.out.println("Session alive");
//        servletContext.addListener(new SessionListener());
//    }
//
//    @Override
//    public void sessionDestroyed(HttpSessionEvent event) {
//       System.out.println("session destroyed");
//    }
//}
