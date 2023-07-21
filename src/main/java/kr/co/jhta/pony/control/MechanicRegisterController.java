package kr.co.jhta.pony.control;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nimbusds.oauth2.sdk.Request;

import kr.co.jhta.pony.dto.MechanicRegisterDTO;
import kr.co.jhta.pony.service.MechanicRegisterService;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class MechanicRegisterController {

	
	MechanicRegisterService rs;


	public MechanicRegisterController(MechanicRegisterService rs) {
		this.rs = rs;
	}

	@GetMapping("/reg/login")
	public String login(Model model) {
		model.addAttribute("list", rs.shopName());
		return "/registration/login";
	}
	
	@PostMapping("/reg/login")
	public String loginOk(HttpSession session, @ModelAttribute MechanicRegisterDTO dto, Model model) {
	    boolean result = rs.loginCheck(dto);
	    if (result) {
	        // 로그인에 성공하면 세션 정보 저장
	        session.setAttribute("mechanicNo", dto.getMechanicNo());
	        session.setAttribute("shopNo", dto.getShopNo());
	        session.setAttribute("mechanicName", dto.getMechanicName());
	        // 메인 페이지로 이동
	        return "redirect:/reg";
	    } else {
	        // 로그인에 실패하면 다시 로그인 페이지로 이동
	        return "redirect:/reg/login";
	    }
	}
	
	@GetMapping("/reg/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/reg/login";
	}
	
	@GetMapping("/reg/register")
	public String register(Model model) {
		model.addAttribute("list", rs.shopName());
		return "/registration/register";
	}
	
	@PostMapping("/reg/register")
	public String registerOk(@RequestParam("shopNo") int shopNo,
			@RequestParam("mechanicName") String mechanicName,
			@RequestParam("mechanicPw") String mechanicPw
			) {
		rs.register(shopNo,mechanicPw,mechanicName);
		return "redirect:/reg/login";
	}
	
	@GetMapping("/reg/change")
	public String registerChange(Model model) {
		model.addAttribute("list", rs.shopName());
		return "/registration/registerChange";
	}
	
	@PostMapping("/reg/change")
	public String registerChangeOk(
			@RequestParam("mechanicNo") int mechanicNo,
			@RequestParam("shopNo") int shopNo,
			@RequestParam("mechanicPw") String mechanicPw
			) {		
		rs.ChangePw(mechanicNo,shopNo,mechanicPw);
		return "redirect:/reg/login";
	}
	
	
	
	
}
