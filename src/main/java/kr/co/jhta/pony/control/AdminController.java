package kr.co.jhta.pony.control;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jhta.pony.dto.NoticeDTO;
import kr.co.jhta.pony.service.NoticeService;
import kr.co.jhta.pony.service.QuestionService;
import kr.co.jhta.pony.util.ControllerAdvisor;
import kr.co.jhta.pony.util.PageUtil;

@Controller
public class AdminController {
  
	@Autowired
	NoticeService nservice;
	
	@Autowired
	QuestionService qservice;
	
	@GetMapping("/admin")
	public String admin() {
		return "/admin/admin";
	}

	// 재고 관리 ------------------------------------------------------------
	@GetMapping("/partlist")
	public String partlist() {
		return "/admin/part/partList";
	}
	
	// 주문 목록 ------------------------------------------------------------
	@GetMapping("/adminorderlist")
	public String adminorderlist() {
		return "/admin/order/orderList";
	}
	
	// 고객 문의 ------------------------------------------------------------
	@GetMapping("/questionlist")
	public String questionlist(Model model, @RequestParam(name="currentPage", defaultValue = "1")int currentPage) {
		//총게시물수
		int totalNumber = qservice.getTotal();
		
		//페이지당 게시물수
		int recordPerPage = 10;
		
		//총페이지수, 한페이지당 수, 현재 페이지 번호
		Map<String, Object> map = PageUtil.getPageData(totalNumber, recordPerPage, currentPage);
		
		int startNo = (int)map.get("startNo");
		int endNo = (int)map.get("endNo");
		
		model.addAttribute("list", qservice.selectAll(startNo, endNo));
		model.addAttribute("map", map);

		return "/admin/question/questionList";

	}
	
	@GetMapping("/questiondetail")
	public String questiondetail(@RequestParam("questionNo")int questionNo, Model model) {
		model.addAttribute("detail",qservice.selectOne(questionNo));
		return "/admin/question/questionDetail";
	}
	
	
	// 공지사항 (유경님 코드)----------------------------------------------------
	@GetMapping("/noticewrite")
	public String noticeWriteForm() {
		return "/admin/notice/adminNoticeWriteForm";
	}
	
	//게시글 목록
	@GetMapping("/adminnotice")
	public String notice(Model model, @RequestParam(name="currentPage",defaultValue="1")int currentPage) {
	
	//총게시물수
	int totalNumber = nservice.getTotal();
	
	//페이지당 게시물수
	int recordPerPage = 10;
	
	//총페이지수, 한페이지당 수, 현재 페이지 번호
	Map<String, Object> map = PageUtil.getPageData(totalNumber, recordPerPage, currentPage);
	
	int startNo = (int)map.get("startNo");
	int endNo = (int)map.get("endNo");
	
	model.addAttribute("list",nservice.selectAll(startNo, endNo));
	model.addAttribute("map", map);
	return "/admin/notice/adminNoticeList";
	}
	
	//글 상세 페이지
	@GetMapping("/admindetail")
	public String detail(@RequestParam("noticeNo")int noticeNo,Model model) {
		model.addAttribute("detail",nservice.selectOne(noticeNo));
		nservice.increaseHits(noticeNo);
		
		return "/admin/notice/adminNoticeDetail";
	}
	
	//글 작성 저장
	@PostMapping("/adminnoticewrite")
	public String noticeWriteOk(@ModelAttribute NoticeDTO dto,HttpServletRequest req) {
		String contents = req.getParameter("contents");
		String title = req.getParameter("title");
		dto.setNoticeContents(contents);
		dto.setNoticeTitle(title);
		nservice.addOne(dto);
	
		return "redirect:/adminnotice";
	}
	
	//글 수정 페이지
	@GetMapping("/adminmodify")
	public String modifyform(@RequestParam("noticeNo") int noticeNo, Model model) {
		model.addAttribute("dto", nservice.selectOne(noticeNo));
		return "/admin/notice/adminNoticeModify";
	}
	
	//글 수정
	@PostMapping("/adminmodify")
	public String modifyOk(@ModelAttribute NoticeDTO dto, HttpServletRequest req) {
		String contents = req.getParameter("contents");
		String title = req.getParameter("title");
		dto.setNoticeContents(contents);
		dto.setNoticeTitle(title);
		nservice.modifyOne(dto);
		return "redirect:/adminnotice";
	}
	
	//글 삭제
	@GetMapping("/admindelete")
	public String deleteOk(@ModelAttribute NoticeDTO dto) {
		nservice.deleteOne(dto);
		return "redirect:/adminnotice";
	}
}
