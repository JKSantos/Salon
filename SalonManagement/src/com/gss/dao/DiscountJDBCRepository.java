package com.gss.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.gss.connection.JDBCConnection;
import com.gss.model.Discount;

public class DiscountJDBCRepository implements DiscountRepository{

	JDBCConnection jdbc = new JDBCConnection();
	
	@Override
	public List<Discount> getAllDiscount() {
		
		Connection con = jdbc.getConnection();
		List<Discount> discountList = new ArrayList<Discount>();
		String strQuery = "SELECT * FROM tblDiscount;";
		ResultSet set;
		
		try{
			
			PreparedStatement pre = con.prepareStatement(strQuery);
			set = pre.executeQuery();
			
			while(set.next()){
				
				int intID = set.getInt(1);
				String strName = set.getString(2);
				String strDesc = set.getString(3);
				int intType = set.getInt(4);
				double dblAmount = set.getDouble(5);
				
				Discount discount = new Discount(intID, strName, strDesc, intType, dblAmount);
				discountList.add(discount);
			}
			
			return discountList;
		}
		catch(Exception e){
			System.out.println(e.fillInStackTrace());
			return null;
		}
	}

	@Override
	public boolean createDiscount(Discount discount) {
		
		Connection con = jdbc.getConnection();
		String strQuery = "CALL createDiscount(?, ? ,?, ?)";
		
		try{
			PreparedStatement pre = con.prepareStatement(strQuery);
			pre.setString(1, discount.getStrDiscountName());
			pre.setString(2, discount.getStrDiscountDesc());
			pre.setInt(3, discount.getIntDiscountType());
			pre.setDouble(4, discount.getDblDiscountAmount());
			
			pre.execute();
			pre.close();
			con.close();
			
			return true;
			
		}
		catch(Exception e){
			System.out.println(e.fillInStackTrace());
			return false;
		}
	}

	@Override
	public boolean updateDiscount(Discount discount) {
		
		Connection con = jdbc.getConnection();
		String query = "CALL updateDiscount(?, ?, ?, ?, ?)";
		
		try{
			
			PreparedStatement pre = con.prepareStatement(query);
			pre.setInt(1, discount.getIntDiscountID());
			pre.setString(2, discount.getStrDiscountName());
			pre.setString(3, discount.getStrDiscountDesc());
			pre.setInt(4, discount.getIntDiscountType());
			pre.setDouble(5, discount.getDblDiscountAmount());
			pre.execute();
			pre.close();
			con.close();
			
			return true;
		}
		catch(Exception e){
			System.out.println(e.fillInStackTrace());
			return false;
		}
	}
	
}
