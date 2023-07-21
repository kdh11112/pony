package kr.co.jhta.pony.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MechanicRegisterDTO {
	
	private int mechanicNo;
	private String mechanicPw;
	private String mechanicName;
	
	private int shopNo;
	private String shopArea;
	private String shopAreaPoint;

}
