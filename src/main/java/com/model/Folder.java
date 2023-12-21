package com.model;

public class Folder {

	private String foname;
	private int foid;

	public int getFoid() {
		return foid;
	}

	public void setFoid(int foid) {
		this.foid = foid;
	}

	public String getFoname() {
		return foname;
	}

	public void setFoname(String foname) {
		this.foname = foname;
	}

	@Override
	public String toString() {
		return "Folder [foname=" + foname + ", foid=" + foid + "]";
	}
	
	
}
