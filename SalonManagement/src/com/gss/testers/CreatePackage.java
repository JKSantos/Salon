package com.gss.testers;

import java.util.ArrayList;
import java.util.List;

import com.gss.model.Package;
import com.gss.model.Product;
import com.gss.model.ProductPackage;
import com.gss.model.Service;
import com.gss.model.ServicePackage;
import com.gss.service.PackageServiceImpl;

public class CreatePackage {
	
	public static void main(String[] args){
		
		Service serv = new Service(27, "Under Cut", "Hair Cut", 1, "SAMPLE DESCRIPTION", null, "resource/jeff.jpg");
		serv.setDblServicePrice(20.00);
		
		Service serv2 = new Service(28, "Under Cut", "Hair Cut", 1, "SAMPLE DESCRIPTION", null, "resource/jeff.jpg");
		serv.setDblServicePrice(20.00);
		
		ServicePackage servPack = new ServicePackage(1, serv, 1);
		ServicePackage servPack2 = new ServicePackage(1, serv2, 1);
		
		List<ServicePackage> serviceList = new ArrayList<ServicePackage>();
		serviceList.add(servPack);
		serviceList.add(servPack2);
		
		Product product = new Product(7, "Grips Wax 150mL", "Hair Wax", "For styling your hair", 0, null, 90.00, "resource/jeff.jpg");
		Product product2 = new Product(8, "Grips Wax 150mL", "Hair Wax", "For styling your hair", 0, null, 90.00, "resource/jeff.jpg");
		
		ProductPackage productPack1 = new ProductPackage(1, product, 2, 1);
		ProductPackage productPack2 = new ProductPackage(1, product2, 3, 1);
		
		List<ProductPackage> prodList = new ArrayList<ProductPackage>();
		prodList.add(productPack1);
		prodList.add(productPack2);
		
		Package newPackage = new Package(1, "Wedding Package", "SAMPLE WEDDING PACKAGE", 1, 7, "NON EXPIRY", 2500.00, serviceList, prodList);
	
		PackageServiceImpl servicePackage = new PackageServiceImpl();
		
		if(servicePackage.createPackage(newPackage) == true)
			System.out.println("success");
		else
			System.out.println("failed");
		
	}
}
