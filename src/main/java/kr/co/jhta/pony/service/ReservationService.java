
package kr.co.jhta.pony.service;

import java.util.List;

import kr.co.jhta.pony.dto.ReservationDTO;
import kr.co.jhta.pony.util.Criteria;

public interface ReservationService {

	List<ReservationDTO> getReservationList(int memberNo); //정비예약내역 리스트

	void deleteReservation(int reservationNo); //정비예약내역 삭제

	void insertCarMaintenanceReservation(ReservationDTO dto); //정비예약내역insert

	public List<ReservationDTO> reservationComplete();
	
	void updateCarMaintenanceReservation(ReservationDTO dto);
	
	// 예약 전체 목록(페이징 적용)
	public List<ReservationDTO> getAllReservation(Criteria cri);
	
	public ReservationDTO selectOne(int reservationNo);

	public int getTotalreservation(String memberName);
	
}
