package kr.co.jhta.pony.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.jhta.pony.dao.CartDAO;
import kr.co.jhta.pony.dao.OrderDAO;
import kr.co.jhta.pony.dao.OrderDetailDAO;
import kr.co.jhta.pony.dao.PartDAO;
import kr.co.jhta.pony.dao.PonyMemberDAO;
import kr.co.jhta.pony.dto.CartDTO;
import kr.co.jhta.pony.dto.MemberDTO;
import kr.co.jhta.pony.dto.OrderCancelDTO;
import kr.co.jhta.pony.dto.OrderDTO;
import kr.co.jhta.pony.dto.OrderDetailDTO;
import kr.co.jhta.pony.dto.OrderPageItemDTO;
import kr.co.jhta.pony.dto.PartDTO;
import kr.co.jhta.pony.dto.PonyMemberDTO;
import kr.co.jhta.pony.util.Criteria;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class OrderServiceImple implements OrderService {

	private final OrderDAO orderdao;
	private final OrderDetailDAO orderDetaildao;
	private final PonyMemberDAO ponyMemberdao;
	private final CartDAO cartdao;
	private final PartDAO partdao;

	@Autowired
	public OrderServiceImple(OrderDAO odao, OrderDetailDAO oddao, PonyMemberDAO pmdao, CartDAO cdao, PartDAO pdao) {
		this.orderdao = odao;
		this.orderDetaildao = oddao;
		this.ponyMemberdao = pmdao;
		this.cartdao = cdao;
		this.partdao = pdao;
	}

	// 전체 목록(페이징)
	@Override
	public List<OrderDTO> getAllByAdmin(Criteria cri) {
		return orderdao.getAllByAdmin(cri);
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
	@Transactional
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
	@Transactional
	public void updateOrderTotal(int orderNo, int orderTotal) {
		orderdao.updateOrderTotal(orderNo, orderTotal);
	}

	// 배송상태 변경 (배송준비중 => 배송중)
	// 배송상태변경 -지울ㄹ지도,,
	@Override
	public void changeDelivery(String no) {
		orderdao.changeDelivery(no);
	}

	@Override
	public List<OrderDTO> getAllByUser(int MemberNo) {
		return orderdao.getAllByUser(MemberNo);
	}

	@Override
	@Transactional
	public List<OrderPageItemDTO> getPartsInfo(List<OrderPageItemDTO> orders) {
		// 주문 페이지에 필요한 상품정보 생성
		List<OrderDTO> result = new ArrayList<OrderDTO>();

		// 전달받은 partNumber를 통해 상품정보 DB에 요청 후 생성해놓은 List 객체의 요소로 하나씩 추가
		return null;
	}

	@Override
	public OrderDetailDTO getOrderInfo(int partNumber) {
		return null;
	}

	@Override
	@Transactional
	public int insertOrderDetail(OrderDetailDTO oddto) {
		return 0;
	}

	@Override
	@Transactional
	public int deductPoint(MemberDTO memdto) {
		return 0;
	}

	@Override
	@Transactional
	public int deductPartNo(PartDTO partdto) {
		return 0;
	}

	@Override
	public int insertOrder(OrderDTO dto) {
		return 0;
	}

	@Override
	@Transactional
	public void order(OrderDTO dto) {
		PonyMemberDTO memdto = ponyMemberdao.selectMemAll(dto.getMemberNo());

		// 주문 정보
		List<OrderDetailDTO> oddto = new ArrayList<>();
		for (OrderDetailDTO orderdetail : dto.getOrders()) {
			OrderDetailDTO orderitem = orderdao.getOrderInfo(orderdetail.getPartNumber());
			// 수량 셋팅
			orderitem.setOrderdetailOrderQuantity(orderdetail.getOrderdetailOrderQuantity());
			log.info("orderitem >>>>>>>>>> "+orderitem);
			// 기본 정보 셋팅
			orderitem.initSaleTotal();
			// List 객체 추가
			oddto.add(orderitem);
		}
		// OrderDTO 셋팅
		dto.setOrders(oddto);
		
		log.info("dtodto");
		dto.getOrderPriceInfo();

		// DB 주문, 주문상품(, 배송정보)넣기

		// OrderNo 만들기 (멤버번호+주문날짜)
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyHHmmss");
		int orderNo = Integer.parseInt(format.format(date));
		dto.setOrderNo(orderNo);

		// DB에 넣기
		orderdao.insertOrder(dto);
		for (OrderDetailDTO odetaildto : dto.getOrders()) {
			odetaildto.setOrderNo(orderNo);
			orderdao.insertOrderDetail(odetaildto);
		}

		// 포인트 변동
		int usePoint = memdto.getMemberPoint();
		usePoint = usePoint - dto.getOrderPoint() + dto.getOrderSavePoint();
		memdto.setMemberPoint(usePoint);

		orderdao.deductPoint(memdto);

		// 재고 변동
		for (OrderDetailDTO odetaildto : dto.getOrders()) {
			// 변동 재고값
			PartDTO part = partdao.getPartsInfo(odetaildto.getPartNumber());
			// 재고 0 이하일때 - 안되게 조건 추가 알아서
			part.setPartNo(part.getPartNo() - odetaildto.getOrderdetailOrderQuantity());
			orderdao.deductPartNo(part);
		}

		// 장바구니에서 삭제
		for (OrderDetailDTO odetaildto : dto.getOrders()) {
			CartDTO cartdto = new CartDTO();
			cartdto.setMemberNo(dto.getMemberNo());
			cartdto.setPartNumber(odetaildto.getPartNumber());

			cartdao.deleteOrderCart(cartdto);
		}
	}

	@Override
	@Transactional
	public void orderCancle(OrderCancelDTO ocdto) {
		/* 주문, 주문상품 객체 */
		/* 회원 */
		PonyMemberDTO member = ponyMemberdao.selectMemAll(Integer.parseInt(ocdto.getMemberNo()));
		log.info(">>>>>>>>> "+member);
		/* 주문상품 */
		List<OrderDetailDTO> ords = orderdao.getOrderItemInfo(ocdto.getOrderNo());
		log.info(">>>>>>>>> "+ords);
		for (OrderDetailDTO ord : ords) {
			ord.initSaleTotal();
			log.info(">>>>>>>>> "+ord);
		}
		/* 주문 */
		OrderDTO ordto = orderdao.getOrders(ocdto.getOrderNo());
		ordto.setOrders(ords);

		ordto.getOrderPriceInfo();

		/* 주문상품 취소 DB */
		orderdao.orderCancle(ocdto.getOrderNo());

		/* 포인트, 재고 변환 */
		/* 포인트 */
		int memberPoint = member.getMemberPoint();
		memberPoint = memberPoint + ordto.getOrderPoint() - ordto.getOrderSavePoint();
		member.setMemberPoint(memberPoint);

		/* DB적용 */
		orderdao.deductPoint(member);

		/* 재고 */
		for (OrderDetailDTO ord : ordto.getOrders()) {
			PartDTO part = partdao.getPartsInfo(ord.getPartNumber());
			part.setPartNo(part.getPartNo() + ord.getOrderdetailAmount());
			orderdao.deductPartNo(part);

		}

	}
}
