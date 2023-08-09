package kr.co.jhta.pony.control;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.jhta.pony.dto.PonyMemberDTO;
import kr.co.jhta.pony.security.service.PonyMemberService;

@Controller
public class CarMaintenanceReservationController {
	
	@Autowired
	PonyMemberService memberService;
	
	@GetMapping("/carMaintenanceReservation") //정비예약페이지로 이동하는 컨트롤러
	public String carMaintenanceRegistration(Principal p, 
											@ModelAttribute PonyMemberDTO dto,
											HttpSession session,HttpServletRequest req) {
		dto = memberService.getMemberEmail(p.getName());
		session.setAttribute("dto", dto);
		int memberNo = dto.getMemberNo();
		dto.setMemberNo(memberNo);
		return "carMaintenanceReservation";
	}
	//------------------------------------예약하기 insert
	@PostMapping("insertCarMaintenanceReservation")
	public String insertCarMaintenanceReservation() {
		return "confirmCarMaintenanceReservation";
	}
}
