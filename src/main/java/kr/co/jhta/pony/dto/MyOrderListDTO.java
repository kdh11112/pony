package kr.co.jhta.pony.dto;

public class MyOrderListDTO {

	private int partNumber;

	private int orderNo;
	/* 주문수량 */
	private int orderdetailOrderQuantity;
	/* 총 가격 (개당 가격 * 주문 수량) */
	private int orderdetailAmount;

	private String modelName;

	private String partName;

	private int partPrice;

	/* 주문 총 획득 포인트 */
	private int totalSavePoint;

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
}
