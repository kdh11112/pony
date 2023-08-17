package kr.co.jhta.pony.control;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.pony.dto.CarRegisterDTO;
import kr.co.jhta.pony.dto.HistroyDTO;
import kr.co.jhta.pony.dto.HistroyDTOList;
import kr.co.jhta.pony.dto.MechanicRegisterDTO;
import kr.co.jhta.pony.dto.PageMakeDTO;
import kr.co.jhta.pony.dto.ReservationDTO;
import kr.co.jhta.pony.dto.TechnologyAndPartDTO;
import kr.co.jhta.pony.service.CarRegisterService;
import kr.co.jhta.pony.service.ReservationService;
import kr.co.jhta.pony.service.TechnologyAndPartService;
import kr.co.jhta.pony.util.Criteria;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class RegistrationController {

	CarRegisterService carRegisterService;
	TechnologyAndPartService technologyAndPartService;
	
	@Autowired
	ReservationService reservationService;

	@Autowired
	PasswordEncoder passwordEncoder;

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

			
			carRegisterService.createRegAndcorr(carRegisterDTO);
		}else if (registrationRN != null) { //차량 수정
			int regiNum = Integer.parseInt(registrationRN);
			int regiNumber = Integer.parseInt(registrationNumber);
			
			CarRegisterDTO carRegisterDTO = extracted(regCarDTO, mechanicNo, clientDistanceDriven, regiNum, regiNumber);
			
			
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
				.clientVin(regCarDTO.getClientVin())
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
	public String regCarCRegisterOk(@ModelAttribute CarRegisterDTO regCarDTO,@RequestParam("memberName")String memberName) {
		CarRegisterDTO dto = 	CarRegisterDTO.builder()
						.clientVin(regCarDTO.getClientVin())
						.clientCarNumber(regCarDTO.getClientCarNumber())
						.clientDistanceDriven(regCarDTO.getClientDistanceDriven())
						.clientCarType(regCarDTO.getClientCarType())
						.clientColor(regCarDTO.getClientColor())
						.clientProductionDate(regCarDTO.getClientProductionDate())
						.clientShipDate(regCarDTO.getClientShipDate())
						.memberEmail(regCarDTO.getMemberEmail())
						.memberName(regCarDTO.getMemberName())
						.memberPassword(passwordEncoder.encode(regCarDTO.getMemberName()))
						.memberPhone(regCarDTO.getMemberPhone())
						.build();
		carRegisterService.createCarRegister(dto);
		return "/registration/carRegister";
	}
	
	@GetMapping("/reg/work")
	public String work(@RequestParam(name = "registrationRN",required = false,defaultValue = "0")Integer registrationRN,
			@RequestParam(name = "registrationDateHi" ,required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate registrationDate,
			Model model,HttpSession session) {
		CarRegisterDTO carRegisterDTO = carRegisterService.findOneReg(registrationRN,registrationDate);
		model.addAttribute("work", carRegisterService.findOneReg(registrationRN,registrationDate));
		if(carRegisterDTO == null) {
			return "/registration/work";
		}else if(carRegisterDTO != null) {

			String number = ""+carRegisterDTO.getRegistrationNumber();
			String technologyNumberName = (String) session.getAttribute("technologyNumberName");
			String partNumberName = (String) session.getAttribute("partNumberName");
			if(technologyNumberName != null && partNumberName != null) {
			int partLength = (int) session.getAttribute("partLength");


			List<TechnologyAndPartDTO> technology = (List<TechnologyAndPartDTO>) session.getAttribute("technologyList");
			int tBout = (int) session.getAttribute("technologyBout");
			List<TechnologyAndPartDTO> part = (List<TechnologyAndPartDTO>) session.getAttribute("partList");
			int technologyLength = (int) session.getAttribute("technologyLength");
			int pBout = (int) session.getAttribute("partBout");
			
				int technologyAndPartBout = tBout+pBout;


				if(number.equals(technologyNumberName)&& number.equals(partNumberName)) {
					
					model.addAttribute("technologyLength", technologyLength);
					model.addAttribute("technology", technology);
					model.addAttribute("tBout", tBout);
					model.addAttribute("partLength", partLength);
					model.addAttribute("part", part);
					model.addAttribute("pBout", pBout);
					model.addAttribute("technologyAndPartBout", technologyAndPartBout);
				}else {
					model.addAttribute("technologyLength", 0);
					model.addAttribute("partLength", 0);
				}
			}
			
		}
	
		return "/registration/work";
	}
	
	
	@PatchMapping("/reg/work")
	public String workSave(@ModelAttribute TechnologyAndPartDTO technologyAndPartDTO, 
			HttpServletRequest request,HttpSession session,
			@RequestParam(name = "technologyLength",defaultValue = "0") int technologyLength,
			@RequestParam(name = "partLength",defaultValue = "0") int partLength,
			@RequestParam("technologyNumberName") String technologyNumberName,
			@RequestParam("partNumberName") String partNumberName,
			@RequestParam(name = "technologyBout",defaultValue = "0") int technologyBout,
			@RequestParam(name = "partBout",defaultValue = "0") int partBout
			
			) {
		String[] technologyValues = request.getParameterValues("technology");
		//log.info(""+Arrays.toString(technologyValues));
		String[] partValues = request.getParameterValues("part");

		List<TechnologyAndPartDTO> technologyList = new ArrayList<>();
		int cnt =0; 
		for (int i = 0; i < technologyLength; i++) {			
		    TechnologyAndPartDTO techDto = new TechnologyAndPartDTO();
		    techDto.setTechnologyNumber(Integer.parseInt(technologyValues[cnt++]));
		    techDto.setTechnologyDetail(technologyValues[cnt++]);
		    techDto.setTechnologyPrice(Integer.parseInt(technologyValues[cnt++]));
		    techDto.setTechnologyNo(Integer.parseInt(technologyValues[cnt++]));
		    
		    technologyList.add(techDto);  // 생성된 'techDto'를 리스트에 추가
		    //log.info("기술 : {}",techDto);
		}
		session.setAttribute("technologyLength", technologyLength);
		session.setAttribute("technologyList", technologyList);
		session.setAttribute("technologyBout", technologyBout);
		session.setAttribute("technologyNumberName", technologyNumberName);
		
		List<TechnologyAndPartDTO> partList = new ArrayList<>();
		int partCnt = 0;
		for (int i = 0; i < partLength; i++) {			
		    TechnologyAndPartDTO partDto = new TechnologyAndPartDTO();
		    partDto.setPartNumber(Integer.parseInt(partValues[partCnt++]));
		    partDto.setPartName(partValues[partCnt++]);
		    partDto.setPartPrice(Integer.parseInt(partValues[partCnt++]));
		    partDto.setPartNo(Integer.parseInt(partValues[partCnt++]));

		    partList.add(partDto);
		    //log.info("부품 : {}",partDto);
		}
		session.setAttribute("partLength", partLength);
		session.setAttribute("partList", partList);
		session.setAttribute("partBout", partBout);
		session.setAttribute("partNumberName", partNumberName);
		
	    return "redirect:/reg/work";
	}
	
	@ResponseBody
	@GetMapping("/reg/registration/modal/technology")
	public List<TechnologyAndPartDTO> workTechnologyModal(
	        @RequestParam(name = "technologyNumberAsy", required = false, defaultValue = "0") Integer technologyNumber,
	        @RequestParam(name ="technologyDetailAsy", required = false) String technologyDetail) {
		
		TechnologyAndPartDTO dto = TechnologyAndPartDTO	.builder()
														.technologyNumber(technologyNumber)
														.technologyDetail(technologyDetail)
														.build();
		return technologyAndPartService.findAllTechnologyModal(dto);
	}
	
	@ResponseBody
	@PostMapping("/reg/registration/modal/technologyData")
	public TechnologyAndPartDTO technologyData(@RequestBody Map<String, String> requestBody) {
	    int technologyNumber = Integer.parseInt(requestBody.get("technologyNumberData"));
		return technologyAndPartService.findOneTechnologyNumber(technologyNumber);

		
	}
	
	@ResponseBody
	@GetMapping("/reg/registration/modal/part")
	public List<TechnologyAndPartDTO> workPartModal(
	        @RequestParam(name = "partNumberAsy", required = false, defaultValue = "0") Integer partNumber,
	        @RequestParam(name ="partNameAsy", required = false) String partName) {
		
		TechnologyAndPartDTO dto = TechnologyAndPartDTO	.builder()
														.partName(partName)
														.partNumber(partNumber)
														.build();
		
		return technologyAndPartService.findAllPartModal(dto);
	}
	
	@ResponseBody
	@PostMapping("/reg/registration/modal/partData")
	public TechnologyAndPartDTO partData(@RequestBody Map<String, String> requestBody) {
	    int partNumber = Integer.parseInt(requestBody.get("partNumberData"));
		return technologyAndPartService.findOnePartNumber(partNumber);
	
	}
	
	
	
	@GetMapping("/reg/payment")
	public String payment(@RequestParam(name = "registrationRN",required = false,defaultValue = "0")Integer registrationRN,
			@RequestParam(name = "registrationDateHi" ,required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate registrationDate,
			Model model,HttpSession session) {
		
		CarRegisterDTO carRegisterDTO = carRegisterService.findOneReg(registrationRN,registrationDate);
		model.addAttribute("work", carRegisterService.findOneReg(registrationRN,registrationDate));

		if(carRegisterDTO == null) {
			return "/registration/payment";
		}else if(carRegisterDTO != null) {

			String number = ""+carRegisterDTO.getRegistrationNumber();
			String technologyNumberName = (String) session.getAttribute("technologyNumberName");
			String partNumberName = (String) session.getAttribute("partNumberName");
			if(technologyNumberName != null && partNumberName != null) {
				


			List<TechnologyAndPartDTO> technology = (List<TechnologyAndPartDTO>) session.getAttribute("technologyList");
			int tBout = (int) session.getAttribute("technologyBout");
			List<TechnologyAndPartDTO> part = (List<TechnologyAndPartDTO>) session.getAttribute("partList");
			int pBout = (int) session.getAttribute("partBout");
			
				
				int technologyAndPartBout = tBout+pBout;

				
				if( technologyNumberName.equals(number) && partNumberName.equals(number)) {
				model.addAttribute("technology", technology);
				model.addAttribute("tBout", tBout);
				model.addAttribute("part", part);
				model.addAttribute("pBout", pBout);
				model.addAttribute("technologyAndPartBout", technologyAndPartBout);
				}
			}
		}
		return "/registration/payment";
	}
	
    @PostMapping("/reg/payment")
    public String paymentApproval(@ModelAttribute("histroyDTOList") HistroyDTOList histroyDTOList,
                                  @RequestParam(name = "registrationDateHi", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate registrationDate,
                                  @RequestParam(name = "registrationNumber", required = false, defaultValue = "0") int registrationNumber) {
    	//log.info("histroyDTOList : " +histroyDTOList);
    	ArrayList<HistroyDTO> historyList = new ArrayList<>();
    	historyList.addAll(histroyDTOList.getTechList());
    	historyList.addAll(histroyDTOList.getPartList());
    	for (HistroyDTO histroyDTO : historyList) {
            HistroyDTO DTO = HistroyDTO.builder()
                    .partNumber(histroyDTO.getPartNumber())
                    .partName(histroyDTO.getPartName())
                    .partPrice(histroyDTO.getPartPrice())
                    .partNo(histroyDTO.getPartNo())
                    .partCount(histroyDTO.getPartCount())
                    .technologyNumber(histroyDTO.getTechnologyNumber())
                    .technologyDetail(histroyDTO.getTechnologyDetail())
                    .technologyPrice(histroyDTO.getTechnologyPrice())
                    .technologyCount(histroyDTO.getTechnologyCount())
                    .build();
            //log.info("몇개 : " + DTO);
            carRegisterService.saveApproval(DTO, registrationDate, registrationNumber);
        }

        return "redirect:/reg/payment";
    }
    
    @GetMapping("/reg/paymentList")
    public String paymentList(	@RequestParam(name = "registrationRN",required = false,defaultValue = "0")Integer registrationRN,
    							@RequestParam(name = "registrationDateHi" ,required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate registrationDate,
    							Model model) {
    	model.addAttribute("work", carRegisterService.findOneReg(registrationRN,registrationDate));
		CarRegisterDTO carRegisterDTO = carRegisterService.findOneReg(registrationRN,registrationDate);
    	if(carRegisterDTO != null) {
    		
    		int i = carRegisterDTO.getRegistrationNumber();
    		
    		List<HistroyDTO> histories = carRegisterService.findAllPaymentList(i);
    		int totalTech = 0;
    		int totalPart = 0;
    		for (HistroyDTO history : histories) {
    			totalTech += history.getTechnologyPrice();
    		    totalPart += history.getPartPrice();
    		}
    		int total = totalTech+totalPart;

            model.addAttribute("List", carRegisterService.findAllPaymentList(i));
            model.addAttribute("totalTech", totalTech);
            model.addAttribute("totalPart", totalPart);
            model.addAttribute("total", total);
            
    	}
    	
    	return "/registration/paymentList";
    }


	
	
    @GetMapping("/reg/reservation")
	public String reservation(Model model, Criteria cri,@RequestParam(name = "memberName", required = false) String memberName) {
//		총게시물수
		int totalNumber = reservationService.getTotalreservation(memberName);
		log.info("totalNumber : "+totalNumber);
	    // 검색어가 있다면 Criteria 객체에 검색어 설정
	    if (memberName != null && !memberName.isEmpty()) {
	        cri.setKeyword(memberName);
	    }

		
		model.addAttribute("list",reservationService.getAllReservation(cri));//전체 페이지
		model.addAttribute("pageMaker", new PageMakeDTO(cri, totalNumber));
		
		return "/registration/reservation";
		
	}
	
	
}
