package kr.co.jhta.pony.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.pony.dto.ClientDTO;

@Repository
@Mapper
public interface ClientDAO {
	void addOne(ClientDTO dto);

	List<ClientDTO> carList(int memberNo);

	int getOwnedCarCount(int memberNo);

	void deleteOne(String cvin);
}
