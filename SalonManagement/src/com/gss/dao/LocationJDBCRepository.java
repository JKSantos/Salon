package com.gss.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
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


		Connection con = jdbc.getConnection();
		String query = "UPDATE tblLocation SET intLocationStatus = 1 WHERE intLocationID = ?";
		
		try{
			
			PreparedStatement pre = con.prepareStatement(query);
			pre.setInt(1, location.getIntLocationID());
	
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

	public List<Location> getAllLocation() {
		Connection con = jdbc.getConnection();
		String query = "SELECT * FROM tblLocation WHERE intLocationStatus = 1";
		
		List<Location> locationList = new ArrayList<Location>();
		
		try{
			
			PreparedStatement pre = con.prepareStatement(query);
			ResultSet result = pre.executeQuery();
			
			while(result.next()){
				
				int intID = result.getInt(1);
				String strName = result.getString(2);
				double price = result.getDouble(3);
				int status = result.getInt(4);
				
				Location location = new Location(intID, strName, price, status);
				locationList.add(location);
			}
			
			pre.close();
			con.close();
			
			return locationList;
		}
		catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}

}
