package kr.co.jhta.pony.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberDTO {
	int memberNo;
	int memberSosialNo;
	String memberEmail;
	String memberPassword;
	String memberName;
	String memberBirthday;
	String memberPhone;
	String memberZip;
	String memberAddress1;
	String memberAddress2;
	int  memberPoint;
	String memberType;
	String memberUseYn;
	int memberLoginCounter;
	String memberAccountStatus;
}
