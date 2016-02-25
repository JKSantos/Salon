package com.gss.testers;

import java.util.ArrayList;
import java.util.List;

import com.gss.model.Package;
import com.gss.model.Product;
import com.gss.model.ProductPackage;
import com.gss.model.Service;
import com.gss.model.ServicePackage;
import com.gss.service.PackageServiceImpl;

public class UpdatePackage {
	
	public static void main(String[] args){
		
		Service serv = new Service(27, "Under Cut", "Hair Cut", 1, "SAMPLE DESCRIPTION", null, "resource/jeff.jpg");
		serv.setDblServicePrice(20.00);
		
		Service serv2 = new Service(28, "Under Cut", "Hair Cut", 1, "SAMPLE DESCRIPTION", null, "resource/jeff.jpg");
		serv2.setDblServicePrice(20.00);
		
		Service serv3 = new Service(28, "Under Cut", "Hair Cut", 1, "SAMPLE DESCRIPTION", null, "resource/jeff.jpg");
		serv3.setDblServicePrice(20.00);
		
		ServicePackage servPack = new ServicePackage(72, serv, 1);
		ServicePackage servPack2 = new ServicePackage(73, serv2, 1);
		ServicePackage servPack3 = new ServicePackage(74, serv3, 1);
		
		
		List<ServicePackage> serviceList = new ArrayList<ServicePackage>();
		serviceList.add(servPack);
		serviceList.add(servPack2);
		serviceList.add(servPack3);
		
		Product product = new Product(7, "Grips Wax 150mL", "Hair Wax", "For styling your hair", 0, null, 90.00, "resource/jeff.jpg");
		Product product2 = new Product(8, "Grips Wax 150mL", "Hair Wax", "For styling your hair", 0, null, 90.00, "resource/jeff.jpg");
		Product product3 = new Product(7, "Grips Wax 150mL", "Hair Wax", "For styling your hair", 0, null, 90.00, "resource/jeff.jpg");
		Product product4 = new Product(8, "Grips Wax 150mL", "Hair Wax", "For styling your hair", 0, null, 90.00, "resource/jeff.jpg");
		
		ProductPackage productPack1 = new ProductPackage(19, product, 6, 1);
		ProductPackage productPack2 = new ProductPackage(20, product2, 7, 1);
		ProductPackage productPack3 = new ProductPackage(21, product3, 78, 1);
		ProductPackage productPack4 = new ProductPackage(22, product, 7, 1);
		
		List<ProductPackage> prodList = new ArrayList<ProductPackage>();
		prodList.add(productPack1);
		prodList.add(productPack2);
		prodList.add(productPack3);
		prodList.add(productPack4);
		
		Package newPackage = new Package(15, "Updated Package", "affordable na package", 1, 7, "NON EXPIRY", 2500.00, serviceList, prodList);
		
		PackageServiceImpl packServ = new PackageServiceImpl();
		
		if(packServ.updatePackage(newPackage))
			System.out.println("success");
		else
			System.out.println("failed");
		
	}

}
