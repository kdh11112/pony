package kr.co.jhta.pony.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.pony.dao.OrderDAO;
import kr.co.jhta.pony.dto.OrderDTO;
import kr.co.jhta.pony.dto.QuestionDTO;
import kr.co.jhta.pony.dto.StartEnd;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class OrderServiceImple implements OrderService{
	
	@Autowired
	OrderDAO dao;
	
	@Override
	public List<OrderDTO> getAllByAdmin(int startNo, int endNo) {
		StartEnd se = new StartEnd(startNo, endNo);
		return dao.getAllByAdmin(se);
	}

	@Override
	public OrderDTO selectOne(int OrderNo) {
		return dao.selectOne(OrderNo);
	}

	@Override
	public int getTotal() {
		return dao.getTotal();
	}

	@Override
	public void deleteOne(OrderDTO dto) {
		dao.deleteOne(dto);
		
	}

}
