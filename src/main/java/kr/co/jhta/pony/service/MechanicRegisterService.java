package kr.co.jhta.pony.service;

import java.util.List;

import kr.co.jhta.pony.dto.MechanicRegisterDTO;

public interface MechanicRegisterService {
	
	public List<MechanicRegisterDTO> shopName();

	public void register(int shopNo, String mechanicPw, String mechanicName);

	public void ChangePw(int mechanicNo,int shopNo, String mechanicPw);

	public boolean loginCheck(MechanicRegisterDTO dto);

	public int Id();


	
}
