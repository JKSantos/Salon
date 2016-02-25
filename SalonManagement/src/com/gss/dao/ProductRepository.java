package com.gss.dao;

import java.util.List;

import com.gss.model.Product;

public interface ProductRepository {
	
	public boolean createProduct(Product product);
	
	public boolean updateProduct(Product product);
	
	public List<Product> getAllProducts();

}
