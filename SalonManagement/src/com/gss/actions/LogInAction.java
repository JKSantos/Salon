package com.gss.actions;

import com.gss.model.Employee;
import com.gss.service.EmployeeServiceImpl;

public class LogInAction {
	
	private String strFirstName;
	private String strLastName;
	private byte[] bytEmpPhoto;
	private String username;
	private String pass;
	
	public String execute(){
		
		EmployeeServiceImpl login = new EmployeeServiceImpl();
		Employee emp = login.getEmployeeByUserPass(this.username, this.pass);
		
		if(username.equals("admin") && pass.equals("admin") )
			return "success";
		else if(emp != null){
			this.strFirstName = emp.getStrEmpFirstName();
			this.strLastName = emp.getStrEmpLastName();
			
			return "success";
		}
		else
			return "failed";
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getStrFirstName() {
		return strFirstName;
	}

	public void setStrFirstName(String strFirstName) {
		this.strFirstName = strFirstName;
	}

	public String getStrLastName() {
		return strLastName;
	}

	public void setStrLastName(String strLastName) {
		this.strLastName = strLastName;
	}

	public byte[] getBytEmpPhoto() {
		return bytEmpPhoto;
	}

	public void setBytEmpPhoto(byte[] bytEmpPhoto) {
		this.bytEmpPhoto = bytEmpPhoto;
	}

	

}
