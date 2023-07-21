package kr.co.jhta.pony.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WebManagerController {
	@GetMapping("/notice")
	public String notice() {
		return "noticelist";
	}
	@GetMapping("/notice")
		public String noticeInsert() {
			return "noticewriteform";
	}
}
