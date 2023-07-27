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
	
	private int mechanicNo; //아이디
	private String mechanicPw; //비밀번호
	private String mechanicName; //이름
	
	private int shopNo; //지점번호
	private String shopArea; //지역
	private String shopAreaPoint; //지점

}
