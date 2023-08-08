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
    private PonyMemberService ponyMemberService;
    
    @Autowired
    private PasswordEncoder passwordEncoder;
    
    
    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
    	
    	log.info(">>>>>> userRequest : " + userRequest);
        //등록 클라이언트 이름 가져오기
        String clientName = userRequest.getClientRegistration().getClientName();
		log.info("client name : " + clientName );

        
		//유저요청 정보로 인증 사용자 객체 가져오기. 
        OAuth2User oAuth2User = super.loadUser(userRequest);

        Map<String, Object> attributes = oAuth2User.getAttributes(); // 소셜 로그인에서 API가 제공하는 userInfo의 Json 값(유저 정보들)
        Set<String> s = attributes.keySet();
        Iterator<String> it = s.iterator(); 
        
        while(it.hasNext()) {
        	String gName = it.next();
        	log.info(gName + " : " + attributes.get(gName));
        	
        }
        
        String email = "";
        String name = "";
        
        if(clientName.equals("Google")) {
        	email = oAuth2User.getAttribute("email");
        	name = oAuth2User.getAttribute("name");
        }else if(clientName.equals("Kakao")) {
        	Map<String, Object> attribute2 = oAuth2User.getAttributes();
        	
        	Map<String, Object> attribute3 = (Map<String, Object>)attribute2.get("kakao_account");
        	Map<String, Object> attribute4 = (Map<String, Object>)attribute3.get("profile");
        	
        	email = (String)attribute3.get("email");
        	name = (String)attribute4.get("nickname");
        	log.info("카카오 이메일 " + email);
        	log.info("카카오 등록이름 " + name);
        }
        
        saveMember(email, name);
        
        
        return super.loadUser(userRequest);   
    
    }
        
                
    private void saveMember(String email, String name) {
    	// 기존에 등록되어 있는 회원인지 확인
    	
    	PonyMemberDTO dto = ponyMemberService.getMemberEmail(email);
		log.info("멤버 : " + dto);
		
		if(dto==null) {
			dto = PonyMemberDTO.builder()
								.memberEmail(email)
								.memberPassword(passwordEncoder.encode("aaaa"))
								.memberName(name)
								.memberRole("ROLE_USER")
								.memberAccountStatus("A")
								.memberUseYn("Y")
								.build();
			
			ponyMemberService.addUser(dto); // member 테이블에 저장
			
			//member_role에는 추가 안됨.
			//ponyMemberService.addRole();
			
		}
		
    }
    
    
}
