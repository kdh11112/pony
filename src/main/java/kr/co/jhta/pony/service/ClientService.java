package kr.co.jhta.pony.service;

import java.util.List;

import kr.co.jhta.pony.dto.ClientDTO;

public interface ClientService {

	void addOne(ClientDTO dto);

	List<ClientDTO> selectAll(int memberNo);

	List<ClientDTO> carList(int memberNo);

	public int getOwnedCarCount(int memberNo);

	void deleteOne(String cvin);
	
}
