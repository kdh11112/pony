package kr.co.jhta.pony.control;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import kr.co.jhta.pony.dto.PonyMemberDTO;
import kr.co.jhta.pony.security.service.PonyMemberService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CarMaintenanceReservationController {
	
	@Autowired
	PonyMemberService memberService;
//	@Autowired
//	CarMaintenanceReservationService carMaintenanceReservationService;
	
	@GetMapping("/carMaintenanceReservation") //정비예약페이지로 이동하는 컨트롤러
	public String carMaintenanceRegistration(Principal p, 
											@ModelAttribute PonyMemberDTO dto,
											HttpSession session,HttpServletRequest req) {
		dto = memberService.getMemberEmail(memberService.getPrincipalEmail(p));
		session.setAttribute("dto", dto);
		int memberNo = dto.getMemberNo();
		dto.setMemberNo(memberNo);
		return "carMaintenanceReservation";
	}
	//------------------------------------예약하기 insert
//	@PostMapping("/insertCarMaintenanceReservation")
//	public String carMaintenanceRegistrationInsert(Principal p ,@ModelAttribute CarRegisterDTO dto,@RequestParam("registrationDate")String testDriveSchedule, @RequestParam("shopNo")int shopNo, @RequestParam("selectedModel")int modelNo, @RequestParam("buttonTime")String testDriveTime,@RequestParam("clientCarNumber") String clientCarNumber) {
//								     //id           인증객체(로그인된 객체) -> p. 
//		PonyMemberDTO dtoUser = memberService.getMemberEmail(memberService.getPrincipalEmail(p));
//		
//		dto.setMemberNo(dtoUser.getMemberNo());
//		dto.setRegistrationDate(registrationDate);
//		dto.setShopNo(shopNo);
//		dto.setModelNo(modelNo);
//		dto.setTestDriveTime(testDriveTime);
//		carMaintenanceReservationService.insertCarMaintenanceReservation(dto);
//		log.info("dto {} 전송됨 ",dto);
//		return "confirmCarMaintenanceReservation";
//	}
	//------------------------------------ 검색 
//	@GetMapping("/shopFind")
//	@ResponseBody
//	public List<ShopDTO> shopArea(@RequestParam("shopAreaFind")String shopArea,@RequestParam("shopAreaFind")String shopAreaPoint, Model model) {
//		model.addAttribute("shop", ss.shopArea(shopArea,shopAreaPoint));
////		log.info(""+ss.shopArea(shopArea,shopAreaPoint));
//		return ss.shopArea(shopArea,shopAreaPoint);
//	}
}
