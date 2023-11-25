package kr.co.jhta.pony.control;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import io.swagger.annotations.Api;
import kr.co.jhta.pony.dto.PonyMemberDTO;
import kr.co.jhta.pony.dto.ShopDTO;
import kr.co.jhta.pony.dto.TestDriveDTO;
import kr.co.jhta.pony.security.service.PonyMemberService;
import kr.co.jhta.pony.service.ModelService;
import kr.co.jhta.pony.service.ShopService;
import kr.co.jhta.pony.service.TestDriveService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@EnableCaching
@Api(tags = "시승신청")
public class TestDriveController {
	
	@Autowired
	private ShopService ss;
	@Autowired
	private TestDriveService tds;
	@Autowired
	private PonyMemberService pms;
	@Autowired
	private ModelService ms;
	
	
	@GetMapping("/testDrive")
	public String test(Model model) {
		model.addAttribute("model", ms.ModelAll());
		return "testDrive";
	}
	
	//지점 Select
	@GetMapping("/shopFind")
	@ResponseBody
	public List<ShopDTO> shopArea(@RequestParam("shopAreaFind")String shopArea,@RequestParam("shopAreaFind")String shopAreaPoint, Model model) {
		model.addAttribute("shop", ss.shopArea(shopArea,shopAreaPoint));
//		log.info(""+ss.shopArea(shopArea,shopAreaPoint));
		log.info("Controller >>>>" + "지점 : "+shopArea);
		return ss.shopArea(shopArea,shopAreaPoint);
	}
	
	//시승일정 추가
	@PostMapping("/addTestDrive")
	public String addTestDrive(Principal p ,@ModelAttribute TestDriveDTO dto,@RequestParam("selectedSchedule")String testDriveSchedule, @RequestParam("selectedShopNo")int shopNo, @RequestParam("selectedModel")int modelNo, @RequestParam("buttonTime")String testDriveTime) {
								     //id           인증객체(로그인된 객체) -> p. 
		PonyMemberDTO dtoUser = pms.getMemberEmail(pms.getPrincipalEmail(p));
		
		if(tds.checkTestDriveSchedule(shopNo, testDriveSchedule, testDriveTime)) {
			// 선택한 데이터가 DB에 있는 데이터와 일치하면 경고창 띄어주기
			return "redirect:/testDrive?alert=true";
		}
		
		dto.setMemberNo(dtoUser.getMemberNo());
		dto.setTestDriveSchedule(testDriveSchedule);
		dto.setShopNo(shopNo);
		dto.setModelNo(modelNo);
		dto.setTestDriveTime(testDriveTime);
		tds.insertTestDriveSchedule(dto);
		log.info("dto {} 전송됨 ",dto);
		return "confirmTestDrive";
	}
	
	// 시승일정 Select
	@GetMapping("/showTestDriveSchedule")
	@ResponseBody
	public List<TestDriveDTO> showTestDriveSchedule(Model model) {
		model.addAttribute("btn", tds.showTestDriveSchedule());
		log.info("btn"+tds.showTestDriveSchedule());
		return tds.showTestDriveSchedule();

	}
	
}