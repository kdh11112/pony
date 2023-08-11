package kr.co.jhta.pony.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.pony.dao.ReservationDAO;
import kr.co.jhta.pony.dto.ReservationDTO;

@Service
public class ReservationServiceImple implements ReservationService {

	@Autowired
	ReservationDAO dao;
	
	@Override
	public List<ReservationDTO> getReservationListAll() {
			
		return dao.getAll();
	}

	@Override
	public ReservationDTO selectOne(int reservationNo) {
		
		return dao.selectOne(reservationNo);
	}

//	@Override
//	public List<QuestionDTO> selectAll(int startNo, int endNo, int memberNo) {
//		log.info(" 여기도 오고 있지 {} {} {}", startNo, endNo, memberNo);
//
//
//		StartEnd se = new StartEnd(startNo, endNo);
//
//		//StartEnd se =  new StartEnd(startNo, endNo);
//
//		HashMap<String, Object> map = new HashMap<>();
//
//				map.put("memberNo", memberNo);
//				map.put("startNo", startNo);
//				map.put("endNo", endNo);
//				log.info("map : {} {} {} ", map, map.get("memberNo"), map.get("startNo"));
//
//		return qdao.getAll(map);
//	}
	
}
