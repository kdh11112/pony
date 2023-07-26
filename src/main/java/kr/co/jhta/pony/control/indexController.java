package kr.co.jhta.pony.control;

import java.security.Principal;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.jhta.pony.security.account.AccountContext;

@Controller
public class indexController {
	
	@GetMapping("/")
	public String index() {
		return "/index";
	}
	
	@GetMapping("/login")// 아직 비활성화
	public String loginPage() {
		return "/ponylogin";
	}

	@GetMapping("/no")
	public String nonauthorized() {
		return "/nonauthorized";
	}
	
	@GetMapping("/ponyreg")
	public String goreg() {
		
		return "/ponyregistration";
		
	}
	
	@PostMapping("/login")// 아직 비활성화
	public String loginOk() {
		
		return "/ponylogin";
	}
	
	@GetMapping("/testuser")
	public String testuser(Principal principal, Model model, @AuthenticationPrincipal AccountContext userAccount) {
		
		model.addAttribute("name", principal.getName());
		
		
		
		userAccount.getAccount();
		
		return "/textview";
	}
	
	
}
