package com.gss.actions;

import java.util.ArrayList;
import java.util.List;

import com.gss.model.Employee;
import com.gss.model.EmployeeCategory;
import com.gss.model.Job;
import com.gss.service.EmployeeServiceImpl;

public class EmployeeMaintenanceAction {

	private List<EmployeeCategory> empCategory;
	private List<Employee> empList;
	private List<Job> jobList = new ArrayList<Job>();
	
	public String execute(){
		
		EmployeeServiceImpl empService = new EmployeeServiceImpl();
		this.empCategory = empService.getAllCategory();
		this.empList = empService.getAllEmployees();
		
//		for(int i=0; i< empList.size(); i++){
//			Employee emp = empList.get(i);
//			for(int j=0;j<emp.getStrJobQualification().size(); j++){
//				Job job = emp.getStrJobQualification().get(j);
//				
//				jobList.add(job);
//			}
//		}
		
		System.out.print(empList.size());
	//	System.out.println(empList.get(1).getStrEmpFirstName() + " " + empList.get(1).getStrJobQualification().get(0).getStrJobDesc());
		
		return "success";
	}

	public List<Employee> getEmpList() {
		return empList;
	}

	public void setEmpList(List<Employee> empList) {
		this.empList = empList;
	}

	public List<EmployeeCategory> getEmpCategory() {
		return empCategory;
	}

	public void setEmpCategory(List<EmployeeCategory> empCategory) {
		this.empCategory = empCategory;
	}

	public List<Job> getJobList() {
		return jobList;
	}

	public void setJobList(List<Job> jobList) {
		this.jobList = jobList;
	}
	
}
