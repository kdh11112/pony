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
import kr.co.jhta.pony.service.MechanicRegisterService;
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
	public String regRegistrationok(Model model, HttpSession session) {
		int word = (Integer)session.getAttribute("shopNo");
		log.info("word: {}",word);
		model.addAttribute("mechanic", cs.mechanicChoice(word));
		
		return "/registration/registration";
	}
	
	@PostMapping("/reg/registration")
	@ResponseBody
//	public List<CarRegisterDTO> regRegistration(@RequestParam(name = "clientVin",required = false)String clientVin ,Model model) {
	public CarRegisterDTO regRegistration(@RequestParam(name = "clientVin",required = false)String clientVin ,Model model) {
//	    model.addAttribute("reg", cs.regRegistration(clientVin));
//	    log.info("reg : {}",cs.regRegistration(clientVin));
	    return cs.regRegistration(clientVin);
	}
	
	@PostMapping("/reg/registrations")
	@ResponseBody
	public void regRegistrationAndcorrection(@ModelAttribute CarRegisterDTO regCarDTO, @RequestParam("mechanicNo") int mechanicNo,HttpSession session) {
		int word = (Integer)session.getAttribute("shopNo");
		
		CarRegisterDTO carRegisterDTO = CarRegisterDTO
	    		.builder()
	            .clientVin(regCarDTO.getClientVin())
	            .clientCarNumber(regCarDTO.getClientCarNumber())
	            .clientDistanceDriven(regCarDTO.getClientDistanceDriven())
	            .memberEmail(regCarDTO.getMemberEmail())
	            .memberName(regCarDTO.getMemberName())
	            .memberPhone(regCarDTO.getMemberPhone())
	            .registrationClientRequests(regCarDTO.getRegistrationClientRequests())
	            .registrationSignificant(regCarDTO.getRegistrationSignificant())
	            .mechanicNo(mechanicNo)
	            .shopNo(word)
	            .registrationDate(regCarDTO.getRegistrationDate())
	            .build();
		cs.regAndcorr(carRegisterDTO);
		 
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
