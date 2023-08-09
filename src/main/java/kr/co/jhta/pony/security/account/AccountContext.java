package kr.co.jhta.pony.security.account;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import kr.co.jhta.pony.dto.PonyMemberDTO;
import lombok.Getter;

@Getter //계정 정보  User라는 형태에 맞춰서 계정정보를 저장한다.
public class AccountContext extends User {

	private final PonyMemberDTO dto;

	public AccountContext(PonyMemberDTO dto , Collection<? extends GrantedAuthority> authorities) {
		super(dto.getMemberEmail(), dto.getMemberPassword(), authorities);
		this.dto = dto;
		
	}
	
	public PonyMemberDTO getAccount() {
		return dto;
	}
	

}
