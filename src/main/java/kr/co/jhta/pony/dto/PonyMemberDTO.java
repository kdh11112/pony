package kr.co.jhta.pony.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PonyMemberDTO {
	
	
	private int memberNo;
	private int memberSosialNo;
	private String memberEmail;
	private String memberPassword;
	private String memberName;
	private String memberBirthday;
	private String memberPhone;
	private String memberZip;
	private String memberAddress1;
	private String memberAddress2;
	private int memberPoint;
	private String memberRole;
	private String memberUseYn;
	private String memberAccountStatus;
	private String memberProvider;


}
	
	
	
	
	
