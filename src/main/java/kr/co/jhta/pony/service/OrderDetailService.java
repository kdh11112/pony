package kr.co.jhta.pony.service;

import java.util.List;

import kr.co.jhta.pony.dto.OrderDetailDTO;

public interface OrderDetailService {

	public List<OrderDetailDTO> getOrderDetailsByOrderNo(int orderNo);
	
}
