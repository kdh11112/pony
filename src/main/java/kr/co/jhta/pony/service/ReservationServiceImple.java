package kr.co.jhta.pony.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.pony.dao.ReservationDAO;
import kr.co.jhta.pony.dto.ReservationDTO;

@Service
public class ReservationServiceImple implements ReservationService{

	@Autowired
	ReservationDAO dao;
	
	@Override
	public List<ReservationDTO> getReservationList(int memberNo) {
		return dao.getReservationList(memberNo);
	}

	@Override
	public void deleteReservation(int reservationNo) {
		dao.deleteReservation(reservationNo);
		
	}

	@Override
	public void insertCarMaintenanceReservation(ReservationDTO dto) {
		dao.insertCarMaintenanceReservation(dto);
		
	}

}
