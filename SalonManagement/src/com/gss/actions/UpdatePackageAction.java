package com.gss.actions;

import java.util.ArrayList;
import java.util.List;

import com.gss.model.Package;
import com.gss.model.Product;
import com.gss.model.ProductPackage;
import com.gss.model.Service;
import com.gss.model.ServicePackage;
import com.gss.service.PackageService;
import com.gss.service.PackageServiceImpl;
import com.gss.service.ProductService;
import com.gss.service.ProductServiceImpl;
import com.gss.service.ServiceService;
import com.gss.service.ServiceServiceImpl;

public class UpdatePackageAction {
	
	private String intPackageID;
	private String strPackageName;
	private String strPackageDesc;
	private int intPackageType;
	private double dblPackagePrice;
	private String createPackServType = "";
	private String createPackProdType = "";
	private String createPackServQty = "";
	private String createPackProdQty = "";
	
	public String execute(){		
		
		ServiceService serviceService = new ServiceServiceImpl();
		ProductService productService = new ProductServiceImpl();
		PackageService packageService = new PackageServiceImpl();
		
		List<Service> service = serviceService.getAllService();
		List<Product> product = productService.getAllProducts();
		
		List<ServicePackage> serviceList = new ArrayList<ServicePackage>();
		List<ProductPackage> productList = new ArrayList<ProductPackage>();
		
		String[] selectedServices = this.createPackServType.split(", ");
		String[] selectedProducts = this.createPackProdType.split(", ");
		String[] serviceCount = this.createPackServQty.split(", ");
		String[] productCount = this.createPackProdQty.split(", ");
		
		System.out.print(this.createPackProdType);
		System.out.print(this.createPackServType);
		System.out.print(this.createPackProdQty);
		System.out.print(this.createPackServQty);
//		if(!createPackServType.equals("")){
//			
//			for(int i = 0; i < selectedServices.length; i++){
//				for(int j = 0; j < service.size(); j++){
//					
//					Service sample = service.get(j);
//					if(selectedServices[i].equals(sample.getStrServiceName())){
//						serviceList.add(new ServicePackage(1, sample, Integer.parseInt(serviceCount[i]), 1));
//					}
//				}
//			}
//		}
//		
//		if(!createPackProdType.equals("")){
//			
//			for(int i = 0; i < selectedProducts.length; i++){
//				for(int j = 0; j < product.size(); j++){
//					
//					Product sample = product.get(j);
//					if(selectedProducts[i].equals(sample.getStrProductName())){
//						productList.add(new ProductPackage(1, sample, Integer.parseInt(productCount[i]), 1));
//					}
//				}
//			}
//		}
		
//		Package packagee = new Package(1, strPackageName.toUpperCase().trim(), strPackageDesc.toUpperCase().trim(), intPackageType, 1, "NON-EXPIRY", dblPackagePrice, null, null, 1);
//		
//		if(packageService.createPackage(packagee)){
//			System.out.println("success");
//			return "success";
//		}else{
//			System.out.println("failed");
//			return "failed";
//		}	
		
		return "success";
		
	}

	public String getIntPackageID() {
		return intPackageID;
	}

	public void setIntPackageID(String intPackageID) {
		this.intPackageID = intPackageID;
	}

	public String getStrPackageName() {
		return strPackageName;
	}

	public void setStrPackageName(String strPackageName) {
		this.strPackageName = strPackageName;
	}

	public String getStrPackageDesc() {
		return strPackageDesc;
	}

	public void setStrPackageDesc(String strPackageDesc) {
		this.strPackageDesc = strPackageDesc;
	}

	public double getDblPackagePrice() {
		return dblPackagePrice;
	}

	public void setDblPackagePrice(double dblPackagePrice) {
		this.dblPackagePrice = dblPackagePrice;
	}

	public int getIntPackageType() {
		return intPackageType;
	}

	public void setIntPackageType(int intPackageType) {
		this.intPackageType = intPackageType;
	}
}

