package kr.co.jhta.pony.control;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.pony.dto.CarRegisterDTO;
import kr.co.jhta.pony.dto.MechanicRegisterDTO;
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


	//메인
	@GetMapping("/reg")
	public String main() {
		
		return "/registration/main";
	}
	
	//비로그인 일시 메인 접속 불가
	@GetMapping("/reg/main")
	public String regMain(HttpSession session) {
		if(session.getAttribute("mechanicNo") != null) {
			return "redirect:/reg";
		}
		return "/reg/login";
	}
	
//	@GetMapping("/reg/registration")
//	public String regRegistrationok(Model model, HttpSession session) {
//		int word = (Integer)session.getAttribute("shopNo");
//		log.info("word: {}",word);
//		model.addAttribute("mechanic", cs.mechanicChoice(word));
//		
//		return "/registration/registration";
//	}
	
	//일반접수 -검색
	@GetMapping("/reg/registration")
	public String regRegistrationSearch(Model model,
			@RequestParam(name = "registrationNumber" ,required = false) Integer registrationNumber,
			@RequestParam(name = "registrationDateHi" ,required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate registrationDate
			) {

		if(registrationNumber != null) {
			log.info("되나? {}",cs.resNum(registrationNumber,registrationDate));
	    model.addAttribute("searchOne", cs.resNum(registrationNumber,registrationDate));
		}
		return "/registration/registration";
	}
	
	//모달창
	@GetMapping("/reg/registration/modal")
	@ResponseBody
	public List<CarRegisterDTO> regModal(
	        @RequestParam(name ="clientVin", required = false) String clientVin,
	        @RequestParam(name ="clientCarNumber" , required = false) String clientCarNumber,
	        @RequestParam(name ="memberName", required = false) String memberName,
			@ModelAttribute CarRegisterDTO regCarDTO) {

	   return  cs.modalSearch(clientVin, clientCarNumber, memberName);
	}
	
	//모달창에서 데이터 전송
	@PostMapping("/reg/registration")
	@ResponseBody
//	public List<CarRegisterDTO> regRegistration(@RequestParam(name = "clientVin",required = false)String clientVin ,Model model) {
	public CarRegisterDTO regRegistration(@RequestParam(name = "clientVin",required = false)String clientVin ,Model model) {
	    return cs.regRegistration(clientVin);
	}
	
	//일반접수-차량접수/수정
	@PostMapping("/reg/registration/edit")
	public String regRegistrationAndcorrection(@ModelAttribute CarRegisterDTO regCarDTO, @RequestParam("mechanicNo") int mechanicNo,HttpSession session) {
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
		return "redirect:/reg/registration";
		 
	}
	
	//지정 정비사 확인
	@GetMapping("/reg/registration/modal/mechanic")
	@ResponseBody
	public List<MechanicRegisterDTO> regRegistrationChiceMechanic(@RequestParam(name = "mechanicNo", required = false) Integer mechanicNo,@RequestParam(name = "mechanicName" , required = false) String mechanicName,HttpSession session) {
		int word = (Integer)session.getAttribute("shopNo");
//		log.info(""+mechanicNo);
//		if(mechanicNo != null) {
//			MechanicRegisterDTO dto = MechanicRegisterDTO	.builder()
//												.mechanicNo(mechanicNo)
//												.mechanicName(mechanicName)
//												.shopNo(word)
//												.build();
////			log.info("되? {}",cs.regChiceMechanic(dto,word));
			log.info("dto : "+cs.regChiceMechanic(mechanicNo,mechanicName,word));
			return cs.regChiceMechanic(mechanicNo,mechanicName,word);
		
	}
	
	@GetMapping("/reg/registration/modal/mechanicInput")
	@ResponseBody
	public MechanicRegisterDTO regRegistrationChiceMechanicModal(@RequestParam("mechanicNo")int mechanicNo) {
		
		return cs.registrationChiceMechanicInput(mechanicNo);
	}
	
	

	
	//차량 등록
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
	

	
}
