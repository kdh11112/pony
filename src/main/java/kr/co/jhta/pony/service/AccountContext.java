package kr.co.jhta.pony.service;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import kr.co.jhta.pony.dto.PonyMemberDTO;

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
