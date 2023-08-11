package kr.co.jhta.pony.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.pony.dto.ReservationDTO;

@Repository
@Mapper
public interface ReservationDAO {

	public List<ReservationDTO> getAll();
	public ReservationDTO selectOne(int reservationNo);
}
