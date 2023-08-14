package kr.co.jhta.pony.control;

import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.pony.dto.CartDTO;
import kr.co.jhta.pony.dto.OrderDTO;
import kr.co.jhta.pony.dto.OrderDetailDTO;
import kr.co.jhta.pony.dto.PageMakeDTO;
import kr.co.jhta.pony.dto.PartDTO;
import kr.co.jhta.pony.dto.PonyMemberDTO;
import kr.co.jhta.pony.security.service.PonyMemberService;
import kr.co.jhta.pony.service.CartService;
import kr.co.jhta.pony.service.OrderDetailService;
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
	private final OrderDetailService odservice;
	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);

	@Autowired
	public ShopController(PonyMemberService memberservice, PartService partservice, CartService cartservice,
			OrderService orderservice, OrderDetailService orderdetailservice) {
		this.mservice = memberservice;
		this.pservice = partservice;
		this.cservice = cartservice;
		this.oservice = orderservice;
		this.odservice = orderdetailservice;
	}

	// 부품목록 (고객 페이지)-------------------------------

	/* 부품 목록 페이지 접속(페이징 적용) */
	@GetMapping("/partall")
	public String partAll(HttpSession session, Principal p, Model model, Criteria cri, PartDTO dto) {

		List<PartDTO> partlist = pservice.searchPartList(cri);

		if (!partlist.isEmpty()) {
			model.addAttribute("partlist", partlist); // 검색 시 부품 존재하는 경우
		} else {
			model.addAttribute("listCheck", "empty"); // 검색 시 부품 존재하지 않는 경우
			return "/shop/part/partAll";
		}

		// 페이지 이동 인터페이스 데이터
		model.addAttribute("pageMaker", new PageMakeDTO(cri, pservice.searchPartTotal(cri)));

		return "/shop/part/partAll";
	}

	/* 부품 전체 목록에서 장바구니 추가 */
	@RequestMapping("/partall")
	@ResponseBody // 데이터를 바로 반환
	public String addCart(HttpSession session, @ModelAttribute CartDTO cartdto, HttpServletRequest req, Principal p) {
		// Integer : int의 래퍼클래스로 null을 다룰 수 있음
		Integer memberNo = (Integer) session.getAttribute("memberNo");
		if ((Integer) session.getAttribute("memberNo") == null) {
			return "5";
		}
		PonyMemberDTO memberDTO = mservice.selectMemAll(memberNo);
		session.setAttribute("memberDTO", memberDTO);

		// memberNo = memberDTO.getMemberNo();
		// 카트 등록
		log.info("DTO: " + memberDTO);
		cartdto.setMemberNo(memberNo);

		int result = cservice.addCart(cartdto);
		return result + "";
	}

	// 장바구니 ----------------------------------------

	@GetMapping("/cartlist")
	public String cartlist(HttpSession session, Principal p, Model model, HttpServletRequest req,
			@ModelAttribute CartDTO cartdto) {
		// 세션에 저장한 사용자의 번호

		Integer memberNo = (Integer) session.getAttribute("memberNo");
		log.info("userNo: " + memberNo);

		cartdto.setMemberNo(memberNo);

		// 회원번호 기준으로 장바구니 정보를 조회
		List<CartDTO> userCart = cservice.cartAll(memberNo);
		log.info("장바구니 목록 : " + userCart);

		model.addAttribute("usercart", userCart);
		return "/shop/cart/cartList";
	}

	/* 장바구니 수량 수정 */
	@PostMapping("/modifyCart")
	public String modifyCart(@ModelAttribute CartDTO cartdto, HttpSession session) {

		cservice.modifyCount(cartdto);

		return "redirect:/cartlist";
	}

	/* 장바구니 삭제 */
	@PostMapping("/deleteCart")
	public String deleteCart(@ModelAttribute CartDTO cartdto, @RequestParam(value = "chkbox[]") List<String> chkbox) {
		log.info("checkArr :  " + chkbox);
		int cartNo = 0;
		for (String cartNoStr : chkbox) {
			cartNo = Integer.parseInt(cartNoStr);
			cservice.deleteCart(cartNo);
		}
		return "redirect:/cartlist";
	}

	// 부품 주문 ---------------------------------------

	@GetMapping("/buypart")
	public String getbuypage(HttpSession session, Model model, @RequestParam("sum_input") int sum,
			@RequestParam("delivery_input") int delivery, @RequestParam("totalPrice_input") int total,
			@RequestParam("point_input") int point) {
		int memberNo = (int) session.getAttribute("memberNo");
		PonyMemberDTO memberDTO = mservice.selectMemAll(memberNo);
		model.addAttribute("memDTO", memberDTO);
		model.addAttribute("delivery", delivery);
		model.addAttribute("sum", sum);
		model.addAttribute("total", total);

		// cartlist에서 보낸 총 포인트
		model.addAttribute("point", point);
		log.info("delivery >>>>>>>>>>>>> " + delivery);
		log.info("sum >>>>>>>>>>>>> " + sum);
		log.info("total >>>>>>>>>>>>> " + total);
		log.info("point >>>>>>>>>>>>> " + point);

		Object obj = session.getAttribute("cartItems");
		log.info("obj >>>>>>>>>>>>> " + obj);
		if (obj != null)
			model.addAttribute("cartItems", obj);

		return "/shop/cart/buyPart";

	}

	@PostMapping("/buypart2")
	@ResponseBody // 응답 데이터를 JSON 등으로 반환하기 위해 필요
	public String buypage(@RequestParam(value = "chkbox[]") String[] chkbox, Model model, HttpSession session) {

		List<CartDTO> cartItems = new ArrayList<>(); // 각 카트 아이템을 저장할 리스트

		for (String cartNoStr : chkbox) {
			int cartNo = Integer.parseInt(cartNoStr);
			CartDTO cartItem = cservice.getCartItemByCartNo(cartNo); // 해당 카트 정보 가져오기
			cartItems.add(cartItem); // 가져온 카트 정보를 리스트에 추가
		}
		log.info("cartItems : <><><><><>< " + cartItems);

		session.setAttribute("cartItems", cartItems);
		return "/shop/cart/buyPart";

	}


	// 내 주문목록 --------------------------------------

	@GetMapping("/myorderlist")
	public String myOrderList(HttpSession session, Model model) {
		int memberNo = (int) session.getAttribute("memberNo");
		List<OrderDTO> userOrderList = oservice.getAllByUser(memberNo);
		for (OrderDTO order : userOrderList) {
			List<OrderDetailDTO> orderDetails = odservice.getOrderDetailsByOrderNo(order.getOrderNo());
			model.addAttribute("orderDetails", orderDetails);
		}
		model.addAttribute("userorderlist", userOrderList);
		return "/shop/order/myOrderList";
	}

	@GetMapping("/myorderdetail")
	public String myOrderDetail(HttpSession session, @RequestParam("orderNo") int orderNo, Model model)
			throws ParseException {
		OrderDTO order = oservice.selectOne(orderNo);
		model.addAttribute("order", order);

		String originalPhoneNumber = order.getOrderRecipientPhone();
		String formattedPhoneNumber = originalPhoneNumber.replaceFirst("(\\d{3})(\\d{4})(\\d+)", "$1-$2-$3");
		model.addAttribute("formattedPhoneNumber", formattedPhoneNumber);

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date orderDate = dateFormat.parse(order.getOrderDate());
		model.addAttribute("orderDate", orderDate);

		model.addAttribute("userOrderList", odservice.selectOne(orderNo));

		return "/shop/order/myOrderDetail";
	}

}
