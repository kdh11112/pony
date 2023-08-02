package kr.co.jhta.pony.control;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jhta.pony.dto.PageMakeDTO;
import kr.co.jhta.pony.dto.PartDTO;
import kr.co.jhta.pony.security.service.PonyMemberService;
import kr.co.jhta.pony.service.PartService;
import kr.co.jhta.pony.util.Criteria;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class ShopController {
	
	private final PonyMemberService mservice;
	private final PartService pservice;
	
	@Autowired
	public ShopController(PonyMemberService memberservice,
							PartService partservice) {
		this.mservice = memberservice;
		this.pservice = partservice;

		}

	// 부품목록 (고객 페이지)-------------------------------
	
	/* 부품 목록 페이지 접속(페이징 적용) */
	@GetMapping("/partall")
	public String partAll(HttpSession session, Principal p, Model model, Criteria cri, PartDTO dto) {
		
//		int total = pservice.searchPartTotal(cri);
//		PageMakeDTO pageMake = new PageMakeDTO(cri, total);
		
//		model.addAttribute("partlist", pservice.searchPartList(cri));
		
		List partlist = pservice.searchPartList(cri);
		
		if(!partlist.isEmpty()) {
			model.addAttribute("partlist", partlist);	// 검색 시 부품 존재하는 경우
		} else {
			model.addAttribute("listCheck", "empty");	// 검색 시 부품 존재하지 않는 경우
		}
		
		// 페이지 이동 인터페이스 데이터
		model.addAttribute("pageMaker", new PageMakeDTO(cri, pservice.searchPartTotal(cri)));
		
		return "/shop/part/partAll";
	}
	
	@PostMapping("/partall")
	public String addpartlist(HttpSession session, Principal p, Model model, Criteria cri, @RequestParam(name="selectPart")int selectPart,
			@RequestParam(name="selectCar")String selectCar, @RequestParam(name="selectCount") int selectCount) {
		
		log.info("주문한 부품 번호: {}", selectPart);
		log.info("주문한 자동차 타입: {}", selectCar);
		log.info("주문한 부품 수량: {}", selectCount);

		return "redirect:/partall";
		
	}
	
	
	
	// 장바구니 ----------------------------------------
	
	@GetMapping("/cartlist")
	public String cartlist(HttpSession session, Principal p) {
		return "/shop/cart/cartList";
	}
	
	@GetMapping("/buypart")
	public String buypage(HttpSession session, Principal p) {
		return "/shop/cart/buyPart";
	}
	
	
	// 내 주문목록 --------------------------------------
	
	@GetMapping("/myorderlist")
	public String myOrderList(HttpSession session, Principal p) {
		return "/shop/order/myOrderList";
	}
	

}
