package kr.co.jhta.pony.service;

import java.time.LocalDate;
import java.util.List;

import kr.co.jhta.pony.dto.CarRegisterDTO;
import kr.co.jhta.pony.dto.MechanicRegisterDTO;


public interface CarRegisterService {
	public void carRegister(CarRegisterDTO regCarDTO);

	public List<CarRegisterDTO> modalSearch(String clientVin, String clientCarNumber, String memberName);

//	public List<CarRegisterDTO> regRegistration(String clientVin);
	public CarRegisterDTO regRegistration(String clientVin);

	public void regAndcorr(CarRegisterDTO regCarDTO);

	public CarRegisterDTO resNum(int registrationNumber, LocalDate registrationDate);

	public List<MechanicRegisterDTO> regChiceMechanic(Integer mechanicNo, String mechanicName,int word);

	public MechanicRegisterDTO registrationChiceMechanicInput(int mechanicNo);

	public CarRegisterDTO registrationTodayCases();

	public void regAndEdit(CarRegisterDTO carRegisterDTO);

	public List<CarRegisterDTO> getCarRegistrationList(int memberNo); //사용자의 정비예약내역 list 

	public void deleteCarRegister(int registrationNumber); //사용자의 정비예약내역 삭제





	
}
