package com.gss.model;

import java.util.Date;
import java.util.List;

public class Employee {
	
	private int intEmpID;
	private String strEmpLastName;
	private String strEmpFirstName;
	private String strEmpMiddleName;
	private Date datEmpBirthdate;
	private String strEmpGender;
	private String strEmpAddress;
	private String strEmpContactNo;
	private String strEmpStatus;
	private String strEmpUsername;
	private String strEmpPassword;
	private String blobEmpPhoto;
	private byte[] bytActualImage;
	private List<Job> strJobQualification;
	
	
	public Employee(int intEmpID, String strEmpLastName, String strEmpFirstName, String strEmpMiddleName, Date datBirthdate, String strEmpGender, String strAddress, String strEmpContactNo, String strEmpStatus, String strUsername, String strPassword, String empPhoto, byte[] bytActualPhoto, List<Job> strJobQualification)
	{
		this.setIntEmpID(intEmpID);
		this.strEmpLastName = strEmpLastName;
		this.strEmpFirstName = strEmpFirstName;
		this.strEmpMiddleName = strEmpMiddleName;
		this.strEmpAddress = strAddress;
		this.datEmpBirthdate = datBirthdate;
		this.setStrEmpGender(strEmpGender);
		this.setStrEmpUsername(strUsername);
		this.strEmpPassword = strPassword;
		this.strEmpStatus = strEmpStatus;
		this.strEmpContactNo = strEmpContactNo;
		this.setBlobEmpPhoto(empPhoto);	
		this.setBytActualImage(bytActualPhoto);
		this.setStrJobQualification(strJobQualification);
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

	public String getStrEmpAddress() {
		return strEmpAddress;
	}

	public void setStrEmpAddress(String strEmpAddress) {
		this.strEmpAddress = strEmpAddress;
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

	public String getStrEmpStatus() {
		return strEmpStatus;
	}

	public void setStrEmpStatus(String strEmpStatus) {
		this.strEmpStatus = strEmpStatus;
	}

	public String getStrEmpContactNo() {
		return strEmpContactNo;
	}

	public void setStrEmpContactNo(String strEmpContactNo) {
		this.strEmpContactNo = strEmpContactNo;
	}

	public int getIntEmpID() {
		return intEmpID;
	}

	public void setIntEmpID(int intEmpID) {
		this.intEmpID = intEmpID;
	}

	public String getBlobEmpPhoto() {
		return blobEmpPhoto;
	}

	public void setBlobEmpPhoto(String blobEmpPhoto) {
		this.blobEmpPhoto = blobEmpPhoto;
	}

	public byte[] getBytActualImage() {
		return bytActualImage;
	}

	public void setBytActualImage(byte[] bytActualImage) {
		this.bytActualImage = bytActualImage;
	}

	public List<Job> getStrJobQualification() {
		return strJobQualification;
	}

	public void setStrJobQualification(List<Job> strJobQualification) {
		this.strJobQualification = strJobQualification;
	}

}
