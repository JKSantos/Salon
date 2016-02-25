package com.gss.utilities;

import java.util.List;

import com.gss.model.Product;

public class SearchProduct {

	public Product search(int intProductID, List<Product> productList){
		
		for(int intCtr = 0; intCtr < productList.size(); intCtr++){
			
			Product prod = productList.get(intCtr);
			
			if(intProductID == prod.getIntProductID())
				return prod;
		}
		
		return null;
		
	}
}
