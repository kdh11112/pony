package kr.co.jhta.pony.security.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.co.jhta.pony.dto.PonyMemberDTO;
import kr.co.jhta.pony.security.account.Role;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CustomUserDetailsService implements UserDetailsService {

    private final PonyMemberService memberService;

    @Autowired
    public CustomUserDetailsService(PonyMemberService memberService) {
        this.memberService = memberService;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        PonyMemberDTO dto = memberService.getMemberEmail(username);

        if (dto == null) {
            throw new UsernameNotFoundException("Username not found: " + username);
        }

        if (!dto.getMemberUseYn().equals("Y")) {
            log.info("User account is locked. Email: " + dto.getMemberEmail() + ", memberUseYn: " + dto.getMemberUseYn());
            throw new LockedException("User account is locked" + dto.getMemberEmail() + dto.getMemberUseYn());
        }

        List<GrantedAuthority> authorities = new ArrayList<>();
        
        //System.out.println("유저디테일 지나가니? 현재 권한 " + dto.getMemberRole() );
        
        if(dto.getMemberRole().equals("ROLE_ADMIN")) {
           authorities.add(new SimpleGrantedAuthority(Role.ADMIN.getValue()));
           //System.out.println("이프 안에 왓어? " );
           
        }else {
        authorities.add(new SimpleGrantedAuthority(Role.USER.getValue()));
        }
        
        return new User(dto.getMemberEmail(), dto.getMemberPassword(), authorities);
    }
}