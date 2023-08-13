package kr.co.jhta.pony.service;

import java.util.List;

import kr.co.jhta.pony.dto.ReservationDTO;

public interface ReservationService {

	List<ReservationDTO> getReservationList(int memberNo); //정비예약내역 리스트

	void deleteReservation(int reservationNo); //정비예약내역 삭제

}
