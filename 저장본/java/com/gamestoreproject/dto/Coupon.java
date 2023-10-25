package com.gamestoreproject.dto;

public class Coupon {
	private String ccode;
	private String ctype;
	private String cregist;
	private String cpercent;
	private String cdeadline;
	private String cused;
	private String cowner;
	private String cdate;
	private String cstack;
	private String cnumber;
	private String datecheck;
	public String getCcode() {
		return ccode;
	}
	public void setCcode(String ccode) {
		this.ccode = ccode;
	}
	public String getCtype() {
		return ctype;
	}
	public void setCtype(String ctype) {
		this.ctype = ctype;
	}
	public String getCregist() {
		return cregist;
	}
	public void setCregist(String cregist) {
		this.cregist = cregist;
	}
	public String getCpercent() {
		return cpercent;
	}
	public void setCpercent(String cpercent) {
		this.cpercent = cpercent;
	}
	public String getCdeadline() {
		return cdeadline;
	}
	public void setCdeadline(String cdeadline) {
		this.cdeadline = cdeadline;
	}
	public String getCused() {
		return cused;
	}
	public void setCused(String cused) {
		this.cused = cused;
	}
	public String getCowner() {
		return cowner;
	}
	public void setCowner(String cowner) {
		this.cowner = cowner;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public String getCstack() {
		return cstack;
	}
	public void setCstack(String cstack) {
		this.cstack = cstack;
	}
	public String getCnumber() {
		return cnumber;
	}
	public void setCnumber(String cnumber) {
		this.cnumber = cnumber;
	}
	public String getDatecheck() {
		return datecheck;
	}
	public void setDatecheck(String datecheck) {
		this.datecheck = datecheck;
	}
	@Override
	public String toString() {
		return "Coupon [ccode=" + ccode + ", ctype=" + ctype + ", cregist=" + cregist + ", cpercent=" + cpercent
				+ ", cdeadline=" + cdeadline + ", cused=" + cused + ", cowner=" + cowner + ", cdate=" + cdate
				+ ", cstack=" + cstack + ", cnumber=" + cnumber + ", datecheck=" + datecheck + "]";
	}
}
