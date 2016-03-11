package com.gss.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import com.gss.connection.JDBCConnection;
import com.gss.model.Location;

public class LocationJDBCRepository implements LocationRepository{

	private JDBCConnection jdbc = new JDBCConnection();
	
	public boolean createLocation(Location location) {

		Connection con = jdbc.getConnection();
		String query = "CALL createLocation(?, ?)";
		
		try{
			
			PreparedStatement pre = con.prepareStatement(query);
			pre.setString(1, location.getStrLocationName());
			pre.setDouble(2, location.getDblLocationPrice());
			
			pre.execute();
			pre.close();
			con.close();
			
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	public boolean updateLocation(Location location) {
		Connection con = jdbc.getConnection();
		String query = "CALL updateLocation(?, ?)";
		
		try{
			
			PreparedStatement pre = con.prepareStatement(query);
			pre.setString(1, location.getStrLocationName());
			pre.setDouble(2, location.getDblLocationPrice());
			
			pre.execute();
			pre.close();
			con.close();
			
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	public boolean deactivateLocation(Location location) {
		// TODO Auto-generated method stub
		return false;
	}

	public List<Location> getAllLocation() {
		// TODO Auto-generated method stub
		return null;
	}

}
