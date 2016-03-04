package com.gss.actions;

import com.gss.model.Discount;
import com.gss.service.DiscountServiceImpl;

public class CreateDiscountAction {

	private String strDiscountName;
	private String strDiscountDetails;
	private String strDiscountType1;
	private String strDiscountType2;
	private Double dblDiscountPrice;

	public String execute(){

		DiscountServiceImpl service = new DiscountServiceImpl();
		Discount discount;
		String result = "failed";
		
		try{
			if(strDiscountType1.equalsIgnoreCase("on")){
				discount = new Discount(1, strDiscountName, strDiscountDetails, 1, dblDiscountPrice);
				
				if(service.createDiscount(discount) == true)
					result = "success";
			}
				
			return result;
		}
		catch(NullPointerException e){
			discount = new Discount(1, strDiscountName, strDiscountDetails, 2, dblDiscountPrice);

			if(service.createDiscount(discount) == true)
				return "success";
			else
				return "failed";
		}
	}

	public String getStrDiscountName() {
		return strDiscountName;
	}

	public void setStrDiscountName(String strDiscountName) {
		this.strDiscountName = strDiscountName;
	}

	public String getStrDiscountDetails() {
		return strDiscountDetails;
	}

	public void setStrDiscountDetails(String strDiscountDetails) {
		this.strDiscountDetails = strDiscountDetails;
	}

	public Double getDblDiscountPrice() {
		return dblDiscountPrice;
	}

	public void setDblDiscountPrice(Double dblDiscountPrice) {
		this.dblDiscountPrice = dblDiscountPrice;
	}

	public String getStrDiscountType1() {
		return strDiscountType1;
	}

	public void setStrDiscountType1(String strDiscountType1) {
		this.strDiscountType1 = strDiscountType1;
	}

	public String getStrDiscountType2() {
		return strDiscountType2;
	}

	public void setStrDiscountType2(String strDiscountType2) {
		this.strDiscountType2 = strDiscountType2;
	}

}
