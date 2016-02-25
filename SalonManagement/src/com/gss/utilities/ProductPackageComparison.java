package com.gss.utilities;

import java.util.List;

import com.gss.model.ProductPackage;

public class ProductPackageComparison {
	
	public String compare(ProductPackage prodPack, List<ProductPackage> productList){
		
		
		if(productList.size() > 0){
			for(int intCtr = 0; intCtr < productList.size(); intCtr++ ){
			
				ProductPackage pack = productList.get(intCtr);
			
				if(prodPack.getIntProductPackageID() == pack.getIntProductPackageID() && prodPack.getProduct().getIntProductID() == pack.getProduct().getIntProductID() && prodPack.getIntProductQuantity() == pack.getIntProductQuantity() && prodPack.getIntStatus() == pack.getIntStatus()){
					System.out.println("same " + prodPack.getIntProductPackageID() + " " + pack.getIntProductPackageID());
					return "same";
				}
				else if(prodPack.getIntProductPackageID() == pack.getIntProductPackageID() && prodPack.getProduct().getIntProductID() != pack.getProduct().getIntProductID() || prodPack.getIntProductPackageID() == pack.getIntProductPackageID() && prodPack.getIntProductQuantity() != pack.getIntProductQuantity() || prodPack.getIntProductPackageID() == pack.getIntProductPackageID() && prodPack.getIntStatus() != pack.getIntStatus()){
					System.out.println("update " + prodPack.getIntProductPackageID() + " " + pack.getIntProductPackageID());
					return "update";
				}
				else if(intCtr == (productList.size() - 1)){
					System.out.println("new " + prodPack.getIntProductPackageID() + " " + pack.getIntProductPackageID());
					return "new";
				}
			}
			
			return null;
		}
		else{
			return "new";
		}
	}

}
