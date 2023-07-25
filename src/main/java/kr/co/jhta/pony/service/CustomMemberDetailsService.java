package kr.co.jhta.pony.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.co.jhta.pony.dao.PonyMemberDAO;
import kr.co.jhta.pony.dto.PonyMemberDTO;

@Service("userDetailService")
public class CustomMemberDetailsService implements UserDetailsService {

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
		
		
		AccountContext accountContext = new AccountContext(dto, roles);
		
		return accountContext;
	}

}
