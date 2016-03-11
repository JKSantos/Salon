package com.gss.utilities;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {

	 public void sendEmail(String emailAddress, String username, String password)
	   {    
	      String to = emailAddress;
	      String from = "";
	      
	      Properties props;
	      Session session = null;
	      
	      if(emailAddress.endsWith("@gmail.com")){
	      	 
	    	  String fromGmail = "salon.management.system@gmail.com";
	    	  from = fromGmail;
	    	  props = gmailConfiguration();
	    	  session = Session.getDefaultInstance(props,  
		        	    new javax.mail.Authenticator() {
		        	       protected PasswordAuthentication getPasswordAuthentication() {  
		        	       return new PasswordAuthentication(fromGmail,"salonsalon06");  
		        	   }});
	      
	      }
	      
	      else if(emailAddress.endsWith("@yahoo.com") && emailAddress.endsWith("@yahoo.com.ph")){
	    	 
	    	  String yahooMail = "labidabssy.jeffrey23@yahoo.com";
	    	  from = yahooMail;
	    	  props = yahooConfiguration();
	    	  session = Session.getDefaultInstance(props,  
		        	    new javax.mail.Authenticator() {
		        	       protected PasswordAuthentication getPasswordAuthentication() {  
		        	       return new PasswordAuthentication(yahooMail,"rEpLiCaTe6405021");  
		        	   }});
	      }

	        try {

	            MimeMessage message = new MimeMessage(session);
	            message.setFrom(new InternetAddress(from));
	            message.addRecipient(Message.RecipientType.TO,
	                new InternetAddress(to));

	            message.setSubject("From SalonManagementSystem");
	            message.setText("Hi! Youre Username is " + username + " and your pasword is " + password + ".");
	           Transport.send(message);

	           System.out.println("MESSAGE SUCCESSFULLY SENT....");
	        } catch (MessagingException mex) {
	           mex.printStackTrace();
	     }
	 }
	 
	 private static Properties gmailConfiguration() {
		    return new Properties() {
				private static final long serialVersionUID = 1L;
				{
					  put("mail.transport.protocol", "smtp");     
					  put("mail.host", "smtp.gmail.com");  
					  put("mail.smtp.auth", "true");  
					  put("mail.smtp.port", "465");  
					  put("mail.debug", "true");  
					  put("mail.smtp.socketFactory.port", "465");  
					  put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");  
					  put("mail.smtp.socketFactory.fallback", "false");
		        }
		    };
		 }
	 
	 private static Properties yahooConfiguration() {
		    return new Properties() {
				private static final long serialVersionUID = 1L;
				{
					  put("mail.transport.protocol", "smtp");     
					  put("mail.host", "smtp.mail.yahoo.com");  
					  put("mail.smtp.auth", "true");  
					  put("mail.smtp.port", "465");  
					  put("mail.debug", "true");  
					  put("mail.smtp.socketFactory.port", "465");  
					  put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");  
					  put("mail.smtp.socketFactory.fallback", "false");
		        }
		    };
		 }

}


 