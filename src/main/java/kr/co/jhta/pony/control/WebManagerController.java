package kr.co.jhta.pony.control;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class WebManagerController {
	@GetMapping("/notice")
	public String notice(Model model) {
		
		return "noticelist";
	}
	@GetMapping("/notice")
		public String noticeInsert() {
			return "noticewriteform";
	}
}
