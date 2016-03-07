package com.gss.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.gss.connection.JDBCConnection;
import com.gss.model.ProductPackage;
import com.gss.model.Promo;
import com.gss.model.ServicePackage;

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
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Promo> getAllPromo() {
		
		List<Promo> promoList = new ArrayList<Promo>();
		String query = "SELECT * FROM tblPromo;";
		String query2 = "SELECT * FROM tblServicePromo WHERE intPromoID = ? AND intPromoStatus = 1;";
		String query3 = "SELECT * FROM tblServicePromo WHERE intPromoID = ? AND intPromoStatus = 1;";

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
				
				Promo promo = new Promo(intID, name, desc, price, max, null, null, avail);
				
				promoList.add(promo);
			}
			
			return promoList;
		}
		catch(Exception e){
			System.out.println(e.fillInStackTrace());
			return null;
		}
	}

	
}
