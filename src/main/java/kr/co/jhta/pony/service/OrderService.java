package kr.co.jhta.pony.service;

import java.util.List;

import kr.co.jhta.pony.dto.OrderDTO;
import kr.co.jhta.pony.dto.StartEnd;

public interface OrderService {
	OrderDTO selectOne(int OrderNo);
	int getTotal();
	void deleteOne(OrderDTO dto);
	List<OrderDTO> getAllByAdmin(int startNo, int endNo);
}
