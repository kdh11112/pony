package kr.co.jhta.pony.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.jhta.pony.dao.CarRegisterDAO;
import kr.co.jhta.pony.dto.CarRegisterDTO;
import kr.co.jhta.pony.dto.MechanicRegisterDTO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CarRegisterServiceImple implements CarRegisterService{
	
	CarRegisterDAO carRegisterDAO;
	
	public CarRegisterServiceImple(CarRegisterDAO carRegisterDAO) {
		this.carRegisterDAO = carRegisterDAO;
	}

	@Transactional
	@Override
	public void createCarRegister(CarRegisterDTO regCarDTO) {
		carRegisterDAO.insertClient(regCarDTO);
		int no = carRegisterDAO.selectClientNo(regCarDTO);
		log.info("회원번호 : "+no);
		carRegisterDAO.insertCar(regCarDTO,no);
		
	}

	@Override
	public List<CarRegisterDTO> findAllmodalSearch(String clientVin, String clientCarNumber, String memberName) {

		return carRegisterDAO.selectSearch(clientVin,clientCarNumber,memberName);
		
	}


	@Override
	public CarRegisterDTO findOneregRegistration(String clientVin) {
		return carRegisterDAO.selectRegRegistration(clientVin);
	}

	@Transactional
	@Override
	public void createRegAndcorr(CarRegisterDTO regCarDTO) {
		
		
		carRegisterDAO.insertRegAndcorr(regCarDTO);
		carRegisterDAO.insertRegAndcorrRemain(regCarDTO);
		
	}
	
	@Transactional
	@Override
	public void saveRegAndEdit(CarRegisterDTO carRegisterDTO) {
		
		carRegisterDAO.updateRegAndEditOne(carRegisterDTO);
		carRegisterDAO.updateRegAndEditTwo(carRegisterDTO);
		
	}
	

	@Override
	public CarRegisterDTO findOneResNum(int registrationRN, LocalDate registrationDate) {
		return carRegisterDAO.selectResNum(registrationRN,registrationDate);
	}
	
	


	@Override
	public List<MechanicRegisterDTO> findAllRegChiceMechanic(Integer mechanicNo, String mechanicName, int word) {
		return carRegisterDAO.selectResMechanic(mechanicNo,mechanicName,word);
	}

	@Override
	public MechanicRegisterDTO findOneRegistrationChiceMechanicInput(int mechanicNo) {
		return carRegisterDAO.selectRegistrationChiceMechanicInput(mechanicNo);
	}

	@Override
	public CarRegisterDTO findOneRegistrationTodayCases() {
		return carRegisterDAO.selectRegistrationTodayCases();
	}

	@Override
	public int findOneRegAndcorrNumber() {
		
		return carRegisterDAO.selectRegAndcorrNumber();
	}



	@Override
	public CarRegisterDTO findOneReg(int registrationRN,LocalDate registrationDate) {
		return carRegisterDAO.selectReg(registrationRN,registrationDate);
	}




}
