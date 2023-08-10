package kr.co.jhta.pony.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.pony.dto.NoticeDTO;
import kr.co.jhta.pony.dto.OrderDTO;
import kr.co.jhta.pony.dto.StartEnd;
import kr.co.jhta.pony.util.Criteria;

@Repository
@Mapper
public interface OrderDAO {

	/* 관리자 */
	List<OrderDTO> getAllByAdmin(Criteria cri);

	OrderDTO selectOne(int orderNo);

	int getTotal();

	void deleteOne(OrderDTO dto);
	// 배송상태 변경
	void changeDelivery(String no);
	
	/* 고객 주문 */
	//배송비 조회
	int getOrderDeliveryCharge(int orderNo);
	
	//포인트 사용금액 조회
	int getOrderPoint(int orderNo);
	
	//합산된 물건 비용 + 배송비 - 포인트 사용금액 계산 값 orderTotal로 업데이트
	void updateOrderTotal(int orderNo, int orderTotal);

}
