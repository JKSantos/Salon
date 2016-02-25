package com.gss.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCConnection {
	
	public Connection getConnection(){
		
		String driverName = "com.mysql.jdbc.Driver";
	    String url = "jdbc:mysql://localhost:3306/dbsalonmanagement";
	    String username = "root";
	    String password = "root";
	    
	    try{
	    	Class.forName(driverName);
	    	
	    	Connection con = DriverManager.getConnection(url, username, password);
	    	
	    	return con;
	    }
	    catch(Exception e){
	    	//Error
	    	return null;
	    }
	}

}
