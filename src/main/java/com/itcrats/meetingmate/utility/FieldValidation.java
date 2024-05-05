package com.itcrats.meetingmate.utility;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class FieldValidation 
{
    public boolean passwordValidation(String input)
    {
    	Pattern password=Pattern.compile("^(?=.*[a-zA-Z])(?=.*\\\\d)(?=.*[@$!%*#?&])[A-Za-z\\\\d@$!#%*?&]{8,16}$");
    	Matcher match=password.matcher(input);
    	return match.matches();
    }
    public boolean phoneNumberValidation(String input)
    {
    	Pattern password=Pattern.compile("((?=.*[0-9]).{10})");
    	Matcher match=password.matcher(input);
    	return match.matches();
    }
    public boolean OtpValidation(String input)
    {
    	Pattern password=Pattern.compile("((?=.*[0-9]).{6})");
    	Matcher match=password.matcher(input);
    	return match.matches();
    }
    public boolean emailValidation(String input)
    {
    	Pattern password=Pattern.compile("((?=.*[a-z])(?=.*[@]).{0,100})");
    	Matcher match=password.matcher(input);
    	return match.matches();
    }
}
