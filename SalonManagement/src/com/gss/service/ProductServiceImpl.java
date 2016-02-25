package com.gss.service;

import java.util.List;

import com.gss.dao.ProductJDBCRepository;
import com.gss.dao.ProductRepository;
import com.gss.model.Product;

public class ProductServiceImpl implements ProductService{
		
	public boolean createProduct(Product product) {
		
		ProductRepository repo = new ProductJDBCRepository();
		
		return repo.createProduct(product);
	}


	public boolean updateProduct(Product product) {
	
		ProductRepository repo = new ProductJDBCRepository();
		
		return repo.updateProduct(product);
	}


	public List<Product> getAllProducts() {
	
		ProductRepository repo = new ProductJDBCRepository();
		
		return repo.getAllProducts();
	}

}
