package com.oracle.vo;

import java.util.Date;

public class TrainingMaterials {
	int trainingMaterials;
	String name;
	String link;
	Date  uploadTime;
	public int getTrainingMaterials() {
		return trainingMaterials;
	}
	public void setTrainingMaterials(int trainingMaterials) {
		this.trainingMaterials = trainingMaterials;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public Date getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}

	
}
