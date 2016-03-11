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
	private int intServicQuantity;
	
	@Override
	public boolean createPackage(Package pack) {
		
		Connection con = jdbc.getConnection();
		ResultSet set1;
		String strQuery1 = "CALL createPackage(?, ?, ?, ?, ?, ?, ?)"; 
		String strQuery2 = "CALL createProductPackage(?, ?, ?)";
		String strQuery3 = "CALL createServicePackage(?, ?, ?)";

		int intPackageID = 0;
		
		try{
			
			PreparedStatement pre1 = con.prepareStatement(strQuery1);
			pre1.setString(1, pack.getStrPackageName());
			pre1.setString(2, pack.getStrPackageDesc());
			pre1.setInt(3, pack.getIntPackageType());
			pre1.setInt(4, pack.getIntMaxHeadCount());
			pre1.setString(5, pack.getStrPackageAvailability());
			pre1.setDouble(6, pack.getDblPackagePrice());
			pre1.setInt(7, pack.getIntPackageStatus());
			
			set1 = pre1.executeQuery();
			
			while(set1.next()){
				intPackageID = set1.getInt(1);
			}
			
			pre1.close();
			
			System.out.println(intPackageID);
			
			for(int intCtr = 0; intCtr < pack.getServiceList().size(); intCtr++){
				ServicePackage servicePack = pack.getServiceList().get(intCtr);
				Service service = servicePack.getService();
				System.out.println(service.getIntServiceID());
				PreparedStatement pre2 = con.prepareStatement(strQuery3);
				pre2.setInt(1, intPackageID);
				pre2.setInt(2, service.getIntServiceID());
				pre2.setInt(3, servicePack.getIntQuantity());
				pre2.execute();
				pre2.close();
			}
			System.out.println("HERE 2");
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
			System.out.println("HERE 3");
			con.close();
			return true;
			
		}
		catch(Exception e){
			System.out.println(e.fillInStackTrace());
			return false;
		}
	}

	@Override
	public boolean updatePackage(Package pack) throws NullPointerException{
		
		Connection con = jdbc.getConnection();
		String strQuery1 = "CALL updatePackage(?, ?, ?, ?, ?, ?, ?)";
		String strQuery2 = "CALL updateServicePackage(?, ?, ?)";
		String strQuery3 = "CALL updateProductPackage(?, ?, ?)";
		String strQuery4 = "SELECT * FROM tblServicePackage WHERE intPackageID = ? AND intPackageServiceStatus = 1;";
		String strQuery5 = "SELECT * FROM tblProductPackage WHERE intPackageID = ? AND intProductPackageStatus = 1;";
		String strQuery6 = "CALL createServicePackage(?, ?, ?)";
		String strQuery7 = "CALL createProductPackage(?, ?, ?)";
		
		List<ServicePackage> servicePackage = new ArrayList<ServicePackage>();
		List<ProductPackage> productPackage = new ArrayList<ProductPackage>();
		
		List<ServicePackage> deactivatedServices;
		List<ProductPackage> deactivatedProducts;
		
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
				intServicQuantity = serviceSet.getInt(4);
				intServicePackageStatus = serviceSet.getInt(5);
			
				List<Service> serviceList = serv.getAllService();
				service = searchService.search(intServiceID, serviceList);
				
				servPack = new ServicePackage(intServID, service, intServicQuantity, intServicePackageStatus);
				
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
			
			deactivatedServices = searchService.compareServices(pack.getServiceList(), servicePackage);
			deactivatedProducts = searchProduct.compareProducts(pack.getProductList(), productPackage);
			
			System.out.println("Old Package size: " + servicePackage.size());
			
			for(int intCtr = 0; intCtr < pack.getServiceList().size(); intCtr++){

				if(spc.compare(pack.getServiceList().get(intCtr), servicePackage).equalsIgnoreCase("same")){
					//do nothing
				}
				else if(spc.compare(pack.getServiceList().get(intCtr), servicePackage).equalsIgnoreCase("update"))
				{
					
					PreparedStatement pre4 = con.prepareStatement(strQuery2);
					pre4.setInt(1, pack.getServiceList().get(intCtr).getIntServicePackageID());
					pre4.setInt(2, pack.getServiceList().get(intCtr).getIntStatus());
					pre4.setInt(3, pack.getServiceList().get(intCtr).getIntQuantity());
					
					pre4.execute();
				}
				else{
					System.out.print(pack.getServiceList().get(intCtr).getService().getIntServiceID());
					PreparedStatement pre4 = con.prepareStatement(strQuery6);
					pre4.setInt(1, pack.getIntPackageID());
					pre4.setInt(2, pack.getServiceList().get(intCtr).getService().getIntServiceID());
					pre4.setInt(3, pack.getServiceList().get(intCtr).getIntQuantity());
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
					pre4.setInt(2, pack.getProductList().get(intCtr).getIntProductQuantity());
					pre4.setInt(3, pack.getProductList().get(intCtr).getIntStatus());
					
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
			
//			System.out.println(deactivatedServices.size());
//			
//			for(int i = 0; i < deactivatedServices.size(); i++){
//				
//				PreparedStatement update = con.prepareStatement(strQuery2);
//				update.setInt(1, pack.getIntPackageID());
//				update.setInt(2, 0);
//				update.setInt(3, deactivatedServices.get(i).getIntQuantity());
//				
//				update.execute();
//				update.close();
//			}	
//			
//			System.out.println(deactivatedProducts.size());
//			
//			for(int i = 0; i < deactivatedProducts.size(); i++){
//				PreparedStatement update = con.prepareStatement(strQuery3);
//				update.setInt(1, deactivatedProducts.get(i).getIntProductPackageID());
//				update.setInt(2, deactivatedProducts.get(i).getIntProductQuantity());
//				update.setInt(3, 0);
//				
//				update.execute();
//				update.close();
//			}	
			
			con.close();
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
