package kr.co.jhta.pony.security.service;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import kr.co.jhta.pony.dto.PonyMemberDTO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CustomOAuth2UserService extends DefaultOAuth2UserService {

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    PonyMemberService service;

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        log.info(">>>>>>>>>>>> userRequest : " + userRequest);
        String clientName = userRequest.getClientRegistration().getClientName();
        log.info("client name : " + clientName);

        // 유저요청정보로 인증사용자 객체 가져오기 (부모클래스(DefaultOAuth2UserService)의 메서드인 loadUser를 사용해서 userRequest를 넣어서)
        OAuth2User oAuth2User = super.loadUser(userRequest);
        // JSON은 맵 형식 (키 : 값(객체, 오브젝트))
        Map<String, Object> map = oAuth2User.getAttributes();
        Set<String> s = map.keySet();
        Iterator<String> it = s.iterator();

        while (it.hasNext()) {
            String gName = it.next();
            log.info(gName + " : " + map.get(gName));
        }

        String email = "";
        String name = "";
        // 구글 로그인 인지 확인
        if (clientName.equals("Google")) {
            email = oAuth2User.getAttribute("email");
            name = oAuth2User.getAttribute("name");
        } else if (clientName.equals("Kakao")) {
            Map<String, Object> map2 = oAuth2User.getAttributes();

            Map<String, Object> map3 = (Map<String, Object>) map2.get("kakao_account");
            Map<String, Object> map4 = (Map<String, Object>) map3.get("profile");

            email = (String) map3.get("email");
            name = (String) map4.get("nickname");
            log.info("카카오 이메일 : " + email);
            log.info("카카오 등록이름 : " + name);
        }

        saveMember(email, name);

        return super.loadUser(userRequest);
    }

    private void saveMember(String email, String name) {
        // 기존에 등록되어 있는 회원인지 확인 후
        PonyMemberDTO dto = service.getMemberEmail(email);
        log.info("멤버 : " + dto);

        // 등록되어 있지 않으면 DB에 추가
        if (dto == null) {
            dto = PonyMemberDTO.builder()
                    .memberEmail(email)
                    .memberPassword(passwordEncoder.encode("aaaa"))
                    .memberName(name)
                    .memberUseYn("Y")
                    .memberAccountStatus("A")
                    .build();
            service.createMember(dto); // member 테이블에만 저장

            // member_role 에는 추가되지 않음
            // service.createMember(dto);
        }
    }
}
