package kr.co.jhta.pony.control;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import kr.co.jhta.pony.dto.MechanicRegisterDTO;
import kr.co.jhta.pony.service.MechanicRegisterService;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@Api(tags = "오프라인 개인정보관리")
public class MechanicRegisterController {

	
	MechanicRegisterService mechanicRegisterService;


	public MechanicRegisterController(MechanicRegisterService mechanicRegisterService) {
		this.mechanicRegisterService = mechanicRegisterService;
	}
	@ApiOperation(value = "로그인", notes = "로그인 페이지로 이동")
	@GetMapping("/reg/login")
	public String login(Model model) {
		model.addAttribute("list", mechanicRegisterService.findAllshopName());
		return "/registration/login";
	}
	
	@PostMapping("/reg/login")
	@ApiOperation(value = "로그인 버튼", notes = "로그인 이 완료되면 reg로 이동")
	public String loginOk(HttpSession session, @ModelAttribute MechanicRegisterDTO dto, Model model) {
	    boolean result = mechanicRegisterService.isloginCheck(dto);
	    mechanicRegisterService.findOneMechanicName(dto);
	    if (result) {
	        // 로그인에 성공하면 세션 정보 저장
	        session.setAttribute("mechanicNo", mechanicRegisterService.findOneMechanicName(dto).getMechanicNo());
	        session.setAttribute("shopNo", mechanicRegisterService.findOneMechanicName(dto).getShopNo());
	        session.setAttribute("mechanicName", mechanicRegisterService.findOneMechanicName(dto).getMechanicName());
	        // 메인 페이지로 이동
	        return "redirect:/reg/registration";
	    } else {
	        // 로그인에 실패하면 다시 로그인 페이지로 이동
	        return "redirect:/reg/login";
	    }
	}
	
	@GetMapping("/reg/logout")
	@ApiOperation(value = "로그아웃", notes = "로그아웃이 되며 로그인 페이지로 이동")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/reg/login";
	}
	
	@GetMapping("/reg/register")
	@ApiOperation(value = "회원가입", notes = "회원가입 페이지로 이동")
	public String register(Model model,HttpSession session) {
		model.addAttribute("list", mechanicRegisterService.findAllshopName());
		model.addAttribute("Id", mechanicRegisterService.finOneId());
		model.addAttribute("shopNo", session.getAttribute("shopNo"));
		return "/registration/register";
	}
	
	@PostMapping("/reg/register")
	@ApiOperation(value = "회원가입 버튼", notes = "회원가입이 되며 로그인 페이지로 이동")
	public String registerOk(@RequestParam("shopNo") int shopNo,
			@RequestParam("mechanicName") String mechanicName,
			@RequestParam("mechanicPw") String mechanicPw
			) {
		mechanicRegisterService.createRegister(shopNo,mechanicPw,mechanicName);
		return "redirect:/reg/login";
		
	}
	
	@GetMapping("/reg/change")
	@ApiOperation(value = "회원정보 수정", notes = "회원정보 수정 페이지로 이동")
	public String registerChange(Model model) {
		model.addAttribute("list", mechanicRegisterService.findAllshopName());
		return "/registration/registerChange";
	}
	
	@PostMapping("/reg/change")
	@ApiOperation(value = "회원정보 수정버튼", notes = "회원정보를 수정")
	public String registerChangeOk(
			@RequestParam("mechanicNo") int mechanicNo,
			@RequestParam("shopNo") int shopNo,
			@RequestParam("mechanicPw") String mechanicPw
			) {		
		mechanicRegisterService.saveChangePw(mechanicNo,shopNo,mechanicPw);
		return "redirect:/reg/login";
	}
	
	
	
	
}
