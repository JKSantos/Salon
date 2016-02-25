package com.gss.utilities;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateHelper {
	
	 public static Date parseDate(String date) {
	     try {
	         return new SimpleDateFormat("yyyy-mm-dd").parse(date);
	     } catch (ParseException e) {
	         return null;
	     }
	  }

}
