package com.gss.actions;

import com.gss.model.Discount;
import com.gss.service.DiscountServiceImpl;

public class CreateDiscountAction {

	private String strDiscountName;
	private String strDiscountDetails;
	private String strDiscountType;
	private Double dblDiscountPrice;

	public String execute(){

		DiscountServiceImpl service = new DiscountServiceImpl();
		System.out.println(strDiscountType);
		
		Discount discount = new Discount(1, strDiscountName, strDiscountDetails, Integer.parseInt(strDiscountType), dblDiscountPrice);
		
		if(service.createDiscount(discount) == true)
			return "success";
		else
			return "failed";
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

	public String getStrDiscountType() {
		return strDiscountType;
	}

	public void setStrDiscountType(String strDiscountType) {
		this.strDiscountType = strDiscountType;
	}

	public Double getDblDiscountPrice() {
		return dblDiscountPrice;
	}

	public void setDblDiscountPrice(Double dblDiscountPrice) {
		this.dblDiscountPrice = dblDiscountPrice;
	}

}
