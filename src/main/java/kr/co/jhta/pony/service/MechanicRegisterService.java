package kr.co.jhta.pony.service;

import java.util.List;

import kr.co.jhta.pony.dto.MechanicRegisterDTO;

public interface MechanicRegisterService {
	
	public List<MechanicRegisterDTO> findAllshopName();

	public void createRegister(int shopNo, String mechanicPw, String mechanicName);

	public void saveChangePw(int mechanicNo,int shopNo, String mechanicPw);

	public boolean isloginCheck(MechanicRegisterDTO dto);

	public int finOneId();

	public MechanicRegisterDTO findOneMechanicName(MechanicRegisterDTO dto);


	
}
