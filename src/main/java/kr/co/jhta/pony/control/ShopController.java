package kr.co.jhta.pony.control;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.pony.dto.CartDTO;
import kr.co.jhta.pony.dto.OrderDTO;
import kr.co.jhta.pony.dto.PageMakeDTO;
import kr.co.jhta.pony.dto.PartDTO;
import kr.co.jhta.pony.dto.PonyMemberDTO;
import kr.co.jhta.pony.security.service.PonyMemberService;
import kr.co.jhta.pony.service.CartService;
import kr.co.jhta.pony.service.OrderService;
import kr.co.jhta.pony.service.PartService;
import kr.co.jhta.pony.util.Criteria;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class ShopController {
	
	private final PonyMemberService mservice;
	private final PartService pservice;
	private final CartService cservice;
	private final OrderService oservice;
	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);
	
	@Autowired
	public ShopController(PonyMemberService memberservice,
							PartService partservice,
							CartService cartservice,
							OrderService orderservice) {
		this.mservice = memberservice;
		this.pservice = partservice;
		this.cservice = cartservice;
		this.oservice = orderservice;
		}

	// 부품목록 (고객 페이지)-------------------------------
	
	/* 부품 목록 페이지 접속(페이징 적용) */
	@GetMapping("/partall")
	public String partAll(HttpSession session, Principal p, Model model, Criteria cri, PartDTO dto) {

		List<PartDTO> partlist = pservice.searchPartList(cri);
		
		if(!partlist.isEmpty()) {
			model.addAttribute("partlist", partlist);	// 검색 시 부품 존재하는 경우
		} else {
			model.addAttribute("listCheck", "empty");	// 검색 시 부품 존재하지 않는 경우
			return "/shop/part/partAll";
		}
		
		// 페이지 이동 인터페이스 데이터
		model.addAttribute("pageMaker", new PageMakeDTO(cri, pservice.searchPartTotal(cri)));
		
		return "/shop/part/partAll";
	}
	
	
	// 장바구니 ----------------------------------------
	
	@GetMapping("/cartlist")
	public String cartlist(HttpSession session, Principal p, Model model, HttpServletRequest req, @ModelAttribute CartDTO cartdto) {
		// 세션에 저장한 사용자의 번호
		int memberNo = (int) session.getAttribute("memberNo");
		log.info("userNo: "+memberNo);
		
		if(memberNo == 0) {
			return "/ponylogin";
		}
		
//		PonyMemberDTO memberDTO = mservice.getMemberEmail(p.getName());
//		session.setAttribute("memberDTO", memberDTO);
		
		//int memberNo = memberDTO.getMemberNo();
		cartdto.setMemberNo(memberNo);
		
		// 회원번호 기준으로 장바구니 정보를 조회
		List<CartDTO> userCart = cservice.cartAll(memberNo);
		log.info("장바구니 목록 : "+ userCart);
		
		model.addAttribute("usercart", userCart);
		return "/shop/cart/cartList";
	}
	
	/* 장바구니 수량 수정 */
	@PostMapping("/modifyCart")
	public String modifyCart(@ModelAttribute CartDTO cartdto, HttpSession session) {
		
		int updateCartCount = cartdto.getCartCount();
		log.info("update : "+updateCartCount);
		
		cservice.modifyCount(cartdto);
		
		return "redirect:/cartlist";
	}
	
	/* 장바구니 삭제 */
	@PostMapping("/deleteCart")
	public String deleteCart() {
		
		return "redirect:/cartlist";
	}
	
	@PostMapping("/cartlist")
	public String cartorder(HttpSession session, OrderDTO orderdto ) {
		int memberNo = (int) session.getAttribute("memberNo");
		
		orderdto.setMemberNo(memberNo);
		
		return null;
	}
	
	/* 부품 전체 목록에서 장바구니 추가 */
	@RequestMapping("/partall")
	@ResponseBody //데이터를 바로 반환함
	public String addCart(HttpSession session, @ModelAttribute CartDTO cartdto, HttpServletRequest req,
			Principal p) {
		
		if(p == null) {
			return "5";
		}
		PonyMemberDTO memberDTO = mservice.getMemberEmail(p.getName());
		session.setAttribute("memberDTO", memberDTO);
		

		int memberNo = memberDTO.getMemberNo();
		// 카트 등록
		log.info("DTO: "+memberDTO);
		cartdto.setMemberNo(memberNo);

		int result = cservice.addCart(cartdto);
		return result+"";
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
