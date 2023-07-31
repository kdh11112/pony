package kr.co.jhta.pony.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.pony.dao.OrderDAO;
import kr.co.jhta.pony.dao.OrderDetailDAO;
import kr.co.jhta.pony.dto.OrderDTO;
import kr.co.jhta.pony.dto.OrderDetailDTO;
import kr.co.jhta.pony.dto.StartEnd;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class OrderServiceImple implements OrderService{
	
	private final OrderDAO orderdao;
	private final OrderDetailDAO orderDetaildao;
	
	@Autowired
	public OrderServiceImple(OrderDAO odao, OrderDetailDAO oddao) {
		this.orderdao = odao;
		this.orderDetaildao = oddao;
	}
	
	@Override
	public List<OrderDTO> getAllByAdmin(int startNo, int endNo) {
		StartEnd se = new StartEnd(startNo, endNo);
		return orderdao.getAllByAdmin(se);
	}

	@Override
	public OrderDTO selectOne(int OrderNo) {
		return orderdao.selectOne(OrderNo);
	}

	@Override
	public int getTotal() {
		return orderdao.getTotal();
	}

	@Override
	public void deleteOne(OrderDTO dto) {
		orderdao.deleteOne(dto);
		
	}

	@Override
	public int calculateOrderTotal(int orderNo) {
		// 주문 부품 전체 가격
		int totalItemPrice = orderDetaildao.getOrderTotalPrice(orderNo);
        // 배송비
		int deliveryCharge = orderdao.getOrderDeliveryCharge(orderNo);
        // 사용 포인트
		int pointUsed = orderdao.getOrderPoint(orderNo);

		// 총 금액 = 주문 부품 전체 가격 + 배송비 - 사용 포인트
        int orderTotal = totalItemPrice + deliveryCharge - pointUsed;
        return orderTotal;
	}

	@Override
	public void updateOrderTotal(int orderNo, int orderTotal) {
		orderdao.updateOrderTotal(orderNo, orderTotal);
	}

	// 배송상태 변경 (배송준비중 => 배송중)
	// 배송상태변경 -지울ㄹ지도,,
	@Override
	public void changeDelivery(String no) {
		orderdao.changeDelivery(no);
	}

}

