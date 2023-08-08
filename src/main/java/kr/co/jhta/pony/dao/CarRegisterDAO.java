package kr.co.jhta.pony.dao;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.pony.dto.CarRegisterDTO;
import kr.co.jhta.pony.dto.MechanicRegisterDTO;
import lombok.extern.slf4j.Slf4j;

@Mapper
@Repository
public interface CarRegisterDAO {

	public void CarInsert(CarRegisterDTO regCarDTO, int no);

	public void ClientInsert(CarRegisterDTO regCarDTO);

	public int ClientSelectNo(CarRegisterDTO regCarDTO);

	public List<CarRegisterDTO> SearchSelect(String clientVin, String clientCarNumber, String memberName);

//	public List<CarRegisterDTO> regRegistrationSelect(String clientVin);
	public CarRegisterDTO regRegistrationSelect(String clientVin);

	public void regAndcorrInsert(CarRegisterDTO regCarDTO);

	public CarRegisterDTO resNumSelect(int registrationNumber, LocalDate registrationDate);

	public List<MechanicRegisterDTO> resMechanicSelect(Integer mechanicNo, String mechanicName, int word);

	public MechanicRegisterDTO registrationChiceMechanicInputSelect(int mechanicNo);
	
	public CarRegisterDTO registrationTodayCases();

	public void regAndEditUpdate(CarRegisterDTO carRegisterDTO);

	public List<CarRegisterDTO> getCarRegistrationList(int memberNo);

	public void deleteCarRegister(int registrationNumber);

}
