package kr.co.jhta.pony.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.pony.dto.ReservationDTO;
import kr.co.jhta.pony.util.Criteria;

@Repository
@Mapper
public interface ReservationDAO {

	public List<ReservationDTO> getAllReservation(Criteria cri);
	public ReservationDTO selectOne(int reservationNo);
	int getTotalreservation (String getTotalreservation);
}
