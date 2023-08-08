package kr.co.jhta.pony.dto;

import kr.co.jhta.pony.security.account.Role;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PonySocialMemberDTO {
	
	int memberSocialNo;
	int memberSocialMemberNo;
	
	String memberSocialProvider;
	String memberSocialProviderId;
	String memberSocialAccessToken;
	String memberSocialRefreshToken;
	String memberSocialExpiredAt;
	String memberSocialEmail;
	String memberSocialNickName;
	String memberSocialAddress;
	Role memberSocialRole;
	
}
