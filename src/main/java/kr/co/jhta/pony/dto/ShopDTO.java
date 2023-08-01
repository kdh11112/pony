package kr.co.jhta.pony.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ShopDTO {
	
	private int shopNo;
	private String shopArea;
	private String shopAreaPoint;
	private String shopAddr;
	private String shopPhone;
}
