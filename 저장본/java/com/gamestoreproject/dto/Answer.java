package com.gamestoreproject.dto;

public class Answer {
	private String acode;
	private String amid;
	private String atitle;
	private String acontent;
	private String adate;
	private String astate;
	public String getAcode() {
		return acode;
	}
	public void setAcode(String acode) {
		this.acode = acode;
	}
	public String getAmid() {
		return amid;
	}
	public void setAmid(String amid) {
		this.amid = amid;
	}
	public String getAtitle() {
		return atitle;
	}
	public void setAtitle(String atitle) {
		this.atitle = atitle;
	}
	public String getAcontent() {
		return acontent;
	}
	public void setAcontent(String acontent) {
		this.acontent = acontent;
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
		return "Answer [acode=" + acode + ", amid=" + amid + ", atitle=" + atitle + ", acontent=" + acontent
				+ ", adate=" + adate + ", astate=" + astate + "]";
	}
}
