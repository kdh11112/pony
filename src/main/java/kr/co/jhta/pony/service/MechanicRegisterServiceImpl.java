package kr.co.jhta.pony.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import kr.co.jhta.pony.dao.MechanicRegisterDAO;
import kr.co.jhta.pony.dto.MechanicRegisterDTO;

@Service
public class MechanicRegisterServiceImpl implements MechanicRegisterService{

	@Autowired
	MechanicRegisterDAO dao;

	@Override
	public List<MechanicRegisterDTO> shopName() {
		return dao.shopNoName();
	}

	@Override
	public void register(int shopNo, int mechanicPw, String mechanicName) {
		
		dao.registeremployee(shopNo,mechanicPw,mechanicName);
		
	}


	


}
