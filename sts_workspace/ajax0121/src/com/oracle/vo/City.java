package com.oracle.vo;

public class City {
	String id;
	String name;
	String pid;
	String root;
	int zone;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getRoot() {
		return root;
	}
	public void setRoot(String root) {
		this.root = root;
	}
	public int getZone() {
		return zone;
	}
	public void setZone(int zone) {
		this.zone = zone;
	}
	public City() {
		super();
	}
	public City(String id, String name, String pid, String root, int zone) {
		super();
		this.id = id;
		this.name = name;
		this.pid = pid;
		this.root = root;
		this.zone = zone;
	}
	@Override
	public String toString() {
		return "City [id=" + id + ", name=" + name + ", pid=" + pid + ", root=" + root + ", zone=" + zone + "]";
	}
	
}
