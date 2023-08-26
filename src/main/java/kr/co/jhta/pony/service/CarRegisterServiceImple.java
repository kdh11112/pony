package kr.co.jhta.pony.service;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.jhta.pony.dao.CarRegisterDAO;
import kr.co.jhta.pony.dto.CarRegisterDTO;
import kr.co.jhta.pony.dto.HistroyDTO;
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

	@Transactional
	@Override
	public void saveApproval(HistroyDTO DTO, LocalDate registrationDate, int registrationNumber) {
		
		if(DTO.getTechnologyNumber() == 0) {
//			carRegisterDAO.insertPartApproval(DTO,registrationDate,registrationNumber);
		}else {
			long start = System.currentTimeMillis();
			carRegisterDAO.insertTechApproval(DTO,registrationDate,registrationNumber);		
			long end = System.currentTimeMillis();
			log.info("기술 실행시간 : {}",(end - start) / 1000.0);
		}
		
	}
	
	@Override
	public void saveApprovalList(List<HistroyDTO> partlist, int registrationNumber) {
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("partList", partlist);
		paramMap.put("registrationNumber", registrationNumber);

		long start = System.currentTimeMillis();
		carRegisterDAO.insertPartApprovalList(paramMap);
		long end = System.currentTimeMillis();
		log.info("부품 실행시간 : {}",(end - start) / 1000.0);
		
		
		
	}

	@Override
	public List<HistroyDTO> findAllPaymentList(int i) {
		return carRegisterDAO.selectPaymentList(i);
	}
//	@Override
//	public List<CarRegisterDTO> getCarRegistrationList(int memberNo) {
//		return dao.getCarRegistrationList(memberNo);
//	}
//
//	@Override
//	public void deleteCarRegister(int registrationNumber) {
//		dao.deleteCarRegister(registrationNumber);
//		
//	}





}
