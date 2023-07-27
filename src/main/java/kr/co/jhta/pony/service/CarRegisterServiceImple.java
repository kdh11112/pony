package kr.co.jhta.pony.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.pony.dao.CarRegisterDAO;
import kr.co.jhta.pony.dto.CarRegisterDTO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CarRegisterServiceImple implements CarRegisterService{
	
	@Autowired
	CarRegisterDAO dao;

	@Override
	public void carRegister(CarRegisterDTO regCarDTO) {
		dao.ClientInsert(regCarDTO);
		int no = dao.ClientSelectNo(regCarDTO);
		log.info("회원번호 : "+no);
		dao.CarInsert(regCarDTO,no);
		
	}

	@Override
	public List<CarRegisterDTO> modalSearch(String clientVin, String clientCarNumber, String memberName) {

		return dao.SearchSelect(clientVin,clientCarNumber,memberName);
		
	}


	@Override
	public CarRegisterDTO regRegistration(String clientVin) {
		return dao.regRegistrationSelect(clientVin);
	}

	@Override
	public void regAndcorr(CarRegisterDTO regCarDTO) {
		
		dao.regAndcorrInsertAndUpdate(regCarDTO);
		
	}


}
