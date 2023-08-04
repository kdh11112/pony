package kr.co.jhta.pony.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.jhta.pony.dao.TechnologyAndPartDAO;
import kr.co.jhta.pony.dto.TechnologyAndPartDTO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class TechnologyServiceImple implements TechnologyAndPartService{

	TechnologyAndPartDAO technologyAndPartDAO;
	
	public TechnologyServiceImple(TechnologyAndPartDAO technologyAndPartDAO) {
		super();
		this.technologyAndPartDAO = technologyAndPartDAO;
	}


	@Override
	public List<TechnologyAndPartDTO> findAllTechnologyModal(TechnologyAndPartDTO techAndPartDTO) {
		return technologyAndPartDAO.selectTechnologyModal(techAndPartDTO);
	}

}
