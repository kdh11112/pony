package kr.co.jhta.pony.control;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import io.swagger.annotations.Api;
import kr.co.jhta.pony.dto.NoticeDTO;
import kr.co.jhta.pony.dto.PageMakeDTO;
import kr.co.jhta.pony.service.NoticeService;
import kr.co.jhta.pony.util.Criteria;


@Controller
@Api(tags = "웹")
public class WebManagerController {
	
	@Autowired
	NoticeService service;
	
	@GetMapping("/notice")
	public String notice(Model model, Criteria cri) {
//		총게시물수
		int totalNumber = service.getTotal();;
		
		model.addAttribute("list",service.selectAll(cri));
		model.addAttribute("pageMaker", new PageMakeDTO(cri, totalNumber));
		return "noticelist";
	}
	
	@GetMapping("/detail")
	public String detail(@RequestParam("noticeNo")int noticeNo,Model model) {
		model.addAttribute("detail",service.selectOne(noticeNo));
		service.increaseHits(noticeNo);
		
		return "noticedetail";
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
