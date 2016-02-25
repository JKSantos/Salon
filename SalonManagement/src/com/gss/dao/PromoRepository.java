package com.gss.dao;

import java.util.List;

import com.gss.model.Promo;

public interface PromoRepository {
	
	public boolean createPromo(Promo promo);
	
	public boolean updatePromo(Promo promo);
	
	public List<Promo> getAllPromo();

}
