package kr.co.jhta.pony.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PonyMemberDTO {
	
	
	private int memberNo;
	private int memberSosialNo;
	private String memberEmail;
	private String memberPassword;
	private String membername;
	private String memberBirthday;
	private String memberPhone;
	private String memberZip;
	private String memberAddress1;
	private String memberAddress2;
	private int memberPoint;
	private String memberType;
	private String memberUseYn;
	private int memberLoginCounter;
	private String memberAccountStatus;
	
	
	
	
	
	
}
