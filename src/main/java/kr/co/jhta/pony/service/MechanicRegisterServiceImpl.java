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
	public void register(int shopNo, String mechanicPw, String mechanicName) {
		int id = dao.employeeId()+1;
		if(mechanicPw == null || mechanicPw.isEmpty()) {
			mechanicPw = ""+shopNo+id;
		}
		dao.registeremployee(shopNo,mechanicPw,mechanicName);
		
	}

	@Override
	public void ChangePw(int mechanicNo,int shopNo, String mechanicPw) {

		dao.updatePw(mechanicNo,shopNo,mechanicPw);
	}

	@Override
	public boolean loginCheck(MechanicRegisterDTO dto) {
		int count = dao.loginCheck(dto);
		
		if(count == 1) {
			return true;
		}
		
		return false;
	}

	@Override
	public int Id() {
		return dao.employeeId();
	}


	


}
