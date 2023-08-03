package kr.co.jhta.pony.control;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

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
import kr.co.jhta.pony.dto.HistroyDTO;
import kr.co.jhta.pony.dto.MechanicRegisterDTO;
import kr.co.jhta.pony.service.CarRegisterService;
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
	
	
	//일반접수 - 검색
	@GetMapping("/reg/registration")
	public String regRegistrationSearch(Model model,
			@RequestParam(name = "registrationRN" ,required = false) Integer registrationRN,
			@RequestParam(name = "registrationDateHi" ,required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate registrationDate
			) {
		model.addAttribute("count", cs.registrationTodayCases());
		if(registrationRN != null) {
//			log.info("검색 {}",cs.resNum(registrationRN,registrationDate));
	    model.addAttribute("searchOne", cs.resNum(registrationRN,registrationDate));
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
	@PostMapping("/reg/registration/modalData")
	@ResponseBody
//	public List<CarRegisterDTO> regRegistration(@RequestParam(name = "clientVin",required = false)String clientVin ,Model model) {
	public CarRegisterDTO regRegistrationModal(@RequestParam(name = "clientVin",required = false)String clientVin) {
	    return cs.regRegistration(clientVin);
	}
	
	//일반접수-차량접수/수정
	@PostMapping("/reg/registration/edit")
	public String regRegistrationAndcorrection(@ModelAttribute CarRegisterDTO regCarDTO,
			@ModelAttribute HistroyDTO histroyDTO,
			@RequestParam(name = "mechanicNoParam", defaultValue = "0", required = false) int mechanicNo,
			HttpSession session, 
			@RequestParam(name = "registrationNumberHidden" ,required = false) String registrationRN, 
			@RequestParam(name = "registrationNumberHide" ,required = false) String registrationNumber,
			@RequestParam(name = "clientDistanceDrivenNow" ,required = false) int clientDistanceDriven
			) {
		int word = (Integer)session.getAttribute("shopNo");
		int ss = cs.regAndcorrNumber();
		log.info(registrationRN);
		//아 이 코드가 맞는건가...
		if(registrationRN == null || registrationRN == "") { //차량 접수
			CarRegisterDTO carRegisterDTO = CarRegisterDTO
									.builder()
									.registrationNumber(ss)
						            .clientVin(regCarDTO.getClientVin())
						            .clientCarNumber(regCarDTO.getClientCarNumber())
						            .clientDistanceDriven(regCarDTO.getClientDistanceDriven())
						            .memberEmail(regCarDTO.getMemberEmail())
						            .memberName(regCarDTO.getMemberName())
						            .memberPhone(regCarDTO.getMemberPhone())
						            .registrationClientRequests(regCarDTO.getRegistrationClientRequests())
						            .registrationSignificant(regCarDTO.getRegistrationSignificant())
						            .mechanicNo(mechanicNo)
						            .mechanicName(regCarDTO.getMechanicName())
						            .shopNo(word)
						            .shopArea(regCarDTO.getShopArea())
									.shopAreaPoint(regCarDTO.getShopAreaPoint())
						            .registrationDate(regCarDTO.getRegistrationDate())
						            .clientProductionDate(regCarDTO.getClientProductionDate())
						            .build();

			log.info("위"+regCarDTO.getMemberName());
			cs.regAndcorr(carRegisterDTO);
		}else if (registrationRN != null) { //차량 수정
			int regiNum = Integer.parseInt(registrationRN);
			int regiNumber = Integer.parseInt(registrationNumber);
			CarRegisterDTO carRegisterDTO = CarRegisterDTO
		    		.builder()
		    		.clientCarNumber(regCarDTO.getClientCarNumber())
		    		.clientDistanceDriven(clientDistanceDriven)
		    		.memberName(regCarDTO.getMemberName())
		            .memberPhone(regCarDTO.getMemberPhone())
		            .registrationClientRequests(regCarDTO.getRegistrationClientRequests())
		            .registrationSignificant(regCarDTO.getRegistrationSignificant())
		            .registrationRN(regiNum)
		            .registrationNumber(regiNumber)
		            .registrationDate(regCarDTO.getRegistrationDate())
		            .mechanicName(regCarDTO.getMechanicName())
		            .mechanicNo(mechanicNo)
		            .build();
			log.info("밑 : "+clientDistanceDriven);

			cs.regAndEdit(carRegisterDTO);
		}
		
		

		return "redirect:/reg/registration";
		 
	}
	
	//지정 정비사 확인
	@GetMapping("/reg/registration/modal/mechanic")
	@ResponseBody
	public List<MechanicRegisterDTO> regRegistrationChiceMechanic(@RequestParam(name = "mechanicNoParam", defaultValue = "0", required = false) int mechanicNo,@RequestParam(name = "mechanicName" , required = false) String mechanicName,HttpSession session) {
		int word = (Integer)session.getAttribute("shopNo");
			
		return cs.regChiceMechanic(mechanicNo,mechanicName,word);
		
	}
	
	@PostMapping("/reg/registration/modal/mechanicInput")
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
