package com.gss.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.gss.connection.JDBCConnection;
import com.gss.model.Product;
import com.gss.model.ProductPackage;
import com.gss.model.Promo;
import com.gss.model.Service;
import com.gss.model.ServicePackage;
import com.gss.service.ProductService;
import com.gss.service.ProductServiceImpl;
import com.gss.service.ServiceService;
import com.gss.service.ServiceServiceImpl;

public class PromoJDBCRepository implements PromoRepository{

	JDBCConnection jdbc = new JDBCConnection();
	
	@Override
	public boolean createPromo(Promo promo) {
		
		Connection con = jdbc.getConnection();
		String strQuery1 = "CALL createPromo(?, ?, ?, ?, ?);";
		String strQuery2 = "CALL createProductPromo(?, ?, ?);";
		String strQuery3 = "CALL createServicePromo(?, ?, ?);";
		ResultSet set1;
		
		int intID = 0;
		
		try{
			
			System.out.print(promo.getStrPromoAvailability() + " ...." + promo.getStrPromoName());
			
			PreparedStatement pre = con.prepareStatement(strQuery1);
			pre.setString(1, promo.getStrPromoName());
			pre.setString(2, promo.getStrPromoDescription());	
			pre.setInt(3, promo.getIntMaxHeadCount());
			pre.setDouble(4, promo.getDblPromoPrice());
			pre.setString(5, promo.getStrPromoAvailability());
			
			set1 = pre.executeQuery();
			
			while(set1.next()){
				intID = set1.getInt(1);
			}
			
			pre.close();
			set1.close();
			
			for(int intCtr = 0; intCtr < promo.getProductList().size(); intCtr++){
				
				System.out.println("----"+promo.getProductList().size()+"----");
				PreparedStatement pre2 = con.prepareStatement(strQuery2);
				ProductPackage product = promo.getProductList().get(intCtr);
				pre2.setInt(1, intID);
				pre2.setInt(2, product.getProduct().getIntProductID());
				pre2.setInt(3, product.getIntProductQuantity());
				
				pre2.execute();
				pre2.close();
			}
			
			for(int intCtr = 0; intCtr < promo.getServiceList().size(); intCtr++){
				
				PreparedStatement pre2 = con.prepareStatement(strQuery3);
				ServicePackage service = promo.getServiceList().get(intCtr);
				pre2.setInt(1, intID);
				pre2.setInt(2, service.getService().getIntServiceID());
				pre2.setInt(3, service.getIntQuantity());
				
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
	public boolean updatePromo(Promo promo) {
		
		Connection con = jdbc.getConnection();
		String query1 = "CALL updatePromo(?, ?, ?, ?, ?, ?)";
		
		try{
			
			PreparedStatement pre = con.prepareStatement(query1);
			pre.setInt(1, promo.getIntPromoID());
			pre.setString(2, promo.getStrPromoName());
			pre.setString(3, promo.getStrPromoDescription());
			pre.setInt(4, promo.getIntMaxHeadCount());
			pre.setDouble(5, promo.getDblPromoPrice());
			pre.setString(6, promo.getStrPromoAvailability());
			
			pre.execute();
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
			return false;
		}
		
		
	}

	@Override
	public List<Promo> getAllPromo() {
		
		ServiceService serviceService = new ServiceServiceImpl();
		ProductService productService = new ProductServiceImpl();
		
		List<Product> productList = productService.getAllProducts();
		List<Service> serviceList = serviceService.getAllService();
		
		List<ProductPackage> prodPack = new ArrayList<ProductPackage>();
		List<ServicePackage> servPack = new ArrayList<ServicePackage>();
		
		List<Promo> promoList = new ArrayList<Promo>();
		String query = "SELECT * FROM tblPromo;";
		String query2 = "SELECT * FROM tblServicePromo WHERE intPromoID = ? AND intPromoStatus = 1;";
		String query3 = "SELECT * FROM tblProductPromo WHERE intProductPromoID = ? AND intPromoStatus = 1;";

		Connection con = jdbc.getConnection();
		
		try{
			PreparedStatement pre = con.prepareStatement(query);
			ResultSet set = pre.executeQuery();
			
			while(set.next()){
				
				int intID = set.getInt(1);
				String name = set.getString(2);
				String desc = set.getString(3);
				int max = set.getInt(4);
				double price = set.getDouble(5);
				String avail = set.getString(6);
				
				PreparedStatement pre5 = con.prepareStatement(query2);
				pre5.setInt(1, intID);
				ResultSet set4 = pre5.executeQuery();
				
				while(set4.next()){
					
					int intID1 = set4.getInt(1);
					int intPackage = set4.getInt(2);
					int intService = set4.getInt(3);
					int intQuantity1 = set4.getInt(4);
					
					for(int i = 0; i < serviceList.size(); i++){
						Service service1 = serviceList.get(i);
						if(intService == service1.getIntServiceID()){
							ServicePackage service2 = new ServicePackage(intID1, intPackage, service1, intQuantity1, 1);
							servPack.add(service2);
						}
					}
				}
				
				
				
				PreparedStatement pre6 = con.prepareStatement(query3);
				pre6.setInt(1, intID);
				ResultSet set10 = pre6.executeQuery();
				
				while(set10.next()){
					
					int intID1 = set10.getInt(1);
					int intPackage = set10.getInt(2);
					int intProduct = set10.getInt(3);
					int intQuantity1 = set10.getInt(4);
					
					for(int i = 0; i < productList.size(); i++){
						Product product1 = productList.get(i);
						if(intProduct == product1.getIntProductID()){
							ProductPackage service2 = new ProductPackage(intID1, intPackage, product1, intQuantity1, 1);
							prodPack.add(service2);
						}
					}
				}
				
				
				Promo promo = new Promo(intID, name, desc, price, max, servPack, prodPack, avail);
				
				promoList.add(promo);
			}
			
			return promoList;
		}
		catch(Exception e){
			System.out.println(e.fillInStackTrace());
			return null;
		}
	}

	@Override
	public boolean deactivatePromo(int promoID) {
		
		Connection con = jdbc.getConnection();
		String query = "UPDATE tblPromo SET intPromoStatus WHERE intPromoID = ? ";
		
		try{
			
			PreparedStatement pre = con.prepareStatement(query);
			pre.setInt(1, promoID);
			
			pre.execute();
			
			pre.close();
			con.close();
			
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	
}
