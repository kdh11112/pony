package kr.co.jhta.pony.service;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.CacheNamespace;

import kr.co.jhta.pony.dto.CarRegisterDTO;
import kr.co.jhta.pony.dto.HistroyDTO;
import kr.co.jhta.pony.dto.MechanicRegisterDTO;
import kr.co.jhta.pony.dto.TechnologyAndPartDTO;


public interface CarRegisterService {
	public void createCarRegister(CarRegisterDTO regCarDTO);

	public List<CarRegisterDTO> findAllmodalSearch(String clientVin, String clientCarNumber, String memberName);

	public CarRegisterDTO findOneregRegistration(String clientVin);

	public void createRegAndcorr(CarRegisterDTO regCarDTO);
	
	public int findOneRegAndcorrNumber();
	
	public CarRegisterDTO findOneResNum(int registrationRN, LocalDate registrationDate);

	public List<MechanicRegisterDTO> findAllRegChiceMechanic(Integer mechanicNo, String mechanicName,int word);

	public MechanicRegisterDTO findOneRegistrationChiceMechanicInput(int mechanicNo);

	public CarRegisterDTO findOneRegistrationTodayCases();

	public void saveRegAndEdit(CarRegisterDTO carRegisterDTO);

	public CarRegisterDTO findOneReg(int registrationRN,LocalDate registrationDate);

	public void saveApproval(HistroyDTO histroyDTO, LocalDate registrationDate, int registrationNumber);
	public void saveApprovalList(List<HistroyDTO> list, int registrationNumber);

	public List<HistroyDTO> findAllPaymentList(int i);


	//public List<CarRegisterDTO> getCarRegistrationList(int memberNo); //사용자의 정비예약내역 list 

	//public void deleteCarRegister(int registrationNumber); //사용자의 정비예약내역 삭제


	
}
