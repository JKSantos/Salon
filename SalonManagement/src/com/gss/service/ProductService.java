package com.gss.service;

import java.util.List;

import com.gss.model.Product;

public interface ProductService {
	
	public boolean createProduct(Product product);

	public boolean updateProduct(Product product);

	public List<Product> getAllProducts();

}
