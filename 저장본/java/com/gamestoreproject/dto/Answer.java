package com.gamestoreproject.dto;

public class Answer {
	private String acode;
	private String icode;
	private String amid;
	private String acomment;
	private String adate;
	private String astate;
	
	
	public String getAcode() {
		return acode;
	}


	public void setAcode(String acode) {
		this.acode = acode;
	}


	public String getIcode() {
		return icode;
	}


	public void setIcode(String icode) {
		this.icode = icode;
	}


	public String getAmid() {
		return amid;
	}


	public void setAmid(String amid) {
		this.amid = amid;
	}


	public String getAcomment() {
		return acomment;
	}


	public void setAcomment(String acomment) {
		this.acomment = acomment;
	}


	public String getAdate() {
		return adate;
	}


	public void setAdate(String adate) {
		this.adate = adate;
	}


	public String getAstate() {
		return astate;
	}


	public void setAstate(String astate) {
		this.astate = astate;
	}


	@Override
	public String toString() {
		return "Answer [acode=" + acode + ", icode=" + icode + ", amid=" + amid + ", acomment=" + acomment + ", adate="
				+ adate + ", astate=" + astate + "]";
	}
	
	
	
}
