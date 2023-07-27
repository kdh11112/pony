package kr.co.jhta.pony.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestDrive {

	@GetMapping("/testDrive")
	public String test() {
		return "testDrive";
	}
}
