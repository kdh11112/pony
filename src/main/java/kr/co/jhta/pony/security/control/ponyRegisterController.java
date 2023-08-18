package kr.co.jhta.pony.security.control;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.jhta.pony.dto.PonyMemberDTO;
import kr.co.jhta.pony.security.service.PonyMemberService;
import kr.co.jhta.pony.security.service.ponyEmailService;
import kr.co.jhta.pony.security.util.redisUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
public class ponyRegisterController {
	 
	private final ponyEmailService emailService;

    @Autowired
    redisUtil redisUtil;
	
    @Autowired
    PonyMemberService service;
    
    @Autowired
    PasswordEncoder passwordEncoder;
    
        @PostMapping("/mailConfirm")
	    @ResponseBody
	    public void mailConfirm(@RequestParam String email, PonyMemberDTO dto) throws Exception {
	    	
	    	dto.setMemberEmail(email);
	    	int cnt = service.idChk(dto);
	    	if(cnt==0) {
	    		String code = emailService.sendEmailMessage(email); //sendEmailMessage 메서드안에서 인증번호생성, 유저이메일, 유효시간을 레디스에 저장했음.
		        log.info("인증코드 : " + code);//code에는 인증번호가 저장되어있음.
	    	}else {
	    		log.info("인증 코드보내기 실패 아이디중복");
	    	}
	    	
//	        return code;
	    }
	    
	    
	    @PostMapping("/autoEmailOk")
	    @ResponseBody
	    public String autoEmailOk(@RequestParam String authcode, Model model, HttpSession session) throws Exception {
	         
	    	// redisUtil.getData를 사용하여 레디스에 저장된 이메일주소를 얻어옴.(authcode 는 view에서 사용자가 입력한 인증번호, code는 해당 인증번호를 레디스에 입력하여 반환받은 이메일주소(키, 밸류값) 
	    	String email = redisUtil.getData(authcode);
	    	System.out.println(email + " 이게 이메일");

	    	
	    	String authenticated = passwordEncoder.encode(authcode + email);
	    	
	    	if (email != null  && email.equals(redisUtil.getData(authcode))) { // 인증번호로 얻어온 이메일주소가, 레디스에 저장된 인증번호에 대응하는 이메일인지 확인
	    	        // 인증 성공
	    	//		log.info(authcode);
	    	//		log.info(email);
	    	//		log.info("성공");
	    			session.setAttribute("authenticated", authenticated);
	    	    
	    			return "true";
	    	} else {
	    	        
	    	//		log.info(authcode);
    		//		log.info(email);
	    	// 		인증 실패
	    	//		log.info("실패");
	    	        
    				return "false";
	    	}
	    	
	    }
	    
	    
	    @RequestMapping(value = "/ponyRegOk", method = RequestMethod.POST)
	    public String generatePonyMember( @RequestParam(name = "email") String memberEmail,
	    								@RequestParam(name ="password", defaultValue="1")String memberPassword ,
	    								@RequestParam(name = "fullName", defaultValue="미입력")String memberName ,
	    								@RequestParam(name = "regNumberFirst", defaultValue="미입력")String memberBirthday ,
	    								@RequestParam(name = "phone", defaultValue="미입력")String memberPhone ,
	    								@RequestParam(name = "postcode", defaultValue="미입력")String memberZip ,
	    								@RequestParam(name = "address", defaultValue="미입력")String memberAddress1,
	    								@RequestParam(name = "detailAddress", defaultValue="미입력" )String memberAddress2,
	    								@RequestParam(name = "extraAddress", defaultValue="미입력")String memberAddress3,
	    						PonyMemberDTO dto, HttpSession session) throws Exception {
	    	String authenticated = (String)session.getAttribute("authenticated");
	    	
	    //	log.info(authenticated);
	    	log.info("요청 수신");
	    	dto.setMemberEmail(memberEmail);
	    	int cnt = service.idChk(dto);

	    	if(cnt==0&&authenticated==session.getAttribute("authenticated")) {// 중복아이디가 있는지 체크, 이메일 인증버튼을 눌러서 인증에 성공하고 넘어온 요청인지 체크 통과하면 db에 저장(회원가입)
	    		
	    		dto.setMemberEmail(memberEmail);
	    		dto.setMemberPassword(passwordEncoder.encode(memberPassword));
	    		dto.setMemberName(memberName);
	    		dto.setMemberBirthday(memberBirthday);
	    		dto.setMemberPhone(memberPhone);
	    		dto.setMemberZip(memberZip);
	    		dto.setMemberAddress1(memberAddress1);
	    		dto.setMemberAddress2(memberAddress2 + " " + memberAddress3);
	    		dto.setMemberProvider("Pony");
	     		System.out.println("if문에 통과해서 dto set 하는중 : " + dto);
	    		
	    		service.generateMember(dto);
	    	}else {
	    		log.info("실패 아이디중복 또는 비정상 접근");
	    	}
	    	
	    	return "/ponylogin";
	    }
	    

	 
    @PostMapping("/idCheck") // 이메일 중복 체크 메서드
    @ResponseBody
    public int idChk(PonyMemberDTO dto, @RequestParam("id") String id) throws Exception {
    	dto.setMemberEmail(id);
    	int cnt = service.idChk(dto);
    	
      return cnt;
    }
	    
}
	    
	    

