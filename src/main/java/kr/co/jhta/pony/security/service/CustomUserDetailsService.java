package kr.co.jhta.pony.security.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.co.jhta.pony.dao.PonyMemberDAO;
import kr.co.jhta.pony.dto.PonyMemberDTO;
import kr.co.jhta.pony.security.account.AccountContext;

@Service("userDetailService") // userDetailService를 아래 클래스로 대체한다.(커스텀을 사용한다.)
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	PonyMemberService service;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		PonyMemberDTO dto = service.getMemberEmail(username);
		
		if(dto == null) {
			throw new UsernameNotFoundException("UsernamNotFoundException");
		}
		
		
		List<GrantedAuthority> roles = new ArrayList<>();
		roles.add(new SimpleGrantedAuthority("ROLE_USER"));
		
		//계정정보(Principal) 생성, Pricipal은 username, userpassword, authorities로 이루어져있다.
		AccountContext accountContext = new AccountContext(dto, roles);
		
		return accountContext;
	}

}
