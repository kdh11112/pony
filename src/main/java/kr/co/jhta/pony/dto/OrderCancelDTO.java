package kr.co.jhta.pony.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderCancelDTO {

	private String memberNo;
	
	private String orderNo;
	
	// 취소 후 리다이렉트, 페이징 시 필요
	
	private String keyword;
	
	private int pagenum;
	
	private int amount;
	
}
