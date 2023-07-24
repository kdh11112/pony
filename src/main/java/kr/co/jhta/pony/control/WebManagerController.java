package kr.co.jhta.pony.control;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jhta.pony.dto.NoticeDTO;
import kr.co.jhta.pony.service.NoticeService;
import kr.co.jhta.pony.util.PageUtil;
import kr.co.jhta.springboot12.dto.BoardDTO;


@Controller
public class WebManagerController {
	
	@Autowired
	NoticeService service;
	
	@GetMapping("/notice")
	public String notice(Model model,
			@RequestParam(name="currentPage",defaultValue="1")int currentPage
			) {
//		총게시물수
		int totalNumber = service.getTotal();
		//페이지당 게시물수
		int recordPerPage = 10;
		
		//총페이지수, 한페이지당 수, 현재 페이지 번호
		Map<String, Object> map = PageUtil.getPageData(totalNumber, recordPerPage, currentPage);
		
		int startNo = (int)map.get("startNo");
		int endNo = (int)map.get("endNo");
		
		model.addAttribute("list",service.selectAll(startNo, endNo));
		model.addAttribute("map", map);
		return "noticelist";
	}
	
	@GetMapping("/detail")
	public String detail(@RequestParam("noticeNo")int noticeNo,Model model) {
		model.addAttribute("detail",service.selectOne(noticeNo));
		service.increaseHits(noticeNo);
		
		return "noticedetail";
	}
	
	@GetMapping("/noticewrite")
		public String noticeWriteForm() {
			return "manager/noticewriteform";
	}
	
	@PostMapping("/noticewrite")
		public String noticeWriteOk(@ModelAttribute NoticeDTO dto,HttpServletRequest req) {
		String contents = req.getParameter("contents");
		String title = req.getParameter("title");
		dto.setNoticeContents(contents);
		dto.setNoticeTitle(title);
		service.addOne(dto);

			return "redirect:/notice";
	}
	@GetMapping("modify")
	public String modifyform(@RequestParam("noticeNo") int noticeNo, Model model) {
		model.addAttribute("dto", service.selectOne(noticeNo));
		return "manager/noticemodify";
	}
	
	@PostMapping("modify")
	public String modifyOk(@ModelAttribute NoticeDTO dto, HttpServletRequest req) {
		String contents = req.getParameter("contents");
		String title = req.getParameter("title");
		dto.setNoticeContents(contents);
		dto.setNoticeTitle(title);
		service.modifyOne(dto);
		return "redirect:/notice";
	}
	@GetMapping("/delete")
	public String deleteOk(@ModelAttribute NoticeDTO dto) {
		service.deleteOne(dto);
		return "redirect:/notice";
	}
}
