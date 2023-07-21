package kr.co.jhta.pony.control;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jhta.pony.service.MechanicRegisterService;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class MechanicRegisterController {

	
	MechanicRegisterService rs;


	public MechanicRegisterController(MechanicRegisterService rs) {
		this.rs = rs;
	}

	@GetMapping("/reg/login")
	public String login() {
		
		return "/registration/login";
	}
	
	@GetMapping("/reg/register")
	public String register(Model model) {
		model.addAttribute("list", rs.shopName());
		return "/registration/register";
	}
	
	@PostMapping("/reg/register")
	public String registerOk(@RequestParam(name = "shopNo",required=true) int shopNo,
			@RequestParam("mechanicName") String mechanicName,
			@RequestParam("mechanicPw") int mechanicPw
			) {
		rs.register(shopNo,mechanicPw,mechanicName);
		return "redirect:/reg/login";
	}
}
