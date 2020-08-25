package com.oracle.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.oracle.vo.TrainingMaterials;

@Repository
public interface MaterialsDao {
	public void saveMaterials(TrainingMaterials tm);
	public List<TrainingMaterials> selectVedioMaterials();
	public List<TrainingMaterials> selectMaterials();
}
