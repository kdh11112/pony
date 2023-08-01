package kr.co.jhta.pony.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.pony.dao.ClientDAO;
import kr.co.jhta.pony.dto.ClientDTO;

@Service
public class ClientServiceImple implements ClientService{
	@Autowired
	ClientDAO dao;

	@Override
	public void addOne(ClientDTO dto) {
		dao.addOne(dto);
	}

	@Override
	public List<ClientDTO> selectAll(int memberNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ClientDTO> carList(int memberNo) {
		
		return dao.carList(memberNo);
	}

	@Override
	public int getOwnedCarCount(int memberNo) {
		return dao.getOwnedCarCount(memberNo);
	}

	@Override
	public void deleteOne(String cvin) {
		dao.deleteOne(cvin);
		
	}
	
}
