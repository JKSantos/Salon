package com.gss.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gss.connection.JDBCConnection;
import com.gss.model.Service;

public class ServiceJDBCRepository implements ServiceRepository{

	@Override
	public List<Service> getAllService() {
		
		JDBCConnection jdbc = new JDBCConnection();
		Connection con = jdbc.getConnection();
		String strQuery1 = "CALL fetchServices()";
		String strQuery2 = "CALL fetchPrice(?)";
		List<Service> serviceList = new ArrayList<Service>();
		
		
		try{
			
			PreparedStatement pre = con.prepareStatement(strQuery1);
			ResultSet set = pre.executeQuery();
			ResultSet set2;
						
			while(set.next()){
				
				Service service;
				int intServiceID = set.getInt(1);
				String strServiceName = set.getString(2);
				String strServiceCate = set.getString(3);
				int intServiceStatus = set.getInt(4);
				String strServiceDesc = set.getString(5);
				byte[] actualPhoto = set.getBytes(6);
				String strPhotoPath = "";
				
				PreparedStatement pre2 = con.prepareStatement(strQuery2);
				pre2.setInt(1, intServiceID);
				
				set2 = pre2.executeQuery();
				
				while(set2.next()){
					double price = set2.getDouble(1);
					service = new Service(intServiceID, strServiceName, strServiceCate, intServiceStatus, strServiceDesc, actualPhoto, strPhotoPath);
					service.setDblServicePrice(price);
					serviceList.add(service);
					System.out.println(service.getIntServiceID() + "....");
				}
				
				pre2.close();
				set2.close();
			}
			
			set.close();
			pre.close();
			con.close();
			
			return serviceList;
		}
		catch(Exception e){
			
			System.out.println(e.fillInStackTrace());
			return null;
		}
	}

	@Override
	public boolean createService(Service service) {

		JDBCConnection jdbc = new JDBCConnection();
		Connection con = jdbc.getConnection();
		String strQuery1 = "CALL createService(?, ?, ?, ?, ?)";
		String strQuery2 = "CALL createServicePrice(?, ?)";
		int intServID = 0;
		
		try{
			
			File file = new File(service.getStrPhotoPath());
			FileInputStream fis = new FileInputStream(file);
			
			PreparedStatement pre1 = con.prepareStatement(strQuery1);
			
			pre1.setString(1, service.getStrServiceName());
			pre1.setString(2, service.getStrServiceCategory());
			pre1.setInt(3, service.getIntServiceStatus());
			pre1.setString(4, service.getStrServiceDesc());
			pre1.setBinaryStream(5, (InputStream)fis, (int)service.getStrPhotoPath().length());
			
			ResultSet set = pre1.executeQuery();
			while(set.next()){
				intServID = set.getInt(1);
			}
			pre1.close();
			
			PreparedStatement pre2 = con.prepareStatement(strQuery2);
			pre2.setInt(1, intServID);
			pre2.setDouble(2, service.getDblServicePrice());
			pre2.execute();
			pre2.close();
			con.close();
			
			return true;
		}
		catch(SQLException e){
			return false;
		}
		catch(NullPointerException a){
			return false;
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}

	@Override
	public boolean updateService(Service service) {
		
		String strQuery1 = "CALL updateService(?, ?, ?, ?, ?, ?)";
		String strQuery2 = "CALL updatePrice(?, ?)";
		JDBCConnection jdbc = new JDBCConnection();
		Connection con = jdbc.getConnection();
	
		
		try{
			
			File file = new File(service.getStrPhotoPath());
			FileInputStream fis = new FileInputStream(file);
			double price = 0.00;
			
			PreparedStatement pre1 = con.prepareStatement(strQuery1);
			pre1.setInt(1, service.getIntServiceID());
			pre1.setString(2, service.getStrServiceName());
			pre1.setString(3, service.getStrServiceCategory());
			pre1.setInt(4, service.getIntServiceStatus());
			pre1.setString(5, service.getStrServiceDesc());
			pre1.setBinaryStream(6, (InputStream)fis, (int)file.length());
			
			ResultSet set = pre1.executeQuery();
			
			while(set.next()){
				
				price = set.getDouble(1);
			}
			
			if(price != service.getDblServicePrice()){
				
				PreparedStatement pre2 = con.prepareStatement(strQuery2);
				pre2.setInt(1, service.getIntServiceID());
				pre2.setDouble(2, service.getDblServicePrice());
				pre2.execute();
				pre2.close();
				con.close();
				return true;
			}
			else{
				con.close();
				return true;
				
			}
		}
		catch(SQLException | FileNotFoundException e){
			
			System.out.println(e.getMessage() + " ...." + e.fillInStackTrace() );
			return false;
		}
	}

}
