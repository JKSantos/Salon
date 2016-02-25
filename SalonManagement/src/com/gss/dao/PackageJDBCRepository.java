package com.gss.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.gss.connection.JDBCConnection;
import com.gss.model.Package;
import com.gss.model.Product;
import com.gss.model.ProductPackage;
import com.gss.model.Service;
import com.gss.model.ServicePackage;
import com.gss.service.ProductServiceImpl;
import com.gss.service.ServiceServiceImpl;
import com.gss.utilities.ProductPackageComparison;
import com.gss.utilities.SearchProduct;
import com.gss.utilities.SearchService;
import com.gss.utilities.ServicePackageComparison;

public class PackageJDBCRepository implements PackageRepository{

	private JDBCConnection jdbc = new JDBCConnection();
	
	@Override
	public boolean createPackage(Package pack) {
		
		Connection con = jdbc.getConnection();
		ResultSet set1;
		String strQuery1 = "CALL createPackage(?, ?, ?, ?, ?, ?)"; 
		String strQuery2 = "CALL createProductPackage(?, ?, ?)";
		String strQuery3 = "CALL createServicePackage(?, ?)";

		int intPackageID = 0;
		
		try{
			
			PreparedStatement pre1 = con.prepareStatement(strQuery1);
			pre1.setString(1, pack.getStrPackageName());
			pre1.setString(2, pack.getStrPackageDesc());
			pre1.setInt(3, pack.getIntPackageType());
			pre1.setInt(4, pack.getIntMaxHeadCount());
			pre1.setString(5, pack.getStrPackageAvailability());
			pre1.setDouble(6, pack.getDblPackagePrice());
			
			set1 = pre1.executeQuery();
			
			while(set1.next()){
				intPackageID = set1.getInt(1);
			}
			
			pre1.close();
			
			for(int intCtr = 0; intCtr < pack.getServiceList().size(); intCtr++){
				ServicePackage servicePack = pack.getServiceList().get(intCtr);
				Service service = servicePack.getService();
				
				PreparedStatement pre2 = con.prepareStatement(strQuery3);
				pre2.setInt(1, intPackageID);
				pre2.setInt(2, service.getIntServiceID());
				pre2.execute();
				pre2.close();
			}
			
			for(int intCtr = 0; intCtr < pack.getProductList().size(); intCtr++){
				ProductPackage productPack = pack.getProductList().get(intCtr);
				Product product = productPack.getProduct();
				
				PreparedStatement pre2 = con.prepareStatement(strQuery2);
				pre2.setInt(1, intPackageID);
				pre2.setInt(2, product.getIntProductID());
				pre2.setInt(3, productPack.getIntProductQuantity());
				pre2.execute();
				pre2.close();
			}
			
			con.close();
			return true;
			
		}
		catch(Exception e){
			System.out.println(e.fillInStackTrace());
			return false;
		}
	}

	@Override
	public boolean updatePackage(Package pack) {
		
		Connection con = jdbc.getConnection();
		String strQuery1 = "CALL updatePackage(?, ?, ?, ?, ?, ?, ?)";
		String strQuery2 = "CALL updateServicePackage(?, ?, ?)";
		String strQuery3 = "CALL updateProductPackage(?, ?, ?, ?)";
		String strQuery4 = "SELECT * FROM tblServicePackage WHERE intPackageID = ?;";
		String strQuery5 = "SELECT * FROM tblProductPackage WHERE intPackageID = ?;";
		String strQuery6 = "CALL createServicePackage(?, ?)";
		String strQuery7 = "CALL createProductPackage(?, ?, ?)";
		
		List<ServicePackage> servicePackage = new ArrayList<ServicePackage>();
		List<ProductPackage> productPackage = new ArrayList<ProductPackage>();
		
		ServicePackage servPack;
		ProductPackage prodPack;
		
		Service service;
		Product product;
		
		ServiceServiceImpl serv = new ServiceServiceImpl();
		ProductServiceImpl prod = new ProductServiceImpl();
		
		SearchService searchService = new SearchService();
		SearchProduct searchProduct = new SearchProduct();
		
		ServicePackageComparison spc = new ServicePackageComparison();
		ProductPackageComparison ppc = new ProductPackageComparison();
		
		int intServID = 0;
		int intSerivcePackageID = 0;
		int intServiceID = 0;
		int intServicePackageStatus = 0;
		
		int intProdID = 0;
		int intProductPackageID = 0;
		int intProductID = 0;
		int intProductQuantity = 0;
		int intProductPackageStatus = 0;
		
		
		try{
			PreparedStatement pre1 = con.prepareStatement(strQuery1);
			pre1.setInt(1, pack.getIntPackageID());
			pre1.setString(2, pack.getStrPackageName());
			pre1.setString(3, pack.getStrPackageDesc());
			pre1.setInt(4, pack.getIntPackageType());
			pre1.setInt(5, pack.getIntMaxHeadCount());
			pre1.setString(6, pack.getStrPackageAvailability());
			pre1.setDouble(7, pack.getDblPackagePrice());
			
			pre1.execute();
			pre1.close();
			
			PreparedStatement pre2 = con.prepareStatement(strQuery4);
			pre2.setInt(1, pack.getIntPackageID());
			ResultSet serviceSet = pre2.executeQuery();
			
			while(serviceSet.next()){
				
				intServID = serviceSet.getInt(1);
				intSerivcePackageID = serviceSet.getInt(2);
				intServiceID = serviceSet.getInt(3);
				intServicePackageStatus = serviceSet.getInt(4);
			
				List<Service> serviceList = serv.getAllService();
				service = searchService.search(intServiceID, serviceList);
				
				servPack = new ServicePackage(intServID, service, intServicePackageStatus);
				
				servicePackage.add(servPack);

			}
			pre2.close();
			serviceSet.close();
			
			PreparedStatement pre3 = con.prepareStatement(strQuery5);
			pre3.setInt(1, pack.getIntPackageID());
			ResultSet productSet = pre3.executeQuery();
			
			while(productSet.next()){
				
				intProdID = productSet.getInt(1);
				intProductPackageID = productSet.getInt(2);
				intProductID = productSet.getInt(3);
				intProductQuantity = productSet.getInt(4);
				intProductPackageStatus = productSet.getInt(5);
				
				List<Product> prodList = prod.getAllProducts();
				product = searchProduct.search(intProductID, prodList);
				
				prodPack = new ProductPackage(intProdID, product, intProductQuantity, intProductPackageStatus);
				
				productPackage.add(prodPack);
			}
			pre3.close();
			
			for(int intCtr = 0; intCtr < pack.getServiceList().size(); intCtr++){

				if(spc.compare(pack.getServiceList().get(intCtr), servicePackage) == "same"){
					
				}
				else if(spc.compare(pack.getServiceList().get(intCtr), servicePackage) == "update")
				{
					PreparedStatement pre4 = con.prepareStatement(strQuery2);
					pre4.setInt(1, pack.getServiceList().get(intCtr).getIntServicePackageID());
					pre4.setInt(2, pack.getServiceList().get(intCtr).getService().getIntServiceID());
					pre4.setInt(3, pack.getServiceList().get(intCtr).getIntStatus());
					
					pre4.execute();
				}
				else{
					PreparedStatement pre4 = con.prepareStatement(strQuery6);
					pre4.setInt(1, pack.getIntPackageID());
					pre4.setInt(2, pack.getServiceList().get(intCtr).getService().getIntServiceID());
					
					pre4.execute();
				}
			}
			
						
			for(int intCtr = 0; intCtr < pack.getProductList().size(); intCtr++){
				
				if(ppc.compare(pack.getProductList().get(intCtr), productPackage) == "same"){
					//do nothing
				}
				else if(ppc.compare(pack.getProductList().get(intCtr), productPackage) == "update")
				{
					PreparedStatement pre4 = con.prepareStatement(strQuery3);
					pre4.setInt(1, pack.getProductList().get(intCtr).getIntProductPackageID());
					pre4.setInt(2, pack.getProductList().get(intCtr).getProduct().getIntProductID());
					pre4.setInt(3, pack.getProductList().get(intCtr).getIntProductQuantity());
					pre4.setInt(4, pack.getProductList().get(intCtr).getIntStatus());
					
					pre4.execute();
				}
				else{
					PreparedStatement pre4 = con.prepareStatement(strQuery7);
					pre4.setInt(1, pack.getIntPackageID());
					pre4.setInt(2, pack.getProductList().get(intCtr).getProduct().getIntProductID());
					pre4.setInt(3, pack.getProductList().get(intCtr).getIntProductQuantity());
					
					pre4.execute();
				}
			}
			
			return true;
		}
		catch(Exception e){
			System.out.println(e.fillInStackTrace());
			return false;
		}
	}

	@Override
	public List<Package> getAllPackage() {
		// TODO Auto-generated method stub
		return null;
	}

}
