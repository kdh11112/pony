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
	
	private int orderdetailOrderQuantity;
	
	private int orderdetailAmount;
	
}
