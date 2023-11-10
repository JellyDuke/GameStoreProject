package com.gamestoreproject.dto;

import lombok.Data;

@Data
public class Order {
	private String ocode;
	private String odate;
	private String oprice;
	private String ooriginprice;
	private String odiscount;
	private String occode;
	private String oitem;
	private String omcode;
	private String ostate;
	// change
	private String gmainimg;
	private String gcode;
	// change
	public String getOcode() {
		return ocode;
	}
	public void setOcode(String ocode) {
		this.ocode = ocode;
	}
	public String getOdate() {
		return odate;
	}
	public void setOdate(String odate) {
		this.odate = odate;
	}
	public String getOprice() {
		return oprice;
	}
	public void setOprice(String oprice) {
		this.oprice = oprice;
	}
	public String getOoriginprice() {
		return ooriginprice;
	}
	public void setOoriginprice(String ooriginprice) {
		this.ooriginprice = ooriginprice;
	}
	public String getOdiscount() {
		return odiscount;
	}
	public void setOdiscount(String odiscount) {
		this.odiscount = odiscount;
	}
	public String getOccode() {
		return occode;
	}
	public void setOccode(String occode) {
		this.occode = occode;
	}
	public String getOitem() {
		return oitem;
	}
	public void setOitem(String oitem) {
		this.oitem = oitem;
	}
	public String getOmcode() {
		return omcode;
	}
	public void setOmcode(String omcode) {
		this.omcode = omcode;
	}
	public String getOstate() {
		return ostate;
	}
	public void setOstate(String ostate) {
		this.ostate = ostate;
	}
	@Override
	public String toString() {
		return "Order [ocode=" + ocode + ", odate=" + odate + ", oprice=" + oprice + ", ooriginprice=" + ooriginprice
				+ ", odiscount=" + odiscount + ", occode=" + occode + ", oitem=" + oitem + ", omcode=" + omcode
				+ ", ostate=" + ostate + "]";
	}
	
	
}
