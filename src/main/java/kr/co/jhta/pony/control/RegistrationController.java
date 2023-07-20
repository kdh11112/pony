package kr.co.jhta.pony.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RegistrationController {

	@GetMapping("/reg")
	public String main() {
		
		return "/registration/registration";
	}
	
	@GetMapping("/login/reg")
	public String login() {
		
		return "/registration/login";
	}
}
