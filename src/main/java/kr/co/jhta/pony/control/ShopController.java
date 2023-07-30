package kr.co.jhta.pony.control;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.jhta.pony.service.AnswerService;
import kr.co.jhta.pony.service.NoticeService;
import kr.co.jhta.pony.service.OrderDetailService;
import kr.co.jhta.pony.service.OrderService;
import kr.co.jhta.pony.service.PonyMemberService;
import kr.co.jhta.pony.service.QuestionService;

@Controller
public class ShopController {
	
	private final PonyMemberService memberservice;
	
	@Autowired
	public ShopController(PonyMemberService memberservice) {
		this.memberservice = memberservice;

		}

	// 부품쇼핑 ----------------------------------------
	
	@GetMapping("/partall")
	public String partAll() {
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
