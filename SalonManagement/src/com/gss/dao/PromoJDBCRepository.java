package com.gss.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
		String strQuery3 = "CALL createServicePromo(?, ?);";
		ResultSet set1;
		
		int intID = 0;
		
		try{
			
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
		// TODO Auto-generated method stub
		return null;
	}

	
}
