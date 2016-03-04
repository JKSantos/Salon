package com.gss.actions;

import java.util.List;

import com.gss.model.Product;
import com.gss.model.Promo;
import com.gss.model.Service;
import com.gss.service.ProductService;
import com.gss.service.ProductServiceImpl;
import com.gss.service.PromoService;
import com.gss.service.PromoServiceImpl;
import com.gss.service.ServiceService;
import com.gss.service.ServiceServiceImpl;

public class PromoMaintenanceAction {
	
	private List<Product> productList;
	private List<Service> serviceList;
	private List<Promo> promoList;
	
	public String execute(){
		
		ProductService product = new ProductServiceImpl();
		ServiceService service = new ServiceServiceImpl();
		PromoService promo = new PromoServiceImpl();
		
		this.productList = product.getAllProducts();
		this.serviceList = service.getAllService();
		this.promoList = promo.getAllPromo();
		
		return "success";
	}

	public List<Product> getProductList() {
		return productList;
	}

	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}

	public List<Service> getServiceList() {
		return serviceList;
	}

	public void setServiceList(List<Service> serviceList) {
		this.serviceList = serviceList;
	}

	public List<Promo> getPromoList() {
		return promoList;
	}

	public void setPromoList(List<Promo> promoList) {
		this.promoList = promoList;
	}
}
