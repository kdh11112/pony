package kr.co.jhta.pony.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
	
	
}
