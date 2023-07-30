package kr.co.jhta.pony.dto;

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
	private String cartCount;
	private int memberNo;
	
	// part
	private String partName;
	private int partNo;
	private int partPrice;
	
}
