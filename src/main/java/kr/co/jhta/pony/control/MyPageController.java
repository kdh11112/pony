package kr.co.jhta.pony.control;


import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jhta.pony.dto.NoticeDTO;
import kr.co.jhta.pony.dto.PonyMemberDTO;
import kr.co.jhta.pony.dto.QuestionDTO;
import kr.co.jhta.pony.service.PonyMemberService;
import kr.co.jhta.pony.service.QuestionService;
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
	PonyMemberService service;
	@Autowired
	QuestionService qService;
	//---------------------------마이페이지 메인
	@GetMapping("/mypage")
	public String mypage(Principal p, HttpSession session) {
		
		PonyMemberDTO dto  = service.getMemberEmail(p.getName()); //dto에 service에 있는 getMemberEmail 메서드에 인증정보값을 담아 비교?
		session.setAttribute("dto", dto); //세션에 dto값을 담음.
		return "mypage/mypage"; //
	}
	//--------------------------------마이페이지 1:1문의 리스트페이지로이동
	@GetMapping("/mypageqna")
	public String mypageQna(HttpSession session, Principal p,Model model,@RequestParam(name="currentPage",defaultValue="1")int currentPage) {
		PonyMemberDTO dto = service.getMemberEmail(p.getName());
		session.setAttribute("dto", dto);
		//총게시물수
		int totalNumber = service.getTotal();
		
		//페이지당 게시물수
		int recordPerPage = 10;
		
		//총페이지수, 한페이지당 수, 현재 페이지 번호
		Map<String, Object> map = PageUtil.getPageData(totalNumber, recordPerPage, currentPage);
		
		int startNo = (int)map.get("startNo");
		int endNo = (int)map.get("endNo");
		log.info("QuestionService : {} ", qService);
		List<QuestionDTO> qnalist =  qService.selectAll(startNo, endNo, dto.getMemberNo());
		model.addAttribute("qnalist",qService.selectAll(startNo, endNo, dto.getMemberNo()));
		log.info("qnalist   {}"  ,qnalist);
		model.addAttribute("map", map);
		return "mypage/mypageQna";
	}
	//-------------------------------글 상세 페이지이동
		@GetMapping("/mypageqnadetail")
		public String detail(@RequestParam("questionNo")int questionNo,Model model) {
			model.addAttribute("detail",qService.selectOne(questionNo));
			//service.increaseHits(questionNo);
			
			return "/mypage/qnadetail";
		}
		
		//-----------------------1:1 글쓰기이동
		@GetMapping("/qnawrite")
		public String write() {	
			
			return "/mypage/qnawriteform";
		}
		//-------------------------글쓰기 완료
		@PostMapping("/qnawriteform")
		public String writeOk(HttpSession session,@ModelAttribute QuestionDTO dto,
								HttpServletRequest req,Principal p,Model model) {
			PonyMemberDTO dto2 = service.getMemberEmail(p.getName());
			session.setAttribute("dto",dto2);
			log.info("dto2 {} ",dto2);
			int memberNo = dto2.getMemberNo();
			String contents = req.getParameter("contents");
			String title = req.getParameter("title");
			dto.setQuestionTitle(title);
			dto.setMemberNo(memberNo);
			dto.setQuestionContents(contents);
			qService.qnaAddOne(dto);
			
			return "redirect:/mypageqna";
		}
		
		//------------------------글 수정 페이지이동
		@GetMapping("/qnamodify")
		public String modifyform(@RequestParam("questionNo") int questionNo, Model model,HttpSession session,Principal p) {
			PonyMemberDTO dto3 = service.getMemberEmail(p.getName());
			int memberNo = dto3.getMemberNo();
			session.setAttribute("mdto", dto3);
			model.addAttribute("dto", qService.selectOne(questionNo));
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
		public String carregi() {
			return "/mypage/carregi";
		}
		
		//-----------------------------차량관리페이지이동
		@GetMapping("/carmanagement")
		public String carmanagement() {
			return "/mypage/carmanagement";
		}
		
		//-----------------------차량등록하기페이지이동
		@GetMapping("/carregigo")
		public String carregigo() {
			return "/mypage/carregiGo";
		}
		//------------------------차량등록폼페이지
		@PostMapping("/carregiok")
		public String carregiok() {
			return "redirect:/carregi";
		}
}

