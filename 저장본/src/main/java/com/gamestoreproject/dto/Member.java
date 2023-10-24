package com.gamestoreproject.dto;

import org.springframework.web.multipart.MultipartFile;

public class Member {
	private String mid;
	private String mpw;
	private String mname;
	private String mnickname;
	private int mpoint;
	private String mprofile;
	private String mstate;
	private String mdate;
	
	private MultipartFile bfile; //첨부파일

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMpw() {
		return mpw;
	}

	public void setMpw(String mpw) {
		this.mpw = mpw;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMnickname() {
		return mnickname;
	}

	public void setMnickname(String mnickname) {
		this.mnickname = mnickname;
	}

	public int getMpoint() {
		return mpoint;
	}

	public void setMpoint(int mpoint) {
		this.mpoint = mpoint;
	}

	public String getMprofile() {
		return mprofile;
	}

	public void setMprofile(String mprofile) {
		this.mprofile = mprofile;
	}

	public String getMstate() {
		return mstate;
	}

	public void setMstate(String mstate) {
		this.mstate = mstate;
	}

	public String getMdate() {
		return mdate;
	}

	public void setMdate(String mdate) {
		this.mdate = mdate;
	}

	public MultipartFile getBfile() {
		return bfile;
	}

	public void setBfile(MultipartFile bfile) {
		this.bfile = bfile;
	}

	@Override
	public String toString() {
		return "Member [mid=" + mid + ", mpw=" + mpw + ", mname=" + mname + ", mnickname=" + mnickname + ", mpoint="
				+ mpoint + ", mprofile=" + mprofile + ", mstate=" + mstate + ", mdate=" + mdate + ", bfile=" + bfile
				+ "]";
	}

	
}
