package kr.co.jhta.pony.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.pony.dto.TechnologyAndPartDTO;

@Repository
@Mapper
public interface TechnologyAndPartDAO {

	public List<TechnologyAndPartDTO> selectTechnologyModal(TechnologyAndPartDTO techAndPartDTO);

	public TechnologyAndPartDTO selectTechnologyModalNumber(int technologyNumber);

	public List<TechnologyAndPartDTO> selectPartModal(TechnologyAndPartDTO techAndPartDTO);

	public TechnologyAndPartDTO selectPartModalNumber(int partNumber);

	
}
