package com.gss.actions;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.gss.model.Employee;
import com.gss.model.Job;
import com.gss.service.EmployeeServiceImpl;
import com.gss.utilities.DateHelper;
import com.opensymphony.xwork2.ActionSupport;

public class CreateEmployeeAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	private String strEmpLastName;
	private String strEmpFirstName;
	private String strEmpMiddleName;
	private String strMonth;
	private String strDay;
	private String strYear;
	private Date datEmpBirthdate;
	private String strEmpGender;
	private String strEmpAddress;
	private String strEmpContactNo;
	private String strEmpStatus;
	private String strEmpUsername;
	private String strEmpPassword;
	private String strEmpBirthdate;
	private File file;
	private String contentType;
	private String filename;
	private String selectedJob;
	private boolean grantAccess;
	
	public String execute(){
		
		String strBirthDate = null;
		String path = file.getAbsolutePath();
		EmployeeServiceImpl empService;
		Employee emp;
		
		System.out.println(selectedJob);
		
		//strBirthDate = strYear + "-" + strMonth + "-" + strDay; 
		strBirthDate = "1997-02-03";
		this.datEmpBirthdate = DateHelper.parseDate(strBirthDate);
		
		if(grantAccess == true){
			System.out.print(grantAccess);
			emp = new Employee(1, strEmpLastName.trim().toUpperCase(), strEmpFirstName.trim().toUpperCase(), strEmpMiddleName.trim().toUpperCase(), datEmpBirthdate, strEmpGender, strEmpAddress.trim().toUpperCase(), strEmpContactNo, "A", "NO ACCESS", "NO ACCESS", path, null, selectedJob);
			empService = new EmployeeServiceImpl();
		}
		else{
			System.out.print(grantAccess);
			emp = new Employee(1, strEmpLastName.trim().toUpperCase(), strEmpFirstName.trim().toUpperCase(), strEmpMiddleName.trim().toUpperCase(), datEmpBirthdate, strEmpGender, strEmpAddress.trim().toUpperCase(), strEmpContactNo, "A", "NO ACCESS", "NO ACCESS", path, null, selectedJob);
			empService = new EmployeeServiceImpl();
		}

		if(empService.create(emp) == true)
		{	
			System.out.print("success");
			return "success";
		}
		else
		{	
			System.out.print("failed");
			return "failed";
		}
	}

	public String getStrEmpLastName() {
		return strEmpLastName;
	}

	public void setStrEmpLastName(String strEmpLastName) {
		this.strEmpLastName = strEmpLastName;
	}

	public String getStrEmpFirstName() {
		return strEmpFirstName;
	}

	public void setStrEmpFirstName(String strEmpFirstName) {
		this.strEmpFirstName = strEmpFirstName;
	}

	public String getStrEmpMiddleName() {
		return strEmpMiddleName;
	}

	public void setStrEmpMiddleName(String strEmpMiddleName) {
		this.strEmpMiddleName = strEmpMiddleName;
	}

	public Date getDatEmpBirthdate() {
		return datEmpBirthdate;
	}

	public void setDatEmpBirthdate(Date datEmpBirthdate) {
		this.datEmpBirthdate = datEmpBirthdate;
	}

	public String getStrEmpGender() {
		return strEmpGender;
	}

	public void setStrEmpGender(String strEmpGender) {
		this.strEmpGender = strEmpGender;
	}

	public String getStrEmpAddress() {
		return strEmpAddress;
	}

	public void setStrEmpAddress(String strEmpAddress) {
		this.strEmpAddress = strEmpAddress;
	}

	public String getStrEmpContactNo() {
		return strEmpContactNo;
	}

	public void setStrEmpContactNo(String strEmpContactNo) {
		this.strEmpContactNo = strEmpContactNo;
	}

	public String getStrEmpStatus() {
		return strEmpStatus;
	}

	public void setStrEmpStatus(String strEmpStatus) {
		this.strEmpStatus = strEmpStatus;
	}

	public String getStrEmpUsername() {
		return strEmpUsername;
	}

	public void setStrEmpUsername(String strEmpUsername) {
		this.strEmpUsername = strEmpUsername;
	}

	public String getStrEmpPassword() {
		return strEmpPassword;
	}

	public void setStrEmpPassword(String strEmpPassword) {
		this.strEmpPassword = strEmpPassword;
	}

	public String getSelectedJob() {
		return selectedJob;
	}

	public void setSelectedJob(String selectedJob) {
		this.selectedJob = selectedJob;
	}

	public String getStrMonth() {
		return strMonth;
	}

	public void setStrMonth(String strMonth) {
		this.strMonth = strMonth;
	}

	public String getStrDay() {
		return strDay;
	}

	public void setStrDay(String strDay) {
		this.strDay = strDay;
	}

	public String getStrYear() {
		return strYear;
	}

	public void setStrYear(String strYear) {
		this.strYear = strYear;
	}

	public File getUpload() {
		return file;
	}

	public void setUpload(File file) {
		this.file = file;
	}

	public String getUploadContentType() {
		return contentType;
	}

	public void setUploadContentType(String contentType) {
		this.contentType = contentType;
	}

	public String getUploadFilename() {
		return filename;
	}

	public void setUploadFilename(String filename) {
		this.filename = filename;
	}

	public String getStrEmpBirthdate() {
		return strEmpBirthdate;
	}

	public void setStrEmpBirthdate(String strEmpBirthdate) {
		this.strEmpBirthdate = strEmpBirthdate;
	}

	public boolean isGrantAccess() {
		return grantAccess;
	}

	public void setGrantAccess(boolean grantAccess) {
		this.grantAccess = grantAccess;
	}
}
