package com.gss.service;

import java.util.List;

import com.gss.model.Service;

public interface ServiceService {

	public List<Service> getAllService();

	public boolean createService(Service service);
	
	public boolean updateService(Service service);
}
