package kr.co.jhta.pony.control;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import io.swagger.annotations.Api;
import kr.co.jhta.pony.dto.ClientDTO;
import kr.co.jhta.pony.dto.PonyMemberDTO;
import kr.co.jhta.pony.dto.ReservationDTO;
import kr.co.jhta.pony.dto.TestDriveDTO;
import kr.co.jhta.pony.security.service.PonyMemberService;
import kr.co.jhta.pony.service.ClientService;
import kr.co.jhta.pony.service.ReservationService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@Api(tags = "정비예약")
public class CarMaintenanceReservationController {
	
	@Autowired
	PonyMemberService memberService;
	@Autowired
	ReservationService reservationService;
	@Autowired
	ClientService cService;
	
	@GetMapping("/carMaintenanceReservation") //정비예약페이지로 이동하는 컨트롤러
	public String carMaintenanceRegistration(Principal p, 
											@ModelAttribute PonyMemberDTO dto,
											HttpSession session,HttpServletRequest req,
											@ModelAttribute ClientDTO clientDTO,Model model) {
		dto = memberService.getMemberEmail(memberService.getPrincipalEmail(p));
		session.setAttribute("dto", dto);
		int memberNo = dto.getMemberNo();
		dto.setMemberNo(memberNo);
		
		List<ClientDTO> userCars = cService.carList(memberNo);
		// 등록된 차량 정보가 없을 경우의 처리
        if (userCars.isEmpty()) {
            model.addAttribute("hasCars", false);
        } else {
            model.addAttribute("hasCars", true);
            model.addAttribute("userCars", userCars);
        }
		session.setAttribute("cdto", clientDTO);
        cService.carList(memberNo);
        

		model.addAttribute("userCars", userCars); //사용자 차량정보 가져오기
		log.info("clientdto {} 전송됨 ",userCars);
		
		
		
		return "carMaintenanceReservation";
	}
	//------------------------------------예약하기 insert
	@PostMapping("/insertCarMaintenanceReservation")
	public String carMaintenanceRegistrationInsert(Principal p ,
		
			@RequestParam("clientCarNumber")String clientCarNumber, 
			@RequestParam("selectedShopNo")int shopNo,
			@RequestParam("selectedSchedule") String reservationDueDate,
			@RequestParam("reservationClientRequests") String reservationClientRequests,
			
			HttpSession session) {
		ReservationDTO dto = new ReservationDTO();
		
		//int shopNo2 = Integer.parseInt(shopNo);
		
		
		log.info(clientCarNumber);
		
		log.info(reservationDueDate);
		
		log.info("눌럿니?");
		PonyMemberDTO dto8 = memberService.getMemberEmail(memberService.getPrincipalEmail(p));
		int memberNo2 = dto8.getMemberNo();
		
		
		dto.setMemberNo(memberNo2);
		
		dto.setShopNo(shopNo);
		dto.setReservationDueDate(reservationDueDate);
		dto.setReservationClientRequests(reservationClientRequests);
		dto.setClientCarNumber(clientCarNumber);
		reservationService.insertCarMaintenanceReservation(dto);
		
		log.info("인서트dto {}",dto);
		return "confirmCarMaintenanceReservation";
	}

	
}
