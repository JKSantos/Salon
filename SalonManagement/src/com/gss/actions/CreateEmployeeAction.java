package com.gss.actions;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.gss.model.Employee;
import com.gss.model.Job;
import com.gss.service.EmployeeServiceImpl;
import com.gss.utilities.DateHelper;
import com.gss.utilities.JobQualificationHelper;
import com.gss.utilities.SendMail;
import com.opensymphony.xwork2.ActionSupport;

public class CreateEmployeeAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	private String strEmpLastName;
	private String strEmpFirstName;
	private String strEmpMiddleName;
	private String strBirthdate;
	private Date datEmpBirthdate;
	private String strEmpGender;
	private String strEmpAddress;
	private String strEmpContactNo;
	private String strEmpEmail;
	private String strEmpStatus;
	private String strEmpUsername;
	private String strEmpPassword;
	private String strEmpBirthdate;
	private File file;
	private String contentType;
	private String filename;
	private List<String> selectedJob;
	private boolean grantAccess;
	
	public String execute(){
		
		SendMail mail = new SendMail();
		EmployeeServiceImpl empService;
		Employee emp;
		
		List<Job> selectedJob = new JobQualificationHelper().convertToJob(this.selectedJob);
		
		String path = "";
		
		String concatenatedName = "";
		String[] unConvertedDate = strBirthdate.split("/");
		String[] name = this.strEmpFirstName.split(" ");
		
		for(int i = 0; i < name.length; i++){
			concatenatedName += name[i];
		}
		
		String strUser = concatenatedName;
		concatenatedName = "";
		name = this.strEmpLastName.split(" ");
		
		for(int i = 0; i < name.length; i++){
			concatenatedName += name[i];
		}
		
		String strPass = concatenatedName;
		
		this.strBirthdate = new DateHelper().convert(unConvertedDate);
		this.datEmpBirthdate = DateHelper.parseDate(strBirthdate);
		
		this.datEmpBirthdate = DateHelper.parseDate(strBirthdate);
		
		if(grantAccess == true){
			
			
			emp = new Employee(1, strEmpLastName.trim().toUpperCase(), strEmpFirstName.trim().toUpperCase(), strEmpMiddleName.trim().toUpperCase(), datEmpBirthdate, strEmpGender, strEmpAddress.trim().toUpperCase(), strEmpContactNo, strEmpEmail, "A", "NO ACCESS", "NO ACCESS", file.getAbsolutePath(), null, selectedJob);
			empService = new EmployeeServiceImpl();
		}
		else{
			
			
			emp = new Employee(1, strEmpLastName.trim().toUpperCase(), strEmpFirstName.trim().toUpperCase(), strEmpMiddleName.trim().toUpperCase(), datEmpBirthdate, strEmpGender, strEmpAddress.trim().toUpperCase(), strEmpContactNo, strEmpEmail, "A", "NO ACCESS", "NO ACCESS", file.getAbsolutePath(), null, selectedJob);
			empService = new EmployeeServiceImpl();
		}

		if(empService.create(emp) == true)
		{	
			System.out.print("success");
			mail.sendEmail(this.strEmpEmail, strUser, strPass);
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

	public List<String> getSelectedJob() {
		return selectedJob;
	}

	public void setSelectedJob(List<String> selectedJob) {
		this.selectedJob = selectedJob;
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
	
	public void setUpload(File file){
		this.file = file;
	}
	
	public File getUpload(){
		return this.file;
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

	public String getStrBirthdate() {
		return strBirthdate;
	}

	public void setStrBirthdate(String strBirthdate) {
		this.strBirthdate = strBirthdate;
	}

	public String getStrEmpEmail() {
		return strEmpEmail;
	}

	public void setStrEmpEmail(String strEmpEmail) {
		this.strEmpEmail = strEmpEmail;
	}
	
	
}
