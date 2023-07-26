package kr.co.jhta.pony.control;


import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticatedPrincipal;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.jhta.pony.dto.PonyMemberDTO;
import kr.co.jhta.pony.service.PonyMemberService;

@Controller
public class MyPageController {

	@Autowired
	PonyMemberService service;

	@GetMapping("/mypage")
	public String mypage(Principal p, HttpSession session) {
		
		PonyMemberDTO dto  = service.getMemberEmail(p.getName()); //dto에 service에 있는 getMemberEmail 메서드에 인증정보값을 담아 비교?
		session.setAttribute("dto", dto); //세션에 dto값을 담음.
		return "mypage/mypage"; //
	}
	
	@GetMapping("/mypageqna")
	public String mypageQna() {
		return "mypage/mypageQna";
	}
}

