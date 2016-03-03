package com.gss.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.gss.connection.JDBCConnection;
import com.gss.model.Employee;
import com.gss.model.EmployeeCategory;
import com.gss.model.Job;
import com.gss.utilities.JobQualificationHelper;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.Connection;
public class EmployeeJDBCRepository implements EmployeeRepository{

	@Override
	public List<Employee> getAllEmployee() {
		
		String strQuery1 = "CALL getAllEmployee()";
		String strQuery2 = "CALL fetchJob(?)";
		JDBCConnection jdbc = new JDBCConnection();
		Connection con = jdbc.getConnection();
		List<Employee> empList = new ArrayList<Employee>();
		
		int intEmpID;
		String strJobDesc;
		String strEmpLastName;
		String strEmpFirstName;
		String strEmpMiddleName;
		Date datEmpBirthdate;
		String strEmpGender;
		String strEmpAddress;
		String strEmpContactNo;
		String strEmpStatus;
		String strEmpUsername;
		String strEmpPassword;
		String blobEmpPhoto;
		byte[] bytActualImage;
		List<Job> strJobQualification = new ArrayList<Job>();
		
		try{
			
			ResultSet set = null;
			Statement st = con.createStatement();
			
			set = st.executeQuery(strQuery1);
			
			while(set.next()){
				intEmpID = set.getInt(1);
				String job = set.getString(2);
				strEmpLastName = set.getString(3);
				strEmpFirstName = set.getString(4);
				strEmpMiddleName = set.getString(5);
				datEmpBirthdate = set.getDate(6);
				strEmpGender = set.getString(7);
				strEmpAddress = set.getString(8);
				strEmpContactNo = set.getString(9);
				strEmpStatus = set.getString(10);
				if(set.getString(11) == null){
					strEmpUsername = "NO ACCESS";
					strEmpPassword = "NO ACCESS";	
				}
				else
				{
					strEmpUsername = set.getString(11);
					strEmpPassword = set.getString(12);
				}
				
				blobEmpPhoto = "Empty";
				bytActualImage = set.getBytes(13);
				
				Employee emp = new Employee(intEmpID, strEmpLastName, strEmpFirstName, strEmpMiddleName, datEmpBirthdate, strEmpGender, strEmpAddress, strEmpContactNo, strEmpStatus, strEmpUsername, strEmpPassword, blobEmpPhoto, bytActualImage, job);
				
				empList.add(emp);
			}
			
			st.close();
			con.close();
			
			return empList;
		}
		catch(Exception e){
			
			System.out.print(e.getMessage());
			return null;
		}
	}

	@Override
	public Employee getEmployeeByUserPass(String username, String password) {
		
//		String strQuery1 = "CALL loginEmployee(?, ?)";
//		String strQuery2 = "CALL fetchJob(?)";
//		JDBCConnection jdbc = new JDBCConnection();
//		Connection con = jdbc.getConnection();
//		
//		Employee emp = null;
//		int intEmpID;
//		String strEmpLastName;
//		String strEmpFirstName;
//		String strEmpMiddleName;
//		Date datEmpBirthdate;
//		String strEmpGender;
//		String strEmpAddress;
//		String strEmpContactNo;
//		String strEmpStatus;
//		String strEmpUsername;
//		String strEmpPassword;
//		String blobEmpPhoto;
//		byte[] bytActualImage;
//		List<Job> strJobQualification = new ArrayList<Job>();
//		
//		
//		try{
//			PreparedStatement pre = con.prepareStatement(strQuery1);
//			pre.setString(1, username);
//			pre.setString(2, password);
//			
//			ResultSet set = pre.executeQuery();
//			System.out.print("Checking Account....");
//			
//			while(set.next()){
//				intEmpID = set.getInt(1);
//				strEmpLastName = set.getString(2);
//				strEmpFirstName = set.getString(3);
//				strEmpMiddleName = set.getString(4);
//				datEmpBirthdate = set.getDate(5);
//				strEmpGender = set.getString(6);
//				strEmpAddress = set.getString(7);
//				strEmpContactNo = set.getString(8);
//				strEmpStatus = set.getString(9);
//				strEmpUsername = set.getString(10);
//				strEmpPassword = set.getString(11);
//				blobEmpPhoto = "Empty";
//				bytActualImage = set.getBytes(12);
//				
//				emp = new Employee(intEmpID, strEmpLastName, strEmpFirstName, strEmpMiddleName, datEmpBirthdate, strEmpGender, strEmpAddress, strEmpContactNo, strEmpStatus, strEmpUsername, strEmpPassword, blobEmpPhoto, bytActualImage, strJobQualification);
//				System.out.println("Account found");
//			
//			}
//			
//			
//			System.out.print("Fetching jobs....");
//			
//			PreparedStatement pre2 = con.prepareStatement(strQuery2);
//			pre2.setInt(1, emp.getIntEmpID());
//			ResultSet set2 = pre2.executeQuery();
//				
//			while(set2.next()){
//				Job job = new Job(set2.getString(1), set2.getInt(2));
//				strJobQualification.add(job);
//			}
//			
//			emp.setStrJobQualification(strJobQualification);
//			System.out.println("jobs collected");
//			return emp;
//		}
//		catch(SQLException e){
//			System.out.println(e.getMessage());
//			return null;
//		}
//		catch(NullPointerException a){
//			return null;
//		}
		return null;
		
	}

	@Override
	public Employee getEmployeeByName() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean createEmployee(Employee emp) {
		
		String strQuery1 = "CALL `createEmp`(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		String strQuery2 = "CALL `createJobQualification`(?, ?);";
		
				
		JDBCConnection jdbc = new JDBCConnection();
		Connection con = jdbc.getConnection();
		int intEmpID = 0;
		
		try{
			java.sql.Date sqlDate = new java.sql.Date(emp.getDatEmpBirthdate().getTime());
			
			File imageFile = new File(emp.getBlobEmpPhoto());
			FileInputStream fileInput = new FileInputStream(imageFile);
			
			PreparedStatement pre = con.prepareStatement(strQuery1);
			pre.setString(1, emp.getStrJobQualification());
			pre.setString(2, emp.getStrEmpLastName());
			pre.setString(3, emp.getStrEmpFirstName());
			pre.setString(4, emp.getStrEmpMiddleName());
			pre.setDate(5, sqlDate);
			pre.setString(6, emp.getStrEmpGender());
			pre.setString(7, emp.getStrEmpAddress());
			pre.setString(8, emp.getStrEmpContactNo());
			pre.setString(9, emp.getStrEmpStatus());
			pre.setString(10, emp.getStrEmpUsername());
			pre.setString(11, emp.getStrEmpPassword());
			pre.setBinaryStream(12, (InputStream)fileInput, (int)imageFile.length());
			
			pre.executeQuery();
			pre.close();
			con.close();
			
			return true;
		}
		catch(SQLException | FileNotFoundException e){
			//Error
			System.out.print(e);
			
			return false;
		}
	}

	@Override
	public boolean updateEmployee(Employee emp) {
		
		String strQuery1 = "CALL updateEmployee(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
		String strQuery2 = "CALL createJobQualification(?, ?);";
		String strQuery3 = "CALL updateJobQualification(?, ?, ?);";
		
		JDBCConnection jdbc = new JDBCConnection();
		Connection con = jdbc.getConnection();
		int intEmpID = emp.getIntEmpID();
		List<Job> oldJobList = new ArrayList<Job>();
		
		try{
			java.sql.Date sqlDate = new java.sql.Date(emp.getDatEmpBirthdate().getTime());
			
			PreparedStatement pre = con.prepareStatement(strQuery1);
			
			System.out.println(emp.getBlobEmpPhoto() + " " + emp.getStrEmpGender());
			if(emp.getBlobEmpPhoto().equalsIgnoreCase("image")){
				pre.setInt(1, emp.getIntEmpID());
				pre.setString(2, emp.getStrJobQualification());
				pre.setString(3, emp.getStrEmpLastName());
				pre.setString(4, emp.getStrEmpFirstName());
				pre.setString(5, emp.getStrEmpMiddleName());
				pre.setDate(6, sqlDate);
				pre.setString(7, emp.getStrEmpGender());
				pre.setString(8, emp.getStrEmpAddress());
				pre.setString(9, emp.getStrEmpContactNo());
				pre.setString(10, emp.getStrEmpStatus());
				pre.setString(11, emp.getStrEmpUsername());
				pre.setString(12, emp.getStrEmpPassword());
				pre.setInt(13, 101);
			}
			else{
				
				File imageFile = new File(emp.getBlobEmpPhoto());
				FileInputStream fileInput = new FileInputStream(imageFile);
				
				pre.setInt(1, emp.getIntEmpID());
				pre.setString(2, emp.getStrJobQualification());
				pre.setString(3, emp.getStrEmpLastName());
				pre.setString(4, emp.getStrEmpFirstName());
				pre.setString(5, emp.getStrEmpMiddleName());
				pre.setDate(6, sqlDate);
				pre.setString(7, emp.getStrEmpGender());
				pre.setString(8, emp.getStrEmpAddress());
				pre.setString(9, emp.getStrEmpContactNo());
				pre.setString(10, emp.getStrEmpStatus());
				pre.setString(11, emp.getStrEmpUsername());
				pre.setString(12, emp.getStrEmpPassword());
				pre.setBinaryStream(13, (InputStream)fileInput, (int)imageFile.length());
			}
			
			ResultSet set = pre.executeQuery();
			while(set.next()){
				String strJobDesc = set.getString(1);
				int strJobStatus = set.getInt(2);
				Job job = new Job(strJobDesc, strJobStatus);
				oldJobList.add(job);
			}
			pre.close();
			con.close();
			
			return true;
		}
		catch(Exception e){
			System.out.print(e.getMessage());
			return false;
		}
	}

	@Override
	public List<EmployeeCategory> getAllCategory() {
		
		JDBCConnection jdbc = new JDBCConnection();
		Connection con = jdbc.getConnection();
		String query = "SELECT * FROM tblJob;";
		List<EmployeeCategory> empCategory = new ArrayList<EmployeeCategory>();
		
		try{
			
			PreparedStatement pre = con.prepareStatement(query);
			ResultSet set = pre.executeQuery();
			
			while(set.next()){
				String strID = String.valueOf(set.getInt(1));
				String strName = set.getString(2);
				
				EmployeeCategory cate = new EmployeeCategory(strID, strName);
				
				empCategory.add(cate);
			}
			
			pre.close();
			set.close();
			con.close();
			
			return empCategory;
			
		}
		catch(Exception e){
			System.out.println(e.fillInStackTrace());
			return null;
		}
	}

	@Override
	public List<Job> getEmployeeJob(int empID) {
		
		JDBCConnection jdbc = new JDBCConnection();
		Connection con = jdbc.getConnection();
		String query = "CALL getEmpJob(?);";
		List<Job> empJob = new ArrayList<Job>();
		
		try{
			PreparedStatement pre = con.prepareStatement(query);
			pre.setInt(1, empID);
			ResultSet set = pre.executeQuery();
			
			while(set.next()){
				String strDesc = set.getString(1);
				int intStat = set.getInt(2);
				Job job = new Job(strDesc, intStat);
				empJob.add(job);
			}
			
			pre.close();
			set.close();
			con.close();
			
			return empJob;
		}
		catch(Exception e){
			System.out.println(e.fillInStackTrace());
			return null;
		}
	}

	@Override
	public boolean deactivateEmployee(int empID) {
		
		JDBCConnection jdbc = new JDBCConnection();
		Connection con = jdbc.getConnection();
		String query = "CALL deactivateEmployee(?)";
		
		try{
			
			PreparedStatement pre = con.prepareStatement(query);
			pre.setInt(1, empID);
			
			pre.executeQuery();
			pre.close();
			con.close();
			
			return true;
		}
		catch(Exception e){
			System.out.print(e.fillInStackTrace());
			return false;
		}
	}

}
