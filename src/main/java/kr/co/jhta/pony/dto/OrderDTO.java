package kr.co.jhta.pony.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OrderDTO {

	private int orderNo;
	
	private String orderDate;
	
	private int memberNo;
	
	private String orderRecipientName;
	
	private String orderRecipientPhone;
	
	private String orderRecipientZip;
	
	private String orderRecipientAddress;
	
	private String orderRecipientAddressDetail;
	
	private String orderStatus;
	
	private int orderDeliveryCharge;
	
	private int orderPoint;
	
	/* 최종 판매 비용 */
	private int orderTotal;
	
	/* 결제수단 */
	private String orderPaymentTool;
	
	/* DB 미존재 데이터 */
	/* 적립 포인트 */
	private int orderSavePoint;
	
	/* 주문상품 */
	private List<OrderDetailDTO> orders;
	
	/* 모든 상품 비용*/
	private int orderPrice;
	
	public void getOrderPriceInfo() {
		/* 상품 비용 & 적립포인트 */
			for(OrderDetailDTO oddto : orders) {
				orderSavePoint += oddto.getTotalSavePoint();
				orderPrice += oddto.getOrderdetailAmount();
				System.out.println("dddD");
			}
		/* 배송비용 */
			if(orderPrice >= 30000) {
				orderDeliveryCharge = 0;
			} else {
				orderDeliveryCharge = 3000;
			}
		/* 최종 비용(상품 비용 + 배송비 - 사용 포인트) */
			orderTotal = orderPrice + orderDeliveryCharge - orderPoint;
	}
}
