package kr.co.jhta.pony.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.pony.dto.ModelDTO;

@Repository
@Mapper
public interface ModelDAO {
	public List<ModelDTO> ModelInfo();
	public ModelDTO ModelOne(String modelName);
}
