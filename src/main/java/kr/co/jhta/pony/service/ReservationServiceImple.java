package kr.co.jhta.pony.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.pony.dao.ReservationDAO;
import kr.co.jhta.pony.dto.ReservationDTO;
import kr.co.jhta.pony.util.Criteria;

@Service
public class ReservationServiceImple implements ReservationService {

	@Autowired
	ReservationDAO dao;
	
	@Override
	public List<ReservationDTO> getAllReservation(Criteria cri) {
			
		return dao.getAllReservation(cri);
	}

	@Override
	public ReservationDTO selectOne(int reservationNo) {
		
		return dao.selectOne(reservationNo);
	}

	@Override
	public int getTotalreservation() {

		return dao.getTotalreservation();
	}

	
}
