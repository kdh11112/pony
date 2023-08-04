package kr.co.jhta.pony.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.pony.dto.MechanicRegisterDTO;

@Mapper
@Repository
public interface MechanicRegisterDAO {

	public List<MechanicRegisterDTO> selectShopNoName();

	public void insertRegisteremployee(int shopNo, String mechanicPw, String mechanicName);

	public void updatePw(int mechanicNo,int shopNo, String mechanicPw);

	public int selectLoginCheck(MechanicRegisterDTO dto);

	public int selectEmployeeId();

	public MechanicRegisterDTO selectMechanicName(MechanicRegisterDTO dto);


}
