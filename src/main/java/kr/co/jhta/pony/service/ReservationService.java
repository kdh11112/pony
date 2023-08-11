package kr.co.jhta.pony.service;

import java.util.List;

import kr.co.jhta.pony.dto.ReservationDTO;

public interface ReservationService {
		// 예약 전체 목록(페이징 적용)
		public List<ReservationDTO> getReservationListAll();
		
		public ReservationDTO selectOne(int reservationNo);
		
		
}
