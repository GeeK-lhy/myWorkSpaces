package com.oracle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.dao.MaterialsDao;
import com.oracle.vo.TrainingMaterials;

@Service
public class MaterialsService {
	@Autowired
	MaterialsDao dao;
	public void saveMaterials(TrainingMaterials tm) {
		dao.saveMaterials(tm);
	}
	public List<TrainingMaterials> selectVedioMaterials(){
		return dao.selectVedioMaterials();
	}
	public List<TrainingMaterials> selectMaterials(){
		return dao.selectMaterials();
	}
}
