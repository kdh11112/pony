package kr.co.jhta.pony.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.pony.dto.ReservationDTO;


@Mapper
@Repository
public interface ReservationDAO {

	List<ReservationDTO> getReservationList(int memberNo);

	void deleteReservation(int reservationNo);

}
