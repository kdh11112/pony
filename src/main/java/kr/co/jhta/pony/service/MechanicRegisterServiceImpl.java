package kr.co.jhta.pony.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.jhta.pony.dao.MechanicRegisterDAO;
import kr.co.jhta.pony.dto.MechanicRegisterDTO;

@Service
public class MechanicRegisterServiceImpl implements MechanicRegisterService{

	private final int VALID_LOGIN_COUNT = 1;
	
	
	
	MechanicRegisterDAO mechanicRegisterDAO;
	
	public MechanicRegisterServiceImpl(MechanicRegisterDAO mechanicRegisterDAO) {
		this.mechanicRegisterDAO = mechanicRegisterDAO;
	}

	@Override
	public List<MechanicRegisterDTO> findAllshopName() {
		return mechanicRegisterDAO.selectShopNoName();
	}

	@Transactional
	@Override
	public void createRegister(int shopNo, String mechanicPw, String mechanicName) {
		int id = mechanicRegisterDAO.selectEmployeeId()+1;
		if(mechanicPw == null || mechanicPw.isEmpty()) {
			mechanicPw = ""+shopNo+id;
		}
		mechanicRegisterDAO.insertRegisteremployee(shopNo,mechanicPw,mechanicName);
		
	}

	@Transactional
	@Override
	public void saveChangePw(int mechanicNo,int shopNo, String mechanicPw) {

		mechanicRegisterDAO.updatePw(mechanicNo,shopNo,mechanicPw);
	}

	@Override
	public boolean isloginCheck(MechanicRegisterDTO dto) {
		int count = mechanicRegisterDAO.selectLoginCheck(dto);
		
		if(count == VALID_LOGIN_COUNT) {
			return true;
		}
		
		return false;
	}

	@Override
	public int finOneId() {
		return mechanicRegisterDAO.selectEmployeeId();
	}

	@Override
	public MechanicRegisterDTO findOneMechanicName(MechanicRegisterDTO dto) {
		return mechanicRegisterDAO.selectMechanicName(dto);
	}


	


}
