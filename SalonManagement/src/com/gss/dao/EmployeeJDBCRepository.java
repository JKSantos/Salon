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
		
		String strQuery1 = "SELECT * FROM tblEmployee;";
		String strQuery2 = "CALL fetchJob(?)";
		JDBCConnection jdbc = new JDBCConnection();
		Connection con = jdbc.getConnection();
		List<Employee> empList = new ArrayList<Employee>();
		
		int intEmpID;
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
				strEmpLastName = set.getString(2);
				strEmpFirstName = set.getString(3);
				strEmpMiddleName = set.getString(4);
				datEmpBirthdate = set.getDate(5);
				strEmpGender = set.getString(6);
				strEmpAddress = set.getString(7);
				strEmpContactNo = set.getString(8);
				strEmpStatus = set.getString(9);
				strEmpUsername = set.getString(10);
				strEmpPassword = set.getString(11);
				blobEmpPhoto = "Empty";
				bytActualImage = set.getBytes(12);
					
				PreparedStatement pre2 = con.prepareStatement(strQuery2);
				pre2.setInt(1, intEmpID);
				ResultSet set2 = pre2.executeQuery();
					
				while(set2.next()){
					Job job = new Job(set2.getString(1), set2.getInt(2));
					strJobQualification.add(job);
				}
				
				Employee emp = new Employee(intEmpID, strEmpLastName, strEmpFirstName, strEmpMiddleName, datEmpBirthdate, strEmpGender, strEmpAddress, strEmpContactNo, strEmpStatus, strEmpUsername, strEmpPassword, blobEmpPhoto, bytActualImage, strJobQualification);
				
				emp.setStrJobQualification(strJobQualification);
				
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
		
		String strQuery1 = "CALL loginEmployee(?, ?)";
		String strQuery2 = "CALL fetchJob(?)";
		JDBCConnection jdbc = new JDBCConnection();
		Connection con = jdbc.getConnection();
		
		Employee emp = null;
		int intEmpID;
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
			PreparedStatement pre = con.prepareStatement(strQuery1);
			pre.setString(1, username);
			pre.setString(2, password);
			
			ResultSet set = pre.executeQuery();
			System.out.print("Checking Account....");
			
			while(set.next()){
				intEmpID = set.getInt(1);
				strEmpLastName = set.getString(2);
				strEmpFirstName = set.getString(3);
				strEmpMiddleName = set.getString(4);
				datEmpBirthdate = set.getDate(5);
				strEmpGender = set.getString(6);
				strEmpAddress = set.getString(7);
				strEmpContactNo = set.getString(8);
				strEmpStatus = set.getString(9);
				strEmpUsername = set.getString(10);
				strEmpPassword = set.getString(11);
				blobEmpPhoto = "Empty";
				bytActualImage = set.getBytes(12);
				
				emp = new Employee(intEmpID, strEmpLastName, strEmpFirstName, strEmpMiddleName, datEmpBirthdate, strEmpGender, strEmpAddress, strEmpContactNo, strEmpStatus, strEmpUsername, strEmpPassword, blobEmpPhoto, bytActualImage, strJobQualification);
				System.out.println("Account found");
			
			}
			
			
			System.out.print("Fetching jobs....");
			
			PreparedStatement pre2 = con.prepareStatement(strQuery2);
			pre2.setInt(1, emp.getIntEmpID());
			ResultSet set2 = pre2.executeQuery();
				
			while(set2.next()){
				Job job = new Job(set2.getString(1), set2.getInt(2));
				strJobQualification.add(job);
			}
			
			emp.setStrJobQualification(strJobQualification);
			System.out.println("jobs collected");
			return emp;
		}
		catch(SQLException e){
			System.out.println(e.getMessage());
			return null;
		}
		catch(NullPointerException a){
			return null;
		}
		
	}

	@Override
	public Employee getEmployeeByName() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean createEmployee(Employee emp) {
		
		String strQuery1 = "CALL `createEmp`(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		String strQuery2 = "CALL `createJobQualification`(?, ?);";
		
		List<Job> jobList = emp.getStrJobQualification();
		System.out.println(emp.getStrJobQualification().size());
		
				
		JDBCConnection jdbc = new JDBCConnection();
		Connection con = jdbc.getConnection();
		int intEmpID = 0;
		
		try{
			java.sql.Date sqlDate = new java.sql.Date(emp.getDatEmpBirthdate().getTime());
			
			File imageFile = new File(emp.getBlobEmpPhoto());
			FileInputStream fileInput = new FileInputStream(imageFile);
			
			PreparedStatement pre = con.prepareStatement(strQuery1);
			pre.setString(1, emp.getStrEmpLastName());
			pre.setString(2, emp.getStrEmpFirstName());
			pre.setString(3, emp.getStrEmpMiddleName());
			pre.setDate(4, sqlDate);
			pre.setString(5, emp.getStrEmpGender());
			pre.setString(6, emp.getStrEmpAddress());
			pre.setString(7, emp.getStrEmpContactNo());
			pre.setString(8, emp.getStrEmpStatus());
			pre.setString(9, emp.getStrEmpUsername());
			pre.setString(10, emp.getStrEmpPassword());
			pre.setBinaryStream(11, (InputStream)fileInput, (int)imageFile.length());
			
			ResultSet set = pre.executeQuery();
			while(set.next())
				intEmpID = set.getInt(1);
			pre.close();
			
			for(int intCtr = 0; intCtr < jobList.size(); intCtr++){
				
				PreparedStatement pre2 = con.prepareStatement(strQuery2);
				pre2.setInt(1, intEmpID);
				pre2.setString(2, jobList.get(intCtr).getStrJobDesc());
				
				pre2.execute();
				pre2.close();
			}
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
		
		String strQuery1 = "CALL updateEmployee(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
		String strQuery2 = "CALL createJobQualification(?, ?);";
		String strQuery3 = "CALL updateJobQualification(?, ?, ?);";
		
		JDBCConnection jdbc = new JDBCConnection();
		Connection con = jdbc.getConnection();
		int intEmpID = emp.getIntEmpID();
		List<Job> oldJobList = new ArrayList<Job>();
		
		try{
			java.sql.Date sqlDate = new java.sql.Date(emp.getDatEmpBirthdate().getTime());
			
			File imageFile = new File(emp.getBlobEmpPhoto());
			FileInputStream fileInput = new FileInputStream(imageFile);
			
			PreparedStatement pre = con.prepareStatement(strQuery1);
			
			if(emp.getBlobEmpPhoto().equals("Image")){
				pre.setInt(1, emp.getIntEmpID());
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
				pre.setInt(11, 101);
			}
			else{
				pre.setInt(1, emp.getIntEmpID());
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
				pre.setBinaryStream(11, (InputStream)fileInput, (int)imageFile.length());
			}
			
			ResultSet set = pre.executeQuery();
			while(set.next()){
				String strJobDesc = set.getString(1);
				int strJobStatus = set.getInt(2);
				Job job = new Job(strJobDesc, strJobStatus);
				oldJobList.add(job);
			}
			
			JobQualificationHelper helper = new JobQualificationHelper();
			List<String[]> finalJobList = helper.checkChanges(emp.getStrJobQualification(), oldJobList);
			pre.close();
		
			for(int intCtr = 0; intCtr < finalJobList.size() ; intCtr++){
				
				String[] newJob = finalJobList.get(intCtr);
				System.out.print("Checking " + newJob[1] + " job");
				
				if(newJob[0].equals("same")){
					//do nothing
					System.out.println("\t...No Changes Detected");
				}
				else if(newJob[0].equals("update")){
					PreparedStatement pre2 = con.prepareStatement(strQuery3);
					pre2.setInt(1, intEmpID);
					pre2.setString(2, newJob[1]);
					pre2.setString(3, newJob[2]);
					
					System.out.println("\t...Updating " + newJob[1] + "....\n");
					pre2.execute();
					pre2.close();
				}
				else{
					PreparedStatement pre2 = con.prepareStatement(strQuery2);
					pre2.setInt(1, intEmpID);
					pre2.setString(2, newJob[1]);
					System.out.println("\t...Adding " + newJob[1] + "....\n");
					pre2.execute();
					pre2.close();
				}
				
				
			}

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

}
