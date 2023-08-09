package kr.co.jhta.pony.security.service;

import java.security.Principal;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import kr.co.jhta.pony.dao.PonyMemberDAO;
import kr.co.jhta.pony.dto.PonyMemberDTO;
import kr.co.jhta.pony.dto.QuestionDTO;
import kr.co.jhta.pony.dto.StartEnd;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class PonyMemberServiceImp implements PonyMemberService {

	@Autowired
	PonyMemberDAO dao;
	
	@Override
	public void generateMember(PonyMemberDTO dto) {
	
		dao.generatePonyMember(dto);
		
	}

	@Override
	public PonyMemberDTO getMemberEmail(String email) {

		return dao.getMemberEmail(email);
	}

	@Override
	public int idChk(PonyMemberDTO dto) throws Exception {
		int result = dao.idChk(dto);
		return result;
	}
	
	@Override
	public Object selectAll(int startNo, int endNo) {
		StartEnd se =  new StartEnd(startNo, endNo);
		return dao.getAll(se); 
	}

	@Override
	public int getTotal() {
		
		return dao.getTotal();
	}

	@Override
	public void increaseHits(int questionNo) {
		dao.increaseHits(questionNo);
		
	}

	@Override
	public Object selectOne(int questionNo) {
		
		return dao.selectOne(questionNo);
	}
	

	@Override
	public void modifyOne(QuestionDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteOne(QuestionDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public PonyMemberDTO selectMem(int memberNo) {
		
		return dao.selectMem(memberNo);
	}

	@Override
	public void myinfomodifyOne(PonyMemberDTO dto) {
		dao.myinfomodifyOne(dto);
		
	}

	@Override
	public Object getMemberPoint(int memberNo) {
		// TODO Auto-generated method stub
		return dao.getMemberPoint(memberNo);
	}
	
	@Override
	public void addUser(PonyMemberDTO dto) {
			dao.addUser(dto);

	}
	


	

	@Override
	public String getPrincipalEmail(Principal principal) {
	    String email = null;

//	    log.info("principal : {}", principal);

	    if (principal instanceof OAuth2AuthenticationToken) {
	        OAuth2AuthenticationToken oauth2Token = (OAuth2AuthenticationToken) principal;
	        OAuth2User oauth2User = oauth2Token.getPrincipal();

	        
	        Map<String, Object> attributes = oauth2User.getAttributes();

	        if (attributes.containsKey("kakao_account")) {
	            Map<String, Object> kakaoAccount = (Map<String, Object>) attributes.get("kakao_account");

	            if (kakaoAccount.containsKey("email")) {
	                email = (String) kakaoAccount.get("email");
	                System.out.println("Kakao Email: " + email);
	            }
	            
	            
	        } else {
	            email = oauth2User.getAttribute("email"); // Use OAuth2User's getAttribute method
	        }
	        
	        
	        
	    } else { // OAuth2User 객체가 없는 경우 (일반 로그인)
	        email = principal.getName(); // 일반 로그인의 사용자명을 가져옴
	    }

	    // log.info("최종 email : {}", email);
	    // email 사용

	    return email;
	}	
	
	
}
