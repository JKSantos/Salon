package com.gss.actions;

import java.util.List;

import com.gss.model.Package;
import com.gss.model.Product;
import com.gss.model.Service;
import com.gss.service.PackageService;
import com.gss.service.PackageServiceImpl;
import com.gss.service.ProductService;
import com.gss.service.ProductServiceImpl;
import com.gss.service.ServiceService;
import com.gss.service.ServiceServiceImpl;

public class PackageMaintenance {
	
	private List<Package> packageList;
	
	private List<Product> productList;
	private List<Service> serviceList;
	private List<String> productCategory;
	private List<String> serviceCategory;

	public String execute(){
		
		ProductService productService = new ProductServiceImpl();
		ServiceService serviceService = new ServiceServiceImpl();
		
		this.productList = productService.getAllProducts();
		this.serviceList = serviceService.getAllService();
		this.productCategory = productService.getAllCategory();
		this.serviceCategory = serviceService.getAllCategory();
		
		PackageService service = new PackageServiceImpl();
		this.packageList = service.getAllPackage();
		System.out.println("Package List Size: " + packageList.size());
		
		return "success";
	}

	public List<Package> getPackageList() {
		return packageList;
	}

	public void setPackageList(List<Package> packageList) {
		this.packageList = packageList;
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

	public List<String> getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(List<String> productCategory) {
		this.productCategory = productCategory;
	}

	public List<String> getServiceCategory() {
		return serviceCategory;
	}

	public void setServiceCategory(List<String> serviceCategory) {
		this.serviceCategory = serviceCategory;
	}

	
}
