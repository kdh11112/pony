package kr.co.jhta.pony.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.pony.dao.OrderDetailDAO;
import kr.co.jhta.pony.dto.OrderDetailDTO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class OrderDetailServiceImple implements OrderDetailService{

	private final OrderDetailDAO dao;
	
	@Autowired
	public OrderDetailServiceImple(OrderDetailDAO orderDetaildao) {
		this.dao = orderDetaildao;
	}
	
	@Override
	public List<OrderDetailDTO> getOrderDetailsByOrderNo(int orderNo) {
		return dao.getOrderDetailsByOrderNo(orderNo);
	}

}
