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
	public boolean updatePackage(Package pack) throws NullPointerException{
		
		Connection con = jdbc.getConnection();
		String strQuery1 = "CALL updatePackage(?, ?, ?, ?, ?, ?, ?)";
		//String strQuery2 = "CALL updateServicePackage(?, ?, ?)";
		//String strQuery3 = "CALL updateProductPackage(?, ?, ?)";
		String strQuery4 = "SELECT * FROM tblServicePackage WHERE intPackageID = ? AND intPackageServiceStatus = 1;";
		String strQuery5 = "SELECT * FROM tblProductPackage WHERE intPackageID = ? AND intProductPackageStatus = 1;";
		String strQuery6 = "CALL createServicePackage(?, ?, ?)";
		String strQuery7 = "CALL createProductPackage(?, ?, ?)";
		String prohibitedQuery = "CALL deletePackageDetails(?);";
		String strQuery2 = "CALL createProductPackage(?, ?, ?)";
		String strQuery3 = "CALL createServicePackage(?, ?, ?)";
		
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
			
			PreparedStatement pre2 = con.prepareStatement(prohibitedQuery);
			pre2.setInt(1, pack.getIntPackageID());
			pre2.execute();
			
			for(int intCtr = 0; intCtr < pack.getServiceList().size(); intCtr++){
				ServicePackage servicePack = pack.getServiceList().get(intCtr);
				Service service1 = servicePack.getService();
				System.out.println(service1.getIntServiceID());
				PreparedStatement pre21 = con.prepareStatement(strQuery3);
				pre21.setInt(1, pack.getIntPackageID());
				pre21.setInt(2, service1.getIntServiceID());
				pre21.setInt(3, servicePack.getIntQuantity());
				pre21.execute();
				pre21.close();
			}
			
			for(int intCtr = 0; intCtr < pack.getProductList().size(); intCtr++){
				ProductPackage productPack = pack.getProductList().get(intCtr);
				Product product1 = productPack.getProduct();
				
				PreparedStatement pre21 = con.prepareStatement(strQuery2);
				pre21.setInt(1, pack.getIntPackageID());
				pre21.setInt(2, product1.getIntProductID());
				pre21.setInt(3, productPack.getIntProductQuantity());
				pre21.execute();
				pre21.close();
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
	public List<Package> getAllPackage() {
		
		Connection con = jdbc.getConnection();
		String query = "SELECT * FROM tblPackage WHERE intPackageStatus = 1;";
		List<Package> packageList = new ArrayList<Package>();
		
		try{
			
			PreparedStatement pre = con.prepareStatement(query);
			ResultSet set = pre.executeQuery();
			
			while(set.next()){
				
				int intID = set.getInt(1);
				String strName = set.getString(2);
				String strDesc = set.getString(3);
				int intType = set.getInt(4);
				int max = set.getInt(5);
				String strAvailability = set.getString(6);
				int intStatus = set.getInt(7);
				double price = 0;
				
				PreparedStatement pre2 = con.prepareStatement("CALL getPackagePrice(?);");
				pre2.setInt(1, intID);
				ResultSet set2 = pre2.executeQuery();
				
				while(set2.next()){
					price = set2.getDouble(1);
				}
				
				Package packagee = new Package(intID, strName, strDesc, intType, max, strAvailability, price, null, null, intStatus);
				packageList.add(packagee);
				pre2.close();
			}
			
			pre.close();
			con.close();
			
			return packageList;
		}
		catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean deactivatePackage(int packageID) {
		
		Connection con = jdbc.getConnection();
		String query = "Call deactivatePackage(?);";
		
		try{
			
			PreparedStatement pre = con.prepareStatement(query);
			pre.setInt(1, packageID);
			
			pre.executeQuery();
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

}
