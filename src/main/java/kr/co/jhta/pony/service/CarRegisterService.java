package kr.co.jhta.pony.service;

import java.util.List;

import kr.co.jhta.pony.dto.CarRegisterDTO;
import kr.co.jhta.pony.dto.MechanicRegisterDTO;


public interface CarRegisterService {
	public void carRegister(CarRegisterDTO regCarDTO);

	public List<CarRegisterDTO> modalSearch(String clientVin, String clientCarNumber, String memberName);

//	public List<CarRegisterDTO> regRegistration(String clientVin);
	public CarRegisterDTO regRegistration(String clientVin);

	public void regAndcorr(CarRegisterDTO regCarDTO);

	public List<MechanicRegisterDTO> mechanicChoice(int word);



	
}
