package com.model;

import java.sql.Timestamp;

public class File {

	private int fid;
	private String fname;
	private String fcontent;
	private String ftype;
	private Timestamp fcreationdate;
	private Timestamp fmodifieddate;
	private int foid;

	public int getFid() {
		return fid;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getFcontent() {
		return fcontent;
	}

	public void setFcontent(String fcontent) {
		this.fcontent = fcontent;
	}

	public String getFtype() {
		return ftype;
	}

	public void setFtype(String ftype) {
		this.ftype = ftype;
	}

	public Timestamp getFcreationdate() {
		return fcreationdate;
	}

	public void setFcreationdate(Timestamp fcreationdate) {
		this.fcreationdate = fcreationdate;
	}

	public Timestamp getFmodifieddate() {
		return fmodifieddate;
	}

	public void setFmodifieddate(Timestamp fmodifieddate) {
		this.fmodifieddate = fmodifieddate;
	}

	public int getFoid() {
		return foid;
	}

	public void setFoid(int foid) {
		this.foid = foid;
	}

}
