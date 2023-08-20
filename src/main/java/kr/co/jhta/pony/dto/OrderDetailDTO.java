package kr.co.jhta.pony.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OrderDetailDTO {

	private int orderDetailNo;
	
	private int partNumber;
	
	private int orderNo;
	/* 주문수량 */
	private int orderdetailOrderQuantity;
	/* 총 가격 (개당 가격 * 주문 수량)*/
	private int orderdetailAmount;
	
	private String modelName;
	
	private String partName;
	
	private int partPrice;
	
	
	/* 상품 한개 구매 시 획득 포인트 */
	private int savePoint;
	
	/* 주문 총 획득 포인트 */
	private int totalSavePoint;
	
	public void initSaleTotal() {
		this.orderdetailAmount = this.partPrice*this.orderdetailOrderQuantity;
		this.savePoint = (int)(Math.floor(this.partPrice*0.05));
		this.totalSavePoint =this.savePoint * this.orderdetailOrderQuantity;
	}
}
