package kr.co.jhta.pony.security.jwt;

import kr.co.jhta.pony.security.account.Role;
import kr.co.jhta.pony.dto.PonyMemberDTO;
import kr.co.jhta.pony.security.service.PonyMemberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;



import java.util.HashSet;
import java.util.Set;


@Service
public class JwtUserDetailsService implements UserDetailsService {

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private PonyMemberService memberRepository;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        // 1. 회원 이메일로 회원 정보를 조회합니다.
        PonyMemberDTO member = memberRepository.getMemberEmail(email);

        // 2. 회원 정보가 없는 경우, UsernameNotFoundException 예외를 직접 던집니다.
        if (member == null) {
            throw new UsernameNotFoundException(email);
        }

        // 3. 권한 정보를 설정합니다.
        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
        grantedAuthorities.add(new SimpleGrantedAuthority(Role.USER.getValue()));
        if (email.equals("sup2is@gmail.com")) {
            grantedAuthorities.add(new SimpleGrantedAuthority(Role.ADMIN.getValue()));
        }

        // 4. UserDetails 인터페이스의 구현체인 User 객체를 생성하여 리턴합니다.
        //    User 객체는 스프링 시큐리티에서 제공하는 기본 구현체로, 주로 사용자 인증에 활용됩니다.
        //    생성자의 첫 번째 인자는 사용자 이름(여기서는 이메일), 두 번째 인자는 암호화된 비밀번호, 세 번째 인자는 권한 목록입니다.
        return new User(member.getMemberEmail(), member.getMemberPassword(), grantedAuthorities);
    }

    public PonyMemberDTO authenticateByEmailAndPassword(String email, String password) {
        // 1. 회원 이메일로 회원 정보를 조회합니다.
        PonyMemberDTO member = memberRepository.getMemberEmail(email);

        // 2. 회원 정보가 없는 경우, UsernameNotFoundException 예외를 직접 던지거나 null을 리턴할 수 있습니다.
        if (member == null) {
            throw new UsernameNotFoundException(email);
            // 또는 아래와 같이 null을 리턴해도 됩니다.
            // return null;
        }

        // 3. 입력한 비밀번호와 DB에 저장된 암호화된 비밀번호를 비교합니다.
        //    matches() 메서드는 두 비밀번호가 일치하는지 검사하여 true 또는 false를 반환합니다.
        if (!passwordEncoder.matches(password, member.getMemberPassword())) {
            // 4. 비밀번호가 일치하지 않는 경우, BadCredentialsException 예외를 직접 던집니다.
            throw new BadCredentialsException("Password not matched");
        }

        // 5. 인증에 성공한 경우, 회원 정보를 리턴합니다.
        return member;
    }
}