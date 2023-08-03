package kr.co.jhta.pony.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.pony.dao.CarRegisterDAO;
import kr.co.jhta.pony.dto.CarRegisterDTO;
import kr.co.jhta.pony.dto.HistroyDTO;
import kr.co.jhta.pony.dto.MechanicRegisterDTO;
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
//	public List<CarRegisterDTO> regRegistration(String clientVin) {
	public CarRegisterDTO regRegistration(String clientVin) {
		return dao.regRegistrationSelect(clientVin);
	}

	@Override
	public void regAndcorr(CarRegisterDTO regCarDTO) {
		
		
		dao.regAndcorrInsert(regCarDTO);
		dao.regAndcorrRemainInsert(regCarDTO);
		
	}
	
	@Override
	public void regAndEdit(CarRegisterDTO carRegisterDTO) {
		
		dao.regAndEditOneUpdate(carRegisterDTO);
		dao.regAndEditTwoUpdate(carRegisterDTO);
		
	}
	

	@Override
	public CarRegisterDTO resNum(int registrationRN, LocalDate registrationDate) {
		return dao.resNumSelect(registrationRN,registrationDate);
	}
	
	


	@Override
	public List<MechanicRegisterDTO> regChiceMechanic(Integer mechanicNo, String mechanicName, int word) {
		return dao.resMechanicSelect(mechanicNo,mechanicName,word);
	}

	@Override
	public MechanicRegisterDTO registrationChiceMechanicInput(int mechanicNo) {
		return dao.registrationChiceMechanicInputSelect(mechanicNo);
	}

	@Override
	public CarRegisterDTO registrationTodayCases() {
		return dao.registrationTodayCases();
	}

	@Override
	public int regAndcorrNumber() {
		
		return dao.regAndcorrNumber();
	}




}
