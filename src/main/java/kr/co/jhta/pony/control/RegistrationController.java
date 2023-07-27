package kr.co.jhta.pony.control;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.pony.dto.CarRegisterDTO;
import kr.co.jhta.pony.service.CarRegisterService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class RegistrationController {

	CarRegisterService cs;

	public RegistrationController(CarRegisterService cs) {
		this.cs = cs;
	}

	@GetMapping("/reg")
	public String main() {
		
		return "/registration/main";
	}
	
	@GetMapping("/reg/main")
	public String regMain(HttpSession session) {
		if(session.getAttribute("mechanicNo") != null) {
			return "redirect:/reg";
		}
		return "/reg/login";
	}
	
	@GetMapping("/reg/registration")
	public String regRegistrationok() {
		return "/registration/registration";
	}
	
	@PostMapping("/reg/registration")
	@ResponseBody
	public CarRegisterDTO regRegistration(@RequestParam(name = "clientVin",required = false)String clientVin ,Model model) {
//	    model.addAttribute("reg", cs.regRegistration(clientVin));
//	    log.info("reg : {}",cs.regRegistration(clientVin));
	    return cs.regRegistration(clientVin);
	}
	
	@PostMapping("/reg/registration1")
	@ResponseBody
	public String regRegistrationAndcorrection(@ModelAttribute CarRegisterDTO regCarDTO) {
		CarRegisterDTO.builder()
						.clientVin(regCarDTO.getClientVin())//차대번호
						.clientCarNumber(regCarDTO.getClientCarNumber()) //차량번호
						.clientDistanceDriven(regCarDTO.getClientDistanceDriven()) //주행거리
						.memberEmail(regCarDTO.getMemberEmail())//고객이메일
						.memberName(regCarDTO.getMemberName())//고객명
						.memberPhone(regCarDTO.getMemberPhone())//고객전화번호
						.registrationClientRequests(regCarDTO.getRegistrationClientRequests())//고객요청사항
						.registrationSignificant(regCarDTO.getRegistrationSignificant())//특이사항
						.mechanicNo(regCarDTO.getMechanicNo())//지정정비사
						.registrationDate(regCarDTO.getRegistrationDate())//접수일자
						;
						
		cs.regAndcorr(regCarDTO);
		
		return "/registration/registration";
	}
	
	
	@GetMapping("/reg/carRegister")
	public String regCarRegister() {
		return "/registration/carRegister";
	}
	
	@PostMapping("/reg/carRegister")
	public String regCarCRegisterOk(@ModelAttribute CarRegisterDTO regCarDTO) {
		CarRegisterDTO	.builder()
						.clientVin(regCarDTO.getClientVin())
						.clientCarNumber(regCarDTO.getClientCarNumber())
						.clientDistanceDriven(regCarDTO.getClientDistanceDriven())
						.clientCarType(regCarDTO.getClientCarType())
						.clientProductionDate(regCarDTO.getClientProductionDate())
						.clientShipDate(regCarDTO.getClientShipDate())
						.memberEmail(regCarDTO.getMemberEmail())
						.memberName(regCarDTO.getMemberName())
						.memberPhone(regCarDTO.getMemberPhone())
						.build();
		cs.carRegister(regCarDTO);
		return "/registration/carRegister";
	}
	
	@GetMapping("/reg/modal")
	@ResponseBody
	public List<CarRegisterDTO> regModal(
	        @RequestParam(name ="clientVin", required = false) String clientVin,
	        @RequestParam(name ="clientCarNumber" , required = false) String clientCarNumber,
	        @RequestParam(name ="memberName", required = false) String memberName,
			@ModelAttribute CarRegisterDTO regCarDTO) {

		 

	   return  cs.modalSearch(clientVin, clientCarNumber, memberName);
	}
	
}
