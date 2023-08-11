package kr.co.jhta.pony.service;

import java.time.LocalDate;
import java.util.List;

import kr.co.jhta.pony.dto.TechnologyAndPartDTO;

public interface TechnologyAndPartService {

	public List<TechnologyAndPartDTO> findAllTechnologyModal(TechnologyAndPartDTO techAndPartDTO);

	public TechnologyAndPartDTO findOneTechnologyNumber(int technologyNumber);

	public List<TechnologyAndPartDTO> findAllPartModal(TechnologyAndPartDTO techAndPartDTO);

	public TechnologyAndPartDTO findOnePartNumber(int partNumber);



}
