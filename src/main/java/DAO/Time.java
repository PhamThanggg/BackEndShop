package DAO;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import Model.Account;

public class Time {
	public static String timeNow() {
		LocalDateTime currentTime = LocalDateTime.now();
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YYYY-MM-dd HH:mm:ss");
	    String formattedDateTime = currentTime.format(formatter);
	    
	    return formattedDateTime;
	}
	
	public static Account getAcc(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Account accValue = (Account) session.getAttribute("acc");
        
        return accValue;
	}
}
