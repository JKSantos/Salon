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
	
	 public Date convertToDate(String[] date){
		 
		 String month = "";
		 String day = date[1];
		 String year = date[2];
		 String newDate = year + "-";
		 
		 switch(date[0]){
		 	case "January": month = "1"; break;
		 	case "February": month = "2"; break;
		 	case "March": month = "3"; break;
		 	case "April": month = "4"; break;
		 	case "May": month = "5"; break;
		 	case "June": month = "6"; break;
		 	case "July": month = "7"; break;
		 	case "August": month = "8"; break;
		 	case "September": month = "9"; break;
		 	case "October": month = "10"; break;
		 	case "November": month = "11"; break;
		 	case "December": month = "12"; break;
		 }
		 
		 newDate += month + "-" + day;
		 Date converted = DateHelper.parseDate(newDate);
		 
		 return converted;
		 
	 }
	 
	 public String convert(String[] date){
		 
		 String month = "";
		 String day = date[1];
		 String year = date[2];
		 String newDate = year + "-";
		 
		 switch(date[0]){
		 	case "January": month = "1"; break;
		 	case "February": month = "2"; break;
		 	case "March": month = "3"; break;
		 	case "April": month = "4"; break;
		 	case "May": month = "5"; break;
		 	case "June": month = "6"; break;
		 	case "July": month = "7"; break;
		 	case "August": month = "8"; break;
		 	case "September": month = "9"; break;
		 	case "October": month = "10"; break;
		 	case "November": month = "11"; break;
		 	case "December": month = "12"; break;
		 }
		 
		 return newDate += month + "-" + day;
		 
	 }

}
