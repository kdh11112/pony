package kr.co.jhta.pony.service;

import java.util.List;

import kr.co.jhta.pony.dto.ModelDTO;

public interface ModelService {
	public List<ModelDTO> ModelAll();
	
	public ModelDTO ModelOne(String modelName); // 모델비교에서의 모델정보
}
