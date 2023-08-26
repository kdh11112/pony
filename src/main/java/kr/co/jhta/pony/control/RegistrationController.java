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

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
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
@Api(tags = "오프라인")
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

	
	@GetMapping("/reg")
	@ApiOperation(value = "메인 접속", notes = "메인으로 접속합니다.")
	public String main() {
		
		return "/registration/main";
	}
	

	@GetMapping("/reg/main")
	@ApiOperation(value = "메인 접속 체크" ,notes = "비고르인 일시 메인 접속 불가")
	public String regMain(HttpSession session) {
		if(session.getAttribute("mechanicNo") != null) {
			return "redirect:/reg";
		}
		return "/reg/login";
	}
	
	
	
	@GetMapping("/reg/registration")
	@ApiOperation(value = "일반접수 - 검색" ,notes = "일반접수 창을 눌렀을때 페이지로 이동")
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
	
	
	@GetMapping("/reg/registration/modal")
	@ResponseBody
	@ApiOperation(value = "차대번호,차량번호,고객명 을 검색하는 모달창" ,notes = "모달창을 눌렀을때")
	public List<CarRegisterDTO> regModal(
	        @RequestParam(name ="clientVin", required = false) String clientVin,
	        @RequestParam(name ="clientCarNumber" , required = false) String clientCarNumber,
	        @RequestParam(name ="memberName", required = false) String memberName,
			@ModelAttribute CarRegisterDTO regCarDTO) {

	   return  carRegisterService.findAllmodalSearch(clientVin, clientCarNumber, memberName);
	}
	
	
	@PostMapping("/reg/registration/modalData")
	@ResponseBody
	@ApiOperation(value = "차대번호,차량번호,고객명 을 검색하는 모달창내부" ,notes = "모달창내부에서 데이터를 페이지로 전송")
//	public List<CarRegisterDTO> regRegistration(@RequestParam(name = "clientVin",required = false)String clientVin ,Model model) {
	public CarRegisterDTO regRegistrationModal(@RequestParam(name = "clientVin",required = false)String clientVin) {
	    return carRegisterService.findOneregRegistration(clientVin);
	}
	
	
	@PostMapping("/reg/registration/edit")
	@ApiOperation(value = "차량접수/수정" ,notes = "차량접수/수정 버튼을 클릭하면 로직에 따라 접수 및 수정을 결정")
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
	
	
	@GetMapping("/reg/registration/modal/mechanic")
	@ResponseBody
	@ApiOperation(value = "지정 정비사 모달창" ,notes = "지정정비사 창을 클릭시 모달창이 뜸")
	public List<MechanicRegisterDTO> regRegistrationChiceMechanic(@RequestParam(name = "mechanicNoParam", defaultValue = "0", required = false) int mechanicNo,@RequestParam(name = "mechanicName" , required = false) String mechanicName,HttpSession session) {
		int word = (Integer)session.getAttribute("shopNo");
			
		return carRegisterService.findAllRegChiceMechanic(mechanicNo,mechanicName,word);
		
	}
	
	@PostMapping("/reg/registration/modal/mechanicInput")
	@ResponseBody
	@ApiOperation(value = "지정정비사 모달창 내부" ,notes = "지정정비사 모달창 내부 데이터를 페이지로 전달")
	public MechanicRegisterDTO regRegistrationChiceMechanicModal(@RequestParam("mechanicNo")int mechanicNo) {
		return carRegisterService.findOneRegistrationChiceMechanicInput(mechanicNo);
	}
	
	
	@GetMapping("/reg/carRegister")
	@ApiOperation(value = "차량등록" ,notes = "차량을 등록을 하는 페이지로 이동")
	public String regCarRegister() {
		return "/registration/carRegister";
	}
	
	
	@PostMapping("/reg/carRegister")
	@ApiOperation(value = "차량등록 버튼" ,notes = "차량을 등록 하는 버튼을 클릭할시 차량이등록됨")
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
	@ApiOperation(value = "차량등록 버튼" ,notes = "차량을 등록 하는 버튼을 클릭할시 차량이등록됨")
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
	@ApiOperation(value = "일반작업에서 수정" ,notes = "일반작업 페이지에서 일부분을 수정하게 함 세션에 담아져있음")
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
	@GetMapping("/reg/work/modal/technology")
	@ApiOperation(value = "일반작업 모달창" ,notes = "페이지 윗부분에 있는 기술 모달창 띄움")
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
	@PostMapping("/reg/work/modal/technologyData")
	@ApiOperation(value = "일반작업 모달창내부 데이터" ,notes = "기술 모달창 데이터를 화면에 뿌려주는 역할")
	public TechnologyAndPartDTO technologyData(@RequestBody Map<String, String> requestBody) {
	    int technologyNumber = Integer.parseInt(requestBody.get("technologyNumberData"));
		return technologyAndPartService.findOneTechnologyNumber(technologyNumber);

		
	}
	
	@ResponseBody
	@GetMapping("/reg/work/modal/part")
	@ApiOperation(value = "일반작업 모달창" ,notes = "페이지 아랫부분의 부품 모달창 띄움")
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
	@PostMapping("/reg/work/modal/partData")
	@ApiOperation(value = "일반작업 모달창내부 데이터" ,notes = "부품 모달창 데이터를 화면에 뿌려주는 역할")
	public TechnologyAndPartDTO partData(@RequestBody Map<String, String> requestBody) {
	    int partNumber = Integer.parseInt(requestBody.get("partNumberData"));
		return technologyAndPartService.findOnePartNumber(partNumber);
	
	}
	
	
	
	@GetMapping("/reg/payment")
	@ApiOperation(value = "일반수납" ,notes = "일반 수납창 클릭시 페이지 이동")
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
    @ApiOperation(value = "일반수납에서 저장" ,notes = "일반수납창에서 저장을 클릭시에 데이터가 저장이됨")
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
    	carRegisterService.saveApprovalList(historyList, registrationNumber);

        return "redirect:/reg/payment";
    }
    
    @GetMapping("/reg/paymentList")
    @ApiOperation(value = "결재리스트" ,notes = "결재가 완료된 고객의 정보를 보여줌")
    public String paymentList(	@RequestParam(name = "registrationRN",required = false,defaultValue = "0")Integer registrationRN,
    							@RequestParam(name = "registrationDateHi" ,required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate registrationDate,
    							Model model) {
    	model.addAttribute("work", carRegisterService.findOneReg(registrationRN,registrationDate));
		CarRegisterDTO carRegisterDTO = carRegisterService.findOneReg(registrationRN,registrationDate);
		System.out.println("asd");
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
    @ApiOperation(value = "예약관리" ,notes = "예약관리 클릭시 페이지 이동")
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
