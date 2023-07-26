package kr.co.jhta.pony.control;


import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.jhta.pony.dto.PonyMemberDTO;
import kr.co.jhta.pony.security.service.PonyMemberService;

@Controller
public class MyPageController {
	
	@Autowired
	PonyMemberService service;
	
	
	@GetMapping("/mypage")
	public String mypage(Principal p, Model model, HttpSession session) {
//		model.addAttribute("dto",service.memberAll());
		//model.addAttribute("p", p.getName());
		// 사용자 정보 
		// Member m = dao.getMember(p.pgeName());
		
		PonyMemberDTO dto =  service.getMemberEmail(p.getName());
		session.setAttribute("dto", dto);
		
				
		return "mypage/mypage";
	}
	
	@GetMapping("/mypageqna")
	public String mypageQna() {
		return "mypage/mypageQna";
	}
}
