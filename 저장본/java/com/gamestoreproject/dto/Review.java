package com.gamestoreproject.dto;

public class Review {
	private String rcode;
	private String rgcode;
	private String rmcode;
	private String rdate;
	private int rscore;
	private String rlike;
	private String rcontent;
	private String rstate;
	public String getRcode() {
		return rcode;
	}
	public void setRcode(String rcode) {
		this.rcode = rcode;
	}
	public String getRgcode() {
		return rgcode;
	}
	public void setRgcode(String rgcode) {
		this.rgcode = rgcode;
	}
	public String getRmcode() {
		return rmcode;
	}
	public void setRmcode(String rmcode) {
		this.rmcode = rmcode;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public int getRscore() {
		return rscore;
	}
	public void setRscore(int rscore) {
		this.rscore = rscore;
	}
	public String getRlike() {
		return rlike;
	}
	public void setRlike(String rlike) {
		this.rlike = rlike;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getRstate() {
		return rstate;
	}
	public void setRstate(String rstate) {
		this.rstate = rstate;
	}
	@Override
	public String toString() {
		return "Review [rcode=" + rcode + ", rgcode=" + rgcode + ", rmcode=" + rmcode + ", rdate=" + rdate + ", rscore="
				+ rscore + ", rlike=" + rlike + ", rcontent=" + rcontent + ", rstate=" + rstate + "]";
	}
	
}
