package com.gamestoreproject.dto;

public class Game {
	private String gcode;
	private String gname;
	private String gcontent;
	private String gsystem;
	private String gpublisher;
	private String gmaker;
	private String grelease;
	private String gmainimg;
	private String gimg;
	private String gvideo;
	private int gprice;
	private double gsale;
	private String gdeadline;
	private String gtag;
	private String gstate;
	public String getGcode() {
		return gcode;
	}
	public void setGcode(String gcode) {
		this.gcode = gcode;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public String getGcontent() {
		return gcontent;
	}
	public void setGcontent(String gcontent) {
		this.gcontent = gcontent;
	}
	public String getGsystem() {
		return gsystem;
	}
	public void setGsystem(String gsystem) {
		this.gsystem = gsystem;
	}
	public String getGpublisher() {
		return gpublisher;
	}
	public void setGpublisher(String gpublisher) {
		this.gpublisher = gpublisher;
	}
	public String getGmaker() {
		return gmaker;
	}
	public void setGmaker(String gmaker) {
		this.gmaker = gmaker;
	}
	public String getGrelease() {
		return grelease;
	}
	public void setGrelease(String grelease) {
		this.grelease = grelease;
	}
	public String getGmainimg() {
		return gmainimg;
	}
	public void setGmainimg(String gmainimg) {
		this.gmainimg = gmainimg;
	}
	public String getGimg() {
		return gimg;
	}
	public void setGimg(String gimg) {
		this.gimg = gimg;
	}
	public String getGvideo() {
		return gvideo;
	}
	public void setGvideo(String gvideo) {
		this.gvideo = gvideo;
	}
	public int getGprice() {
		return gprice;
	}
	public void setGprice(int gprice) {
		this.gprice = gprice;
	}
	public double getGsale() {
		return gsale;
	}
	public void setGsale(double gsale) {
		this.gsale = gsale;
	}
	public String getGdeadline() {
		return gdeadline;
	}
	public void setGdeadline(String gdeadline) {
		this.gdeadline = gdeadline;
	}
	public String getGtag() {
		return gtag;
	}
	public void setGtag(String gtag) {
		this.gtag = gtag;
	}
	public String getGstate() {
		return gstate;
	}
	public void setGstate(String gstate) {
		this.gstate = gstate;
	}
	@Override
	public String toString() {
		return "Game [gcode=" + gcode + ", gname=" + gname + ", gcontent=" + gcontent + ", gsystem=" + gsystem
				+ ", gpublisher=" + gpublisher + ", gmaker=" + gmaker + ", grelease=" + grelease + ", gmainimg="
				+ gmainimg + ", gimg=" + gimg + ", gvideo=" + gvideo + ", gprice=" + gprice + ", gsale=" + gsale
				+ ", gdeadline=" + gdeadline + ", gtag=" + gtag + ", gstate=" + gstate + "]";
	}
	
	
	
}
