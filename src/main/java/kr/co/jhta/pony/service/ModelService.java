package kr.co.jhta.pony.service;

import java.util.List;

import kr.co.jhta.pony.dto.ModelDTO;

public interface ModelService {
	public List<ModelDTO> ModelInfo();
	public ModelDTO ModelOne(String modelName);
}
