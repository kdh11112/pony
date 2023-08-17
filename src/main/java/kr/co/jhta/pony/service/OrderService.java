package kr.co.jhta.pony.service;

import java.util.List;

import kr.co.jhta.pony.dto.MemberDTO;
import kr.co.jhta.pony.dto.OrderDTO;
import kr.co.jhta.pony.dto.OrderDetailDTO;
import kr.co.jhta.pony.dto.OrderPageItemDTO;
import kr.co.jhta.pony.dto.PartDTO;
import kr.co.jhta.pony.util.Criteria;

public interface OrderService {

	public OrderDTO selectOne(int OrderNo);

	public int getTotal();

	public void deleteOne(OrderDTO dto);

	public List<OrderDTO> getAllByAdmin(Criteria cri);

	// 주문의 총 금액(orderTotal) 계산
	public int calculateOrderTotal(int orderNo);

	// 총 금액 업데이트
	public void updateOrderTotal(int orderNo, int orderTotal);

	public void changeDelivery(String no); // 배송상태변경 -지울ㄹ지도,,

	// 고객 본인의 주문내역 확인
	public List<OrderDTO> getAllByUser(int MemberNo);

	// 주문 정보
	public List<OrderPageItemDTO> getPartsInfo(List<OrderPageItemDTO> orders);

	// 주문 상품 정보(주문처리)
	public OrderDetailDTO getOrderInfo(int partNumber);

	// 주문 테이블 등록
	public int insertOrder(OrderDTO dto);

	// 주문 아이템 디테일 테이블 등록
	public int insertOrderDetail(OrderDetailDTO oddto);

	// 주문 후 멤버 포인트 차감
	public int deductPoint(MemberDTO memdto);

	// 주문 후 재고 차감
	public int deductPartNo(PartDTO partdto);
	
	// 주문처리
	public void order(OrderDTO dto);
}
