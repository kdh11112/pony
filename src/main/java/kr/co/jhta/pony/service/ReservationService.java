package kr.co.jhta.pony.service;

import java.util.List;

import kr.co.jhta.pony.dto.ReservationDTO;
import kr.co.jhta.pony.util.Criteria;

public interface ReservationService {
		// 예약 전체 목록(페이징 적용)
		public List<ReservationDTO> getAllReservation(Criteria cri);
		
		public ReservationDTO selectOne(int reservationNo);

		public int getTotalreservation(String memberName);

		
		
}
