package kr.co.jhta.pony.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.pony.dao.ModelDAO;
import kr.co.jhta.pony.dto.ModelDTO;

@Service
public class ModelServiceImple implements ModelService{

	@Autowired
	ModelDAO dao;
	

	@Override
	public ModelDTO ModelOne(String modelName) {
		return dao.ModelOne(modelName);
	}


	@Override
	public List<ModelDTO> ModelAll() {
		return dao.ModelAll();
	}
	

}
