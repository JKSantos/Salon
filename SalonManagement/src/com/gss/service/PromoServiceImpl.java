package com.gss.service;

import java.util.List;

import com.gss.dao.PromoJDBCRepository;
import com.gss.dao.PromoRepository;
import com.gss.model.Promo;

public class PromoServiceImpl implements PromoService{

	public boolean createPromo(Promo promo) {
		
		PromoRepository repo = new PromoJDBCRepository();
		
		return repo.createPromo(promo);
	}

	public boolean updatePromo(Promo promo) {
		
		PromoRepository repo = new PromoJDBCRepository();
		
		return repo.updatePromo(promo);
	}

	public List<Promo> getAllPromo() {
		
		PromoRepository repo = new PromoJDBCRepository();
		
		return repo.getAllPromo();
	}

}
