package kr.co.jhta.pony.control;

import org.springframework.web.bind.annotation.GetMapping;

public class AdminController {

	@GetMapping("/admin")
	public String admin() {
		return "admin";
	}
}
