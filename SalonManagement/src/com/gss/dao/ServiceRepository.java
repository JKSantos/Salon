package com.gss.dao;

import java.util.List;

import com.gss.model.Service;

public interface ServiceRepository {
	
	public List<Service> getAllService();
	
	public boolean createService(Service service);
	
	public boolean updateService(Service service);

}
