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
import kr.co.jhta.pony.dto.HistroyDTO;
import kr.co.jhta.pony.dto.MechanicRegisterDTO;
import kr.co.jhta.pony.dto.TechnologyAndPartDTO;
import kr.co.jhta.pony.service.CarRegisterService;
import kr.co.jhta.pony.service.TechnologyAndPartService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class RegistrationController {

	CarRegisterService carRegisterService;
	TechnologyAndPartService technologyAndPartService;
	



	public RegistrationController(CarRegisterService carRegisterService,
			TechnologyAndPartService technologyAndPartService) {

		this.carRegisterService = carRegisterService;
		this.technologyAndPartService = technologyAndPartService;
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
		model.addAttribute("count", carRegisterService.findOneRegistrationTodayCases());
		if(registrationRN != null) {
//			log.info("검색 {}",carRegisterService.resNum(registrationRN,registrationDate));
	    model.addAttribute("searchOne", carRegisterService.findOneResNum(registrationRN,registrationDate));
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

	   return  carRegisterService.findAllmodalSearch(clientVin, clientCarNumber, memberName);
	}
	
	//모달창에서 데이터 전송
	@PostMapping("/reg/registration/modalData")
	@ResponseBody
//	public List<CarRegisterDTO> regRegistration(@RequestParam(name = "clientVin",required = false)String clientVin ,Model model) {
	public CarRegisterDTO regRegistrationModal(@RequestParam(name = "clientVin",required = false)String clientVin) {
	    return carRegisterService.findOneregRegistration(clientVin);
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
		int number = carRegisterService.findOneRegAndcorrNumber();
		
		log.info(registrationRN);
		
		if(registrationRN == null || registrationRN == "") { //차량 접수
			CarRegisterDTO carRegisterDTO = extracted(regCarDTO, mechanicNo, word, number);
			
			log.info("위"+regCarDTO.getMemberName());
			
			carRegisterService.createRegAndcorr(carRegisterDTO);
		}else if (registrationRN != null) { //차량 수정
			int regiNum = Integer.parseInt(registrationRN);
			int regiNumber = Integer.parseInt(registrationNumber);
			
			CarRegisterDTO carRegisterDTO = extracted(regCarDTO, mechanicNo, clientDistanceDriven, regiNum, regiNumber);
			
			log.info("밑 : "+clientDistanceDriven);

			carRegisterService.saveRegAndEdit(carRegisterDTO);
		}
		return "redirect:/reg/registration";
		 
	}


//	/regRegistrationAndcorrection if부분
	private CarRegisterDTO extracted(CarRegisterDTO regCarDTO, int mechanicNo, int word, int number) {
		CarRegisterDTO carRegisterDTO = CarRegisterDTO
								.builder()
								.registrationNumber(number)
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
		return carRegisterDTO;
	}
	
//	/regRegistrationAndcorrection else if부분
	private CarRegisterDTO extracted(CarRegisterDTO regCarDTO, int mechanicNo, int clientDistanceDriven, int regiNum,
			int regiNumber) {
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
		return carRegisterDTO;
	}
	
	//지정 정비사 확인
	@GetMapping("/reg/registration/modal/mechanic")
	@ResponseBody
	public List<MechanicRegisterDTO> regRegistrationChiceMechanic(@RequestParam(name = "mechanicNoParam", defaultValue = "0", required = false) int mechanicNo,@RequestParam(name = "mechanicName" , required = false) String mechanicName,HttpSession session) {
		int word = (Integer)session.getAttribute("shopNo");
			
		return carRegisterService.findAllRegChiceMechanic(mechanicNo,mechanicName,word);
		
	}
	
	@PostMapping("/reg/registration/modal/mechanicInput")
	@ResponseBody
	public MechanicRegisterDTO regRegistrationChiceMechanicModal(@RequestParam("mechanicNo")int mechanicNo) {
		return carRegisterService.findOneRegistrationChiceMechanicInput(mechanicNo);
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
		carRegisterService.createCarRegister(regCarDTO);
		return "/registration/carRegister";
	}
	
	@GetMapping("/reg/work")
	public String work() {
		
		return "/registration/work";
	}
	
	@ResponseBody
	@GetMapping("/reg/registration/modal/technology")
	public List<TechnologyAndPartDTO> workTechnologyModal(@RequestParam(name = "technologyNumberModal",required = false,defaultValue = "0")Integer technologyNumber,@RequestParam(name ="technologyDetailModal",required = false)String technologyDetail) {
//		int technologyNumberInt = 0;
//		if (technologyNumber == null || technologyNumber.isEmpty()) {
//			technologyNumberInt = Integer.parseInt(technologyNumber);			
//		}
		TechnologyAndPartDTO dto = TechnologyAndPartDTO	.builder()
														.technologyNumber(technologyNumber)
														.technologyDetail(technologyDetail)
														.build();
		return technologyAndPartService.findAllTechnologyModal(dto);
	}
	
	@GetMapping("/reg/payment")
	public String payment() {
		
		return "/registration/payment";
	}
	

	
}
