package kr.co.jhta.pony.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.pony.dto.MemberDTO;
import kr.co.jhta.pony.dto.NoticeDTO;
import kr.co.jhta.pony.dto.OrderDTO;
import kr.co.jhta.pony.dto.OrderDetailDTO;
import kr.co.jhta.pony.dto.OrderPageItemDTO;
import kr.co.jhta.pony.dto.PartDTO;
import kr.co.jhta.pony.dto.PonyMemberDTO;
import kr.co.jhta.pony.dto.StartEnd;
import kr.co.jhta.pony.util.Criteria;

@Repository
@Mapper
public interface OrderDAO {

	/* --------------------- 관리자 ---------------------- */
	List<OrderDTO> getAllByAdmin(Criteria cri);

	OrderDTO selectOne(int orderNo);

	int getTotal();

	void deleteOne(OrderDTO dto);
	// 배송상태 변경
	void changeDelivery(String no);
	
	/* -------------------- 고객 주문 --------------------- */
	// 배송비 조회
	int getOrderDeliveryCharge(int orderNo);
	
	// 포인트 사용금액 조회
	int getOrderPoint(int orderNo);
	
	// 합산된 물건 비용 + 배송비 - 포인트 사용금액 계산 값 orderTotal로 업데이트
	void updateOrderTotal(int orderNo, int orderTotal);

	List<OrderDTO> getAllByUser(int MemberNo);
	
	// 주문 상품 정보(주문 페이지 buypart)
	OrderPageItemDTO getPartsInfo(int partNumber);
	
	// 주문 상품 정보(주문처리)
	OrderDetailDTO getOrderInfo(int partNumber);
	
	// 주문 테이블 등록
	int insertOrder(OrderDTO dto);
	
	// 주문 아이템 디테일 테이블 등록
	int insertOrderDetail(OrderDetailDTO oddto);
	
	// 주문 후 멤버 포인트 차감
	int deductPoint(PonyMemberDTO memdto);
	
	// 주문 후 재고 차감
	int deductPartNo(PartDTO partdto);
	
	// 주문 취소
	int orderCancle(String orderNo);
	
	// 주문 상품 정보 - 주문 취소
	List<OrderDetailDTO> getOrderItemInfo(String orderNo);
	
	// 주문 정보 - 주문 취소
	OrderDTO getOrders(String orderNo);
	
}
