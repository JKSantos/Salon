package com.gss.dao;

import java.util.List;

import com.gss.model.Location;

public interface LocationRepository {
	
	public boolean createLocation(Location location);
	
	public boolean updateLocation(Location location);
	
	public boolean deactivateLocation(Location location);
	
	public List<Location> getAllLocation();

}
