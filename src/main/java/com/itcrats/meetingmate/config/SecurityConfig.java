//package com.itcrats.meetingmate.config;
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//
//import com.itcrats.meetingmate.model.User;
//
//@SuppressWarnings("deprecation")
//@Configuration
//@EnableWebSecurity
//public class SecurityConfig extends WebSecurityConfigurerAdapter
//{
//	@Override
//	protected void configure(HttpSecurity http) throws Exception {
//		http.authorizeRequests().antMatchers("/test/**").permitAll();
//
//		http
//			.authorizeRequests()
//				.anyRequest().fullyAuthenticated()
//				.and().httpBasic()
//				.and().csrf().disable();	
//	}
//	
//	@Override
//    protected void configure(final AuthenticationManagerBuilder auth) throws Exception {
//		DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
//	    authProvider.setUserDetailsService(userDetailsService());
////	    authProvider.setPasswordEncoder(new BCryptPasswordEncoder());
//	    
//        auth.authenticationProvider(authProvider);
//    }
//	
//	/**
//	 * NOTICE: Credentials are whatever you want as long as the username & password are the same
//	 */
//	@Bean
//	public UserDetailsService userDetailsService() {
//		return new UserDetailsService() {
//
//			@SuppressWarnings("unused")
//			@Override
//			public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//				User user = new User(username, username);
//				user.setId((new AtomicInteger()).get());
//				
//				if (user != null) {
//					// Creates spring security User using CreditSesame user
//					return new org.springframework.security.core.userdetails.User(user.getUsername(),
//							user.getPassword(), true, true, true, true, AuthorityUtils.createAuthorityList("USER"));
//				}
//
//				throw new UsernameNotFoundException("Could not find any active user '" + username + "'");
//			}
//		};
//	}
//}
