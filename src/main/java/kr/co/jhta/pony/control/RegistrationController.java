package kr.co.jhta.pony.control;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
public class RegistrationController {

	@GetMapping("/reg")
	public String main() {
		
		return "/registration/main";
	}
	
	@GetMapping("/reg/main")
	public String regMain(HttpSession session) {
		if(session.getAttribute("mechanicNo") != null) {
			return "redirect:/reg";
		}
		return "/reg/login";
	}
	
	@GetMapping("/reg/registration")
	public String regRegistration() {
		return "/registration/registration";
	}
	
}
