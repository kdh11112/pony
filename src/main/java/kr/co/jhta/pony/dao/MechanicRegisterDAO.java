package kr.co.jhta.pony.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.pony.dto.MechanicRegisterDTO;

@Mapper
@Repository
public interface MechanicRegisterDAO {

	public List<MechanicRegisterDTO> shopNoName();

	public void registeremployee(int shopNo, int mechanicPw, String mechanicName);


}
