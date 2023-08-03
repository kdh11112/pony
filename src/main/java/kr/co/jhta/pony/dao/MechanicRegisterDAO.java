package kr.co.jhta.pony.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.pony.dto.MechanicRegisterDTO;

@Mapper
@Repository
public interface MechanicRegisterDAO {

	public List<MechanicRegisterDTO> shopNoName();

	public void registeremployee(int shopNo, String mechanicPw, String mechanicName);

	public void updatePw(int mechanicNo,int shopNo, String mechanicPw);

	public int loginCheck(MechanicRegisterDTO dto);

	public int employeeId();


}
