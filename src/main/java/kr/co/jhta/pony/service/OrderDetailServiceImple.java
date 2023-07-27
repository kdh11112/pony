package kr.co.jhta.pony.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.pony.dao.OrderDetailDAO;
import kr.co.jhta.pony.dto.OrderDetailDTO;
import kr.co.jhta.pony.dto.StartEnd;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class OrderDetailServiceImple implements OrderDetailService{

	@Autowired
	private OrderDetailDAO dao;
	
	@Override
	public List<OrderDetailDTO> selectOne(int startNo, int endNo, int orderNo) {
		log.info(" 값 확인 {} {} {}", startNo, endNo, orderNo);
		
		StartEnd se = new StartEnd(startNo, endNo);
		HashMap<String, Object> map = new HashMap<>();
		map.put("startNo", startNo);
		map.put("endNo", endNo);
		map.put("orderNo", orderNo);
		return dao.selectOne(map);
	}

}
