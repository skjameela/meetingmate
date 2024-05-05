package com.itcrats.meetingmate.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.itcrats.meetingmate.RowMapper.UserMapper;
import com.itcrats.meetingmate.model.User;

@Repository
public class UserDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void createUserTable() {

		String query = "CREATE TABLE IF NOT EXISTS USER(userid int primary key auto_increment,emailid varchar(255), firstname varchar(255), lastname varchar(255), mobileno varchar(255), password varchar(255),usertype varchar(255),userstatus varchar(255))";
		this.jdbcTemplate.update(query);
		System.out.println("create table user query executed");
	}

	public int save(User user) {

		String query = "INSERT INTO USER (emailid, firstname, lastname, mobileno, password,usertype,userstatus) VALUES (?, ?, ?, ?, ?, ?,)";

		int update = this.jdbcTemplate.update(query,
				new Object[] {user.getEmailId(), user.getFirstName(), user.getLastName(),
						user.getMobileNo(), user.getPassword(), "user","inactive" });
		return update;
	}
	
	
	public boolean getUserByEmailId(String emailid)
	{
		
		String query="select count(*) from user where emailid="+emailid;
		int update=this.jdbcTemplate.update(query,emailid);
		if(update==1)
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	public User getUserByEmailIdAndPassword(String emailid, String password) {

		String query = "select * from User where emailid='" + emailid + "' and password='" + password+"'" ;
		List<User> users = this.jdbcTemplate.query(query, new UserMapper());
		if (users.size() == 0) {
			return null;
		} else {
			return users.get(0);
		}
	}

	public int savePassword(String password,String employeeId) { //n_H

		String query = "UPDATE User SET password = ? WHERE id = ?";
		return jdbcTemplate.update(query, password,employeeId);

		}
public User getUserByEmailIdAndPhone(String emailid, String phoneNo) {

String query = "select * from User where emailid='"+emailid+"' and mobileno='"+phoneNo+"'";
List<User> users = new ArrayList<>();
users = this.jdbcTemplate.query(query, new UserMapper());
if(users.isEmpty()) {
return null;
}

else {
return users.get(0);
}
}

	public List<User> getAllUser() {

		String query = "select * from User";
		List<User> users = new ArrayList<>();
		users = this.jdbcTemplate.query(query, new UserMapper());
		return users;
	}

	public User getUserById(int userId) {

		String query = "select * from User where userid=" + userId;
		List<User> users = new ArrayList<>();
		users = this.jdbcTemplate.query(query, new UserMapper());

		if (users.isEmpty()) {
			return null;
		} else {
			return users.get(0);
		}
	}
	public int saveUpdate(String emailid, String phoneNo, String password) {

		String query = "UPDATE User SET password = ? WHERE emailid = ? AND mobileno = ?";

		return jdbcTemplate.update(query, password, emailid, phoneNo);

		}
	public int saveUpdatePassword(String emailid, String password) {

		String query = "UPDATE User SET password = ? WHERE emailid = ?";

		return jdbcTemplate.update(query, password, emailid);

		}
	public int saveUpdateStatus(String userStatus,String emailid) {

		String query = "UPDATE User SET userstatus = ? WHERE emailid = ?";
		return jdbcTemplate.update(query, userStatus,emailid);
	}
	public boolean isEmailExists(String email) {

		String query = "SELECT COUNT(*) FROM user WHERE emailid = ?";


		int count = jdbcTemplate.queryForObject(query, Integer.class, email);



		return count > 0;

	}
	public List<String> autocompleteEmployeeIds(String prefix) {

	    String sql = "SELECT UserId FROM user WHERE UserId LIKE ? LIMIT 5";

	    String wildcardPrefix = prefix + "%";

	    // Add the '%' wildcard to match any characters after the prefix

	    return jdbcTemplate.queryForList(sql, String.class, wildcardPrefix);

 

	}

	

	public List<String> autocompleteEmployeeName(String prefix1) {

	    String sql = "SELECT firstname FROM user WHERE firstname LIKE ? LIMIT 5";

	    String wildcardPrefix = prefix1 + "%";

	    // Add the '%' wildcard to match any characters after the prefix

	    return jdbcTemplate.queryForList(sql, String.class, wildcardPrefix);

 

	}
	
	
	
	
	// method created  by harsha chava

		public User getUserByIdUsingName(String fullName) {

	 

			String query = "SELECT * FROM User WHERE CONCAT(firstName,' ',lastName) = '" + fullName + "'";

			System.out.println(query);

			List<User> users = new ArrayList<>();

			users = this.jdbcTemplate.query(query, new UserMapper());

	 

			if (users.isEmpty()) {

				return null;

			} else {

				return users.get(0);

			}

		}

		

		// method created  by harsha chava

		public int savePassword(String password,int employeeId) { //n_H

	 

			String query = "UPDATE User SET password = ? WHERE userId = ?";

			return jdbcTemplate.update(query, password,employeeId);

	 

			}
}
