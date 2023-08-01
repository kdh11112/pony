package kr.co.jhta.pony.service;

import java.util.List;

import kr.co.jhta.pony.dto.OrderDTO;
import kr.co.jhta.pony.dto.StartEnd;
import kr.co.jhta.pony.util.Criteria;

public interface OrderService {
	
	OrderDTO selectOne(int OrderNo);
	
	int getTotal();
	
	void deleteOne(OrderDTO dto);
	
	List<OrderDTO> getAllByAdmin(Criteria cri);
	
	//주문의 총 금액(orderTotal) 계산
	int calculateOrderTotal(int orderNo);
	
	//총 금액 업데이트
	void updateOrderTotal(int orderNo, int orderTotal);
	
	public void changeDelivery(String no);	//배송상태변경 -지울ㄹ지도,,
}
