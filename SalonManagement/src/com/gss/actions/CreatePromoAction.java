package com.gss.actions;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.gss.model.Product;
import com.gss.model.ProductPackage;
import com.gss.model.Promo;
import com.gss.model.Service;
import com.gss.model.ServicePackage;
import com.gss.service.ProductService;
import com.gss.service.ProductServiceImpl;
import com.gss.service.PromoService;
import com.gss.service.PromoServiceImpl;
import com.gss.service.ServiceService;
import com.gss.service.ServiceServiceImpl;
import com.gss.utilities.DateHelper;

public class CreatePromoAction {
	
	private String strNonExp = "";
	private String strExp;
	private String strPromoName;
	private String strPromoDesc;
	private String strFree = "";
	private double dblPromoPrice;
	private String createServPromType = "";
	private String createProdPromType = "";
	private String createServPromQty = "";
	private String createProdPromQty = "";
	
	public String execute(){
		
		ServiceService serviceService = new ServiceServiceImpl();
		ProductService productService = new ProductServiceImpl();
		
		List<Service> refService = serviceService.getAllService();
		List<Product> refProduct = productService.getAllProducts();
		
		List<ServicePackage> serviceList = new ArrayList<ServicePackage>();
		List<ProductPackage> productList = new ArrayList<ProductPackage>();
		
		PromoService promoService = new PromoServiceImpl();
		boolean result;
		
		String[] services = createServPromType.split(", ");
		String[] products = createProdPromType.split(", ");
		String[] serviceQty = createServPromQty.split(", ");
		String[] productQty = createProdPromQty.split(", ");
		
		if(!services.equals("")){
			
			for(int i = 0; i < services.length; i++){
				
				for(int j = 0; j < refService.size(); j++){
					
					Service service = refService.get(j);
					
					if(service.getStrServiceName().equals(services[i])){
						ServicePackage serv = new ServicePackage(1, 1, service, Integer.parseInt(serviceQty[i]), 1);
						serviceList.add(serv);
					}
				}
			}
		}
		if(!products.equals("")){
			for(int i = 0; i < products.length; i++){
				
				for(int j = 0; j < refProduct.size(); j++){
					
					Product product = refProduct.get(j);
					
					if(product.getStrProductName().equals(products[i])){
						System.out.print(productQty[i]);
						ProductPackage prod = new ProductPackage(1, 1, product, Integer.parseInt(productQty[i]), 1);
						productList.add(prod);
					}
				}
			}
		}
		
		
		if(!strNonExp.equalsIgnoreCase("on")){
			
			String[] date = strExp.split("/");
			DateHelper helper = new DateHelper();
			String expDate = helper.convert(date);
			
			if(strFree.equals("on")){
				
				Promo promo = new Promo(1, strPromoName, strPromoDesc, 0, 1, serviceList, productList, expDate);
				result = promoService.createPromo(promo);
			}
			else{
				
				Promo promo = new Promo(1, strPromoName, strPromoDesc, dblPromoPrice, 1, serviceList, productList, expDate);
				result = promoService.createPromo(promo);
			}
		}
		else{
			
			if(strFree.equals("on")){
				
				Promo promo = new Promo(1, strPromoName, strPromoDesc, 0, 1, serviceList, productList, "NON-EXPIRY");
				result = promoService.createPromo(promo);
			}
			else{
				
				Promo promo = new Promo(1, strPromoName, strPromoDesc, dblPromoPrice, 1, serviceList, productList, "NON-EXPIRY");
				result = promoService.createPromo(promo);
			}
			
		}
		
		if(result == true)
			return "success";
		else
			return "failed";
	}

	public String getStrNonExp() {
		return strNonExp;
	}

	public void setStrNonExp(String strNonExp) {
		this.strNonExp = strNonExp;
	}

	public String getStrExp() {
		return strExp;
	}

	public void setStrExp(String strExp) {
		this.strExp = strExp;
	}

	public String getStrPromoName() {
		return strPromoName;
	}

	public void setStrPromoName(String strPromoName) {
		this.strPromoName = strPromoName;
	}

	public String getStrPromoDesc() {
		return strPromoDesc;
	}

	public void setStrPromoDesc(String strPromoDesc) {
		this.strPromoDesc = strPromoDesc;
	}

	public String getStrFree() {
		return strFree;
	}

	public void setStrFree(String strFree) {
		this.strFree = strFree;
	}

	public double getDblPromoPrice() {
		return dblPromoPrice;
	}

	public void setDblPromoPrice(double dblPromoPrice) {
		this.dblPromoPrice = dblPromoPrice;
	}
	
	public String getCreateServPromType() {
		return createServPromType;
	}

	public void setCreateServPromType(String createServPromType) {
		this.createServPromType = createServPromType;
	}

	public String getCreateProdPromType() {
		return createProdPromType;
	}

	public void setCreateProdPromType(String createProdPromType) {
		this.createProdPromType = createProdPromType;
	}

	public String getCreateServPromQty() {
		return createServPromQty;
	}

	public void setCreateServPromQty(String createServPromQty) {
		this.createServPromQty = createServPromQty;
	}
	
	public String getCreateProdPromQty() {
		return createProdPromQty;
	}

	public void setCreateProdPromQty(String createProdPromQty) {
		this.createProdPromQty = createProdPromQty;
	}

//	public String[] getCreateServPromType() {
//		return createServPromType;
//	}
//
//	public void setCreateServPromType(String[] createServPromType) {
//		this.createServPromType = createServPromType;
//	}
//
//	public String[] getCreateProdPromType() {
//		return createProdPromType;
//	}
//
//	public void setCreateProdPromType(String[] createProdPromType) {
//		this.createProdPromType = createProdPromType;
//	}
//
//	public int[] getCreateServPromQty() {
//		return createServPromQty;
//	}
//
//	public void setCreateServPromQty(int[] createServPromQty) {
//		this.createServPromQty = createServPromQty;
//	}

//	public int[] getCreateProdPromQty() {
//		return createProdPromQty;
//	}
//
//	public void setCreateProdPromQty(int[] createProdPromQty) {
//		this.createProdPromQty = createProdPromQty;
//	}
	
	

}
