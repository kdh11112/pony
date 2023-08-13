package kr.co.jhta.pony.control;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jhta.pony.dto.PonyMemberDTO;
import kr.co.jhta.pony.dto.ReservationDTO;
import kr.co.jhta.pony.security.service.PonyMemberService;
import kr.co.jhta.pony.service.ReservationService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CarMaintenanceReservationController {
	
	@Autowired
	PonyMemberService memberService;
	@Autowired
	ReservationService reservationService;
	
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
	@PostMapping("/insertCarMaintenanceReservation")
	public String carMaintenanceRegistrationInsert(Principal p ,@ModelAttribute ReservationDTO dto,
			@RequestParam("reservationDate")String reservationDate, @RequestParam("shopNo")int shopNo,
			@RequestParam("reservationDueDate")String reservationDueDate, @RequestParam("reservationClientRequests") String reservationClientRequests,
			@RequestParam("clientCarNumber") String clientCarNumber) {
								     //id           인증객체(로그인된 객체) -> p. 
		PonyMemberDTO dtoUser = memberService.getMemberEmail(memberService.getPrincipalEmail(p));
		
		dto.setMemberNo(dtoUser.getMemberNo());
		dto.setReservationDate(reservationDate);
		dto.setShopNo(shopNo);
		dto.setReservationDueDate(reservationDueDate);
		dto.setReservationClientRequests(reservationClientRequests);
		reservationService.insertCarMaintenanceReservation(dto);
		log.info("dto {} 전송됨 ",dto);
		return "confirmCarMaintenanceReservation";
	}
}
