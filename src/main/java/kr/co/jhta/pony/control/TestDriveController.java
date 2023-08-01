package kr.co.jhta.pony.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.pony.dto.ShopDTO;
import kr.co.jhta.pony.dto.TestDriveDTO;
import kr.co.jhta.pony.service.ShopService;
import kr.co.jhta.pony.service.TestDriveService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TestDriveController {
	
	@Autowired
	private ShopService ss;
	private TestDriveService tds;

	@GetMapping("/testDrive")
	public String test() {
		return "testDrive";
	}
	
	@GetMapping("/shopFind")
	@ResponseBody
	public List<ShopDTO> shopArea(@RequestParam("shopAreaFind")String shopArea,@RequestParam("shopAreaFind")String shopAreaPoint, Model model) {
		model.addAttribute("shop", ss.shopArea(shopArea,shopAreaPoint));
		log.info(""+ss.shopArea(shopArea,shopAreaPoint));
		return ss.shopArea(shopArea,shopAreaPoint);
	}
	
	@GetMapping("/testDriveInsert")
	public String test12() {
		return "redirect:testDrive";
	}
	
	@PostMapping("/testDriveInsert")
	public String test123(@ModelAttribute TestDriveDTO dto,@RequestParam("testDriveSchedule")String testDriveSchedule, @RequestParam("shopNo")int shopNo, @RequestParam("selectedModel")int modelNo, @RequestParam("testDriveTime")String testDriveTime) {
		tds.insertTestDriveSchedule(dto);
		
		return "redirect:testDrive";
	}
	
	
	
}
