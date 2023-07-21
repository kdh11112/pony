package kr.co.jhta.pony.service;

import java.util.List;

import kr.co.jhta.pony.dto.MechanicRegisterDTO;

public interface MechanicRegisterService {
	
	public List<MechanicRegisterDTO> shopName();

	public void register(int shopNo, int mechanicPw, String mechanicName);


	
}
