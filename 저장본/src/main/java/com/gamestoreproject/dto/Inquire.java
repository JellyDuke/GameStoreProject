package com.gamestoreproject.dto;

public class Inquire {
	private String icode;
	private String imcode;
	private String icontent;
	private String idate;
	private String iredate;
	private String irecontent;
	private String ititle;
	
	public String getIcode() {
		return icode;
	}

	public void setIcode(String icode) {
		this.icode = icode;
	}

	public String getImcode() {
		return imcode;
	}

	public void setImcode(String imcode) {
		this.imcode = imcode;
	}

	public String getIcontent() {
		return icontent;
	}

	public void setIcontent(String icontent) {
		this.icontent = icontent;
	}

	public String getIdate() {
		return idate;
	}

	public void setIdate(String idate) {
		this.idate = idate;
	}

	public String getIredate() {
		return iredate;
	}

	public void setIredate(String iredate) {
		this.iredate = iredate;
	}

	public String getIrecontent() {
		return irecontent;
	}

	public void setIrecontent(String irecontent) {
		this.irecontent = irecontent;
	}

	public String getItitle() {
		return ititle;
	}

	public void setItitle(String ititle) {
		this.ititle = ititle;
	}

	@Override
	public String toString() {
		return "Inquire [icode=" + icode + ", imcode=" + imcode + ", icontent=" + icontent + ", idate=" + idate
				+ ", iredate=" + iredate + ", irecontent=" + irecontent + ", ititle=" + ititle + "]";
	}
	
}
