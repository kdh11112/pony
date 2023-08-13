package kr.co.jhta.pony.control;


import java.io.Console;
import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import kr.co.jhta.pony.dto.CarRegisterDTO;
import kr.co.jhta.pony.dto.ClientDTO;
import kr.co.jhta.pony.dto.PonyMemberDTO;
import kr.co.jhta.pony.dto.QuestionDTO;
import kr.co.jhta.pony.dto.ReservationDTO;
import kr.co.jhta.pony.dto.ShopDTO;
import kr.co.jhta.pony.dto.TestDriveApplicationReservationDetailsDTO;
import kr.co.jhta.pony.dto.TestDriveDTO;
import kr.co.jhta.pony.security.service.PonyMemberService;
import kr.co.jhta.pony.service.AnswerService;
import kr.co.jhta.pony.service.CarRegisterService;
import kr.co.jhta.pony.service.ClientService;
import kr.co.jhta.pony.service.QuestionService;
import kr.co.jhta.pony.service.ReservationService;
import kr.co.jhta.pony.service.ShopService;
import kr.co.jhta.pony.service.TestDriveApplicationReservationDetailsService;
import kr.co.jhta.pony.service.TestDriveService;
import kr.co.jhta.pony.util.PageUtil;
import lombok.extern.slf4j.Slf4j;

//Principal -  java안에 있는 클래스 인증정보를 받아오는 객체를 만들수 있따.
//인정정보를 받아온 객체를 세션에 값을 준다.
//사용자정보가 있는 dto 객체를 만들어 서비스객체 에 있는 이메일 과 비교해 같다면 
//값을 가져온다.
//session에 속성정보값을 가져와 화면에 출력

@Slf4j
@Controller
public class MyPageController {

	@Autowired
	ShopService ss;
	@Autowired
	PasswordEncoder passwordEncoder;
	@Autowired
	PonyMemberService service;
	@Autowired
	QuestionService qService;
	@Autowired
	ClientService cService;
	@Autowired
	TestDriveApplicationReservationDetailsService testdriveapplicationreservationdetailsservice;
	@Autowired
	TestDriveService testDriveService;
	@Autowired
	CarRegisterService carRegistrationService;
	@Autowired
	AnswerService aservice;
	@Autowired
	ReservationService reservationService;
	//---------------------------마이페이지 메인
	@GetMapping("/mypage")
//	public String mypage(Principal p, HttpSession session) {
//		
//		PonyMemberDTO dto  = service.getMemberEmail(p.getName()); //dto에 service에 있는 getMemberEmail 메서드에 인증정보값을 담아 비교?
//		session.setAttribute("dto", dto); //세션에 dto값을 담음.
//		return "mypage/mypage"; //
//	}
	
	public String mypage(Principal p, @ModelAttribute ClientDTO dto,
			HttpSession session, Model model, HttpServletRequest req) {
		if(p==null) {
			return "/ponylogin";
		}else {
		
		PonyMemberDTO dto5 = service.getMemberEmail(service.getPrincipalEmail(p));
		session.setAttribute("dto", dto5);
		session.setAttribute("cdto", dto);
		
		
		// 로그인한 사용자의 회원번호를 가져옴
		int memberNo = dto5.getMemberNo();
		dto.setMemberNo(memberNo);
		// 회원번호를 기준으로 등록된 차량 정보를 조회
		List<ClientDTO> userCars = cService.carList(memberNo);
		log.info(">>>>>>>>>>>>>>>>>>>>>"+userCars);
		String pw =passwordEncoder.encode("aaaa");//비밀번호 암호화
		log.info(">>>>>>>>>>>>>>>>>>>>>"+pw);
		log.info(">>>>>>>>>>>>>>>>>>>>>"+p.getName());
		// 등록된 차량 정보가 없을 경우의 처리
        if (userCars.isEmpty()) {
            model.addAttribute("hasCars", false);
        } else {
            model.addAttribute("hasCars", true);
            model.addAttribute("userCars", userCars);
        }
        model.addAttribute("carcnt",cService.getOwnedCarCount(memberNo));
        model.addAttribute("qnacount",qService.getqnaCount(memberNo));
        model.addAttribute("memberPoint",service.getMemberPoint(memberNo));
		return "mypage/mypage";
		}
	}
	//--------------------------------마이페이지 1:1문의 리스트페이지로이동
	@GetMapping("/mypageqna")
	public String mypageQna(HttpSession session, Principal p,Model model,@RequestParam(name="currentPage",defaultValue="1")int currentPage) {
		PonyMemberDTO dto = service.getMemberEmail(service.getPrincipalEmail(p));
		session.setAttribute("dto", dto);
		//총게시물수
		int totalNumber = service.getTotal();
		
		//페이지당 게시물수
		int recordPerPage = 10;
		
		//총페이지수, 한페이지당 수, 현재 페이지 번호
		Map<String, Object> map = PageUtil.getPageData(totalNumber, recordPerPage, currentPage);
		
		
		// 로그인한 사용자의 회원번호를 가져옴
				int memberNo = dto.getMemberNo();
				dto.setMemberNo(memberNo);
		int startNo = (int)map.get("startNo");
		int endNo = (int)map.get("endNo");
		log.info("QuestionService : {} ", qService);
		List<QuestionDTO> qnalist =  qService.selectAll(startNo-1, endNo, dto.getMemberNo()); //사용자가 작성한 질문의 1번째부터 가져오도록 되어있는데 0번쨰부터 가져와야햐ㅐ서 -1해줌, 다른 로직에서 건드린거같은데,, 다시한번 찾아보자
		model.addAttribute("qnalist",qService.selectAll(startNo-1, endNo, dto.getMemberNo()));
		log.info("qnalist   {}"  ,qnalist);
		model.addAttribute("map", map);
		model.addAttribute("carcnt",cService.getOwnedCarCount(memberNo));
        model.addAttribute("qnacount",qService.getqnaCount(memberNo));
        model.addAttribute("memberPoint",service.getMemberPoint(memberNo));
		return "mypage/mypageQna";
	}
	//-------------------------------글 상세 페이지이동
		@GetMapping("/mypageqnadetail")
		public String detail(@RequestParam("questionNo")int questionNo,Model model,Principal p, HttpSession session) {
			PonyMemberDTO dto20 = service.getMemberEmail(service.getPrincipalEmail(p));
			session.setAttribute("dto", dto20);
			// 로그인한 사용자의 회원번호를 가져옴
			int memberNo = dto20.getMemberNo();
			dto20.setMemberNo(memberNo);
			model.addAttribute("detail",qService.selectOne(questionNo));
			model.addAttribute("answer",aservice.selectOne(questionNo));
			//service.increaseHits(questionNo);
			model.addAttribute("carcnt",cService.getOwnedCarCount(memberNo));
	        model.addAttribute("qnacount",qService.getqnaCount(memberNo));
	        model.addAttribute("memberPoint",service.getMemberPoint(memberNo));
			return "/mypage/qnadetail";
		}
		
		//-----------------------1:1 글쓰기이동
		@GetMapping("/qnawrite")
		public String write(Model model,Principal p, HttpSession session) {	
			PonyMemberDTO dto21 = service.getMemberEmail(service.getPrincipalEmail(p));
			session.setAttribute("dto", dto21);
			// 로그인한 사용자의 회원번호를 가져옴
			int memberNo = dto21.getMemberNo();
			dto21.setMemberNo(memberNo);
			model.addAttribute("carcnt",cService.getOwnedCarCount(memberNo));
	        model.addAttribute("qnacount",qService.getqnaCount(memberNo));
	        model.addAttribute("memberPoint",service.getMemberPoint(memberNo));
			return "/mypage/qnawriteform";
		}
		//-------------------------글쓰기 완료
		@PostMapping("/qnawriteform")
		public String writeOk(HttpSession session,@ModelAttribute QuestionDTO dto,
								HttpServletRequest req,Principal p,Model model) {
			PonyMemberDTO dto2 = service.getMemberEmail(service.getPrincipalEmail(p));
			session.setAttribute("dto",dto2);
			log.info("dto2 {} ",dto2);
			int memberNo = dto2.getMemberNo();
			String contents = req.getParameter("contents");
			String title = req.getParameter("title");
			dto.setQuestionTitle(title);
			dto.setMemberNo(memberNo);
			dto.setQuestionContents(contents);
			qService.qnaAddOne(dto);
			
			model.addAttribute("carcnt",cService.getOwnedCarCount(memberNo));
	        model.addAttribute("qnacount",qService.getqnaCount(memberNo));
	        model.addAttribute("memberPoint",service.getMemberPoint(memberNo));
			
			return "redirect:/mypageqna";
		}
		
		//------------------------글 수정 페이지이동
		@GetMapping("/qnamodify")
		public String modifyform(@RequestParam("questionNo") int questionNo, Model model,HttpSession session,Principal p) {
			PonyMemberDTO dto3 = service.getMemberEmail(service.getPrincipalEmail(p));
			int memberNo = dto3.getMemberNo();
			session.setAttribute("mdto", dto3);
			model.addAttribute("dto", qService.selectOne(questionNo));
			model.addAttribute("carcnt",cService.getOwnedCarCount(memberNo));
	        model.addAttribute("qnacount",qService.getqnaCount(memberNo));
	        model.addAttribute("memberPoint",service.getMemberPoint(memberNo));
			return "/mypage/qnamodifyform";
		}
		
		//---------------------------1:1 문의글 수정 ok
		@PostMapping("/qnamodifyOk")
		public String modifyOk(@ModelAttribute QuestionDTO dto, HttpServletRequest req) {
			String contents = req.getParameter("contents");
			String title = req.getParameter("title");
			dto.setQuestionTitle(title);
			dto.setQuestionContents(contents);
			qService.qnamodifyOne(dto);
			return "redirect:/mypageqna";
		}
		
		//----------------------------1:1문의내역삭제페이지
		@GetMapping("/qnadelete")
		public String delete(@ModelAttribute QuestionDTO dto) {
			qService.deleteOne(dto);
			return "redirect:/mypageqna";
		}
		
		// --------------------------등록차량확인페이지
		@GetMapping("/carregi")
		public String carregi(Principal p, @ModelAttribute ClientDTO dto,
				HttpSession session, Model model, HttpServletRequest req) {
			PonyMemberDTO dto5 = service.getMemberEmail(service.getPrincipalEmail(p));
			session.setAttribute("dto", dto5);
			// 로그인한 사용자의 회원번호를 가져옴
			int memberNo = dto5.getMemberNo();
			dto.setMemberNo(memberNo);
			// 회원번호를 기준으로 등록된 차량 정보를 조회
			List<ClientDTO> userCars = cService.carList(memberNo);
			log.info(">>>>>>>>>>>>>>>>>>>>>"+userCars);
			// 등록된 차량 정보가 없을 경우의 처리
	        if (userCars.isEmpty()) {
	            model.addAttribute("hasCars", false);
	        } else {
	            model.addAttribute("hasCars", true);
	            model.addAttribute("userCars", userCars);
	        }
	        model.addAttribute("carcnt",cService.getOwnedCarCount(memberNo));
	        model.addAttribute("qnacount",qService.getqnaCount(memberNo));
	        model.addAttribute("memberPoint",service.getMemberPoint(memberNo));
			return "/mypage/carregi";
		}
		
		//-----------------------------차량관리페이지이동
//		@GetMapping("/carmanagement")
//		public String carmanagement() {
//			return "/mypage/carmanagement";
//		}
//		public String carlist(Principal p, @ModelAttribute ClientDTO dto,
//				HttpSession session, Model model, HttpServletRequest req) {
//			PonyMemberDTO dto5 = service.getMemberEmail(p.getName());
//			session.setAttribute("dto", dto5);
//			// 로그인한 사용자의 회원번호를 가져옴
//			int memberNo = dto5.getMemberNo();
//			dto.setMemberNo(memberNo);
//			// 회원번호를 기준으로 등록된 차량 정보를 조회
//			List<ClientDTO> userCars = cService.carList(memberNo);
//			log.info(">>>>>>>>>>>>>>>>>>>>>"+userCars);
//			// 등록된 차량 정보가 없을 경우의 처리
//	        if (userCars.isEmpty()) {
//	            model.addAttribute("hasCars", false);
//	        } else {
//	            model.addAttribute("hasCars", true);
//	            model.addAttribute("userCars", userCars);
//	        }
//			return "/mypage/carmanagement";
//		}
		
		//-----------------------차량등록하기페이지이동 //등록차량 출력
		@GetMapping("/carregigo")
		public String carregigo(Principal p, @ModelAttribute ClientDTO dto,
				HttpSession session, Model model, HttpServletRequest req) {
			PonyMemberDTO dto5 = service.getMemberEmail(service.getPrincipalEmail(p));
			session.setAttribute("dto", dto5);
			// 로그인한 사용자의 회원번호를 가져옴
			int memberNo = dto5.getMemberNo();
			dto.setMemberNo(memberNo);
			// 회원번호를 기준으로 등록된 차량 정보를 조회
			List<ClientDTO> userCars = cService.carList(memberNo);
			log.info(">>>>>>>>>>>>>>>>>>>>>"+userCars);
			// 등록된 차량 정보가 없을 경우의 처리
	        if (userCars.isEmpty()) {
	            model.addAttribute("hasCars", false);
	        } else {
	            model.addAttribute("hasCars", true);
	            model.addAttribute("userCars", userCars);
	        }
	        model.addAttribute("carcnt",cService.getOwnedCarCount(memberNo));
	        model.addAttribute("qnacount",qService.getqnaCount(memberNo));
	        model.addAttribute("memberPoint",service.getMemberPoint(memberNo));
			return "/mypage/carregiGo";
		}
		
		@GetMapping("/carregistration")
	    public String myPage(Model model, Principal p,HttpSession session) {
			PonyMemberDTO dto = service.getMemberEmail(service.getPrincipalEmail(p));
			session.setAttribute("dto", dto);
	        List<ClientDTO> userCars = cService.selectAll(dto.getMemberNo());
	        model.addAttribute("userCars", userCars);
	        return "mypage";
	    }
		
		//------------------------차량등록ok
		@PostMapping("/carregiok")
		public String carregiok(Principal p, @ModelAttribute ClientDTO dto,  
			   HttpSession session,Model model , HttpServletRequest req) {
			PonyMemberDTO dto4 = service.getMemberEmail(p.getName());
			session.setAttribute("dto", dto4);
			int memberNo = dto4.getMemberNo();
			dto.setMemberNo(memberNo);
			
			cService.addOne(dto);
			
			log.info("차량등록 {} ",dto);
			return "redirect:/carregi";
		}
		//------------------------------등록차량삭제
		@GetMapping("/deleteCar")
		public String cardelete(Principal p,   
				   HttpSession session,Model model , HttpServletRequest req ,@RequestParam String clientVin) {
		
			cService.deleteOne(clientVin);
			
			// 선택된 차대번호들을 순회하면서 삭제 처리
		   // String cv = clientVin;
		   //     log.info("cv 넘어옴? : " + cv);

		        // 각 차대번호에 해당하는 차량을 삭제하는 서비스 호출
		        
		        
		    
			return "redirect:/carregi";
		}
		
		//-----------------------------회원정보페이지
		@GetMapping("/myinfo")
		public String myinfo(Model model,Principal p,HttpSession session) {
			PonyMemberDTO dto6 = service.getMemberEmail(service.getPrincipalEmail(p));
			session.setAttribute("dto", dto6);
			int memberNo=dto6.getMemberNo();
			model.addAttribute("dto",service.selectMem(memberNo));
			model.addAttribute("carcnt",cService.getOwnedCarCount(memberNo));
	        model.addAttribute("qnacount",qService.getqnaCount(memberNo));
	        model.addAttribute("memberPoint",service.getMemberPoint(memberNo));
			log.info("dto>>>>>>"+service.selectMem(memberNo));
			return "mypage/myInfo";
		}
		//-----------------회원정보수정페이지
		@GetMapping("/myinfomodify")
		public String myinfomodify(@ModelAttribute PonyMemberDTO dto, HttpServletRequest req,HttpSession session, Model model,Principal p) {
			PonyMemberDTO dto7 = service.getMemberEmail(service.getPrincipalEmail(p));
			int memberNo = dto7.getMemberNo();
			
			String pw = dto7.getMemberPassword(); // fasfslafjsasa
			
			boolean isPw = passwordEncoder.matches("", pw);
			if(isPw == true) {
				String a = "True";
				log.info(pw + "랑 같음 " + a);
			}else {
				String a = "F";
				log.info(pw + "같지 않음 " + a);
			}
			
			
			session.setAttribute("mdto", dto7);
			model.addAttribute("dto", service.selectOne(memberNo));
			model.addAttribute("carcnt",cService.getOwnedCarCount(memberNo));
	        model.addAttribute("qnacount",qService.getqnaCount(memberNo));
	        model.addAttribute("memberPoint",service.getMemberPoint(memberNo));
			return "mypage/myinfomodifyform";
		}
		
		//-------------------------회원정보 수정ok
		@PostMapping("/myinfomodifyOk")
		public String myinfomodifyOk(@ModelAttribute PonyMemberDTO dto, HttpServletRequest req,HttpSession session, Model model,Principal p) {
			PonyMemberDTO dto8 = service.getMemberEmail(service.getPrincipalEmail(p));
			int memberNo = dto8.getMemberNo();
			session.setAttribute("mdto", dto8);
			 String rawPassword = req.getParameter("memberPassword");
		        String encodedPassword = passwordEncoder.encode(rawPassword);
		        dto.setMemberPassword(encodedPassword);
			model.addAttribute("dto", service.selectOne(memberNo));
//			String name = req.getParameter("memberName");
//			String pw = req.getParameter("memberPassword");
//			log.info("pw>>>>>>>>>>>>>>>>> {} ",pw);
//			String birth = req.getParameter("memberBirthday");
//			String phone = req.getParameter("memberPhone");
//			String addr1 = req.getParameter("memberAddress1");
//			String addr2 = req.getParameter("memberAddress2");
//			dto.setMemberName(name);
//			dto.setMemberPassword(pw);
//			dto.setMemberBirthday(birth);
//			dto.setMemberPhone(phone);
//			dto.setMemberAddress1(addr1);
//			dto.setMemberAddress2(addr2);
			service.myinfomodifyOne(dto);
	
			return "redirect:/myinfo";
		}
		//--------------------------시승신청예약내역
		@GetMapping("/testdriving")
		public String testdriving(Model model, @ModelAttribute TestDriveDTO dto,Principal p,HttpSession session,HttpServletRequest req){
			PonyMemberDTO dto1 = service.getMemberEmail(service.getPrincipalEmail(p));
			int memberNo = dto1.getMemberNo();
			
			List<TestDriveApplicationReservationDetailsDTO> testDrivinglist = testdriveapplicationreservationdetailsservice.getTestDriveScheduleByMemberNo(memberNo);
			 model.addAttribute("testdriveapplicationreservationdetailsdto",testDrivinglist);
			 log.info(">>>>>>>>>>>>>>>>>>>>>>시승{}",testDrivinglist);
			 model.addAttribute("carcnt",cService.getOwnedCarCount(memberNo));
		        model.addAttribute("qnacount",qService.getqnaCount(memberNo));
		        model.addAttribute("memberPoint",service.getMemberPoint(memberNo));
		        model.addAttribute("testDriveCount",testDriveService.testDriveCount(memberNo));
		        System.out.println("TTTTTTT" + testDrivinglist);
			return "mypage/testdriving";
		}
		
		//----------------------------시승신청예약내역변경
		@PostMapping("/testdrivingmodify")
		public String testdrivingmodify(
//				@ModelAttribute TestDriveDTO dto,
				@RequestParam("modelNo") int modelNo,@RequestParam("shopNo")int shopNo,@RequestParam("buttonTime") String testDriveTime, 
				@RequestParam ("testDriveSchedule") String testDriveSchedule,@RequestParam("testDriveNo")int testDriveNo,
										Principal p, HttpSession session, HttpServletRequest req, Model model) {

			PonyMemberDTO dto8 = service.getMemberEmail(service.getPrincipalEmail(p));
			int memberNo = dto8.getMemberNo();
			
			
			TestDriveDTO dto = new TestDriveDTO();
			dto.setMemberNo(memberNo);
			dto.setTestDriveSchedule(testDriveSchedule);
			dto.setModelNo(modelNo);
			dto.setTestDriveTime(testDriveTime);
			dto.setShopNo(shopNo);
			dto.setTestDriveNo(testDriveNo);
			
			
			System.out.println("dto :  " + dto.getTestDriveTime());
			
			
			
			testDriveService.updatedTestDrive(dto);
			log.info("시승신청내역 {}>>>>>>>>>>>>>>>>",dto);
			return "redirect:/testdriving";
		}
		//----------------------------시승신청예약 내역 삭제
		@GetMapping("/testdrivingdelete")
		public String testdrivingdelete(@ModelAttribute TestDriveDTO dto, 
										Principal p, HttpSession session, HttpServletRequest req, Model model,@RequestParam int testDriveNo) {
			
			testDriveService.deleteTestDrive(testDriveNo);
			log.info(">>>>>>>>>>>>>>>>>testdriveno : "+testDriveNo);
			return "redirect:/testdriving";
		}
		
		//---------------------------------정비예약신청 내역
		@GetMapping("/carMaintenanceReservationDetail")
		public String CarMaintenanceReservationDetail(Model model,Principal p,
													  HttpSession session,HttpServletRequest req) {
			PonyMemberDTO dto1 = service.getMemberEmail(service.getPrincipalEmail(p));
			int memberNo = dto1.getMemberNo();
			List<ReservationDTO> reservationList = reservationService.getReservationList(memberNo);
			model.addAttribute("reservationDTO",reservationList);
			log.info(">>>>>>>>>>>>>>>>>>>>>>정비예약{}",reservationList);
			model.addAttribute("carcnt",cService.getOwnedCarCount(memberNo));
		    model.addAttribute("qnacount",qService.getqnaCount(memberNo));
		    model.addAttribute("memberPoint",service.getMemberPoint(memberNo));
		    model.addAttribute("testDriveCount",testDriveService.testDriveCount(memberNo));
			return "mypage/carMaintenanceReservationDetail";
		}
		//----------------------------------정비예약신청삭제
		@GetMapping("/carMaintenanceReservationDelete")
		public String CarMaintenanceReservationDetailDelete(@ModelAttribute CarRegisterDTO dto, Principal p, 
															HttpSession session, @RequestParam int reservationNo) {
			reservationService.deleteReservation(reservationNo);
			log.info(">>>>>>>>>>>>>>>> 정비예약내역삭제 번호 {}"+reservationNo);
			return "redirect:/carMaintenanceReservationDetail";
		}
}