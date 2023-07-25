package kr.co.jhta.pony.control;


import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyPageController {
	

	@GetMapping("/mypage")
	public String mypage() {
//		model.addAttribute("dto",service.memberAll());
		return "mypage/mypage";
	}
	
	@GetMapping("/mypageqna")
	public String mypageQna() {
		return "mypage/mypageQna";
	}
}
