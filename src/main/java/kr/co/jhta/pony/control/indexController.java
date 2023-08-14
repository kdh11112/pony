package kr.co.jhta.pony.control;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.jhta.pony.dto.PonyMemberDTO;
import kr.co.jhta.pony.security.service.PonyMemberService;

@Controller
public class indexController {
	
	@Autowired
	PonyMemberService service;
	
	@GetMapping("/")
	public String index(Principal p, Model model) {
		
		if(p!=null) {
		model.addAttribute("username", service.getPrincipalEmail(p));
		}
		
		return "/index";
	}
	
	@GetMapping("/login")
	public String loginPage() {
		return "/ponylogin";
	}

	
	@GetMapping("/ponyreg")
	public String goreg() {
		return "/ponyregistration";
	}
	
	@PostMapping("/login")
	public String loginOk() {
		return "/ponylogin";
	}
	
//	@GetMapping("/testuser")
//	public String testuser(Principal principal, Model model, @AuthenticationPrincipal AccountContext userAccount) {
//		model.addAttribute("name", principal.getName());
//		return "/textview";
//	}
	
}
