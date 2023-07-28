package kr.co.jhta.pony.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.pony.dto.ShopDTO;
import kr.co.jhta.pony.service.ShopService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TestDriveController {
	
	@Autowired
	private ShopService ss;

	@GetMapping("/testDrive")
	public String test() {
		return "testDrive";
	}
	
	@GetMapping("/shopFind")
	@ResponseBody
	public List<ShopDTO> shopFind(@RequestParam("shopAreaFind")String shopArea, Model model) {
//		model.addAttribute("shop", ss.ShopOne(shopArea));
		log.info(""+ss.ShopOne(shopArea));
		return ss.ShopOne(shopArea);
	}
	
}
