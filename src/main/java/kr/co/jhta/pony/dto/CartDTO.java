package kr.co.jhta.pony.dto;

import javax.validation.constraints.Min;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartDTO {

	// cart 
	private int cartNo;
	
	private int partNumber;
	
	@Min(value=1, message="최소 주문 수량은 1개입니다.")
	private int cartCount;
	
	private int memberNo;
	
	// part
	private String partName;
	
	private int partPrice;
	
	private int partNo;
	
	// model
	private String modelName;
	
	// 추가
	private int cartTotal;
	
	public void cartTotal() {
		this.cartTotal = this.partPrice * this.cartCount;
	}
}
