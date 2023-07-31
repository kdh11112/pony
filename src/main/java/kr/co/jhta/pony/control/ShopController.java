package kr.co.jhta.pony.control;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.jhta.pony.dto.PageMakeDTO;
import kr.co.jhta.pony.service.PartService;
import kr.co.jhta.pony.service.PonyMemberService;
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
	public String partAll(HttpSession session, Principal p, Model model, Criteria cri) {
		
//		int total = pservice.getTotal();
//		PageMakeDTO pageMake = new PageMakeDTO(cri, total);

		model.addAttribute("pageMaker", new PageMakeDTO(cri, pservice.getTotal()));
		
		model.addAttribute("partlist", pservice.getPartAll(cri));
		
		return "/shop/part/partAll";
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
