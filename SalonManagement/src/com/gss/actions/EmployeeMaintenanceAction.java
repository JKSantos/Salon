package com.gss.actions;

import java.util.List;

import com.gss.model.Employee;
import com.gss.model.EmployeeCategory;
import com.gss.service.EmployeeServiceImpl;

public class EmployeeMaintenanceAction {

	private List<EmployeeCategory> empCategory;
	private List<Employee> empList;
	
	public String execute(){
		
		EmployeeServiceImpl empService = new EmployeeServiceImpl();
		this.empCategory = empService.getAllCategory();
		this.empList = empService.getAllEmployees();
		
		System.out.println(empList.get(1).getStrEmpFirstName());
		
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
}
