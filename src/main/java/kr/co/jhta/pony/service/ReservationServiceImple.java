package kr.co.jhta.pony.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.pony.dao.ReservationDAO;
import kr.co.jhta.pony.dto.ReservationDTO;
import kr.co.jhta.pony.util.Criteria;

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

	@Override
	public List<ReservationDTO> reservationComplete() {
		return dao.reservationComplete();
	}

	@Override
	public void updateCarMaintenanceReservation(ReservationDTO dto) {
		dao.updateCarMaintenanceReservation(dto);
		
	}
	
	@Override
	public List<ReservationDTO> getAllReservation(Criteria cri) {
			
		return dao.getAllReservation(cri);
	}

	@Override
	public ReservationDTO selectOne(int reservationNo) {
		
		return dao.selectOne(reservationNo);
	}

	@Override
	public int getTotalreservation(String memberName) {

		return dao.getTotalreservation(memberName);
	}

}
