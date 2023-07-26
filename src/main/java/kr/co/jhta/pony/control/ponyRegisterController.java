package kr.co.jhta.pony.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.crossstore.ChangeSetPersister;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.jhta.pony.dto.PonyMemberDTO;
import kr.co.jhta.pony.service.PonyMemberService;
import kr.co.jhta.pony.service.ponyEmailService;
import kr.co.jhta.pony.service.redisUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RestController
public class ponyRegisterController {
	  
	private final ponyEmailService emailService;

    @Autowired
    redisUtil redisUtil;
	
    @Autowired
    PonyMemberService service;
    
    @Autowired
    PasswordEncoder passwordEncoder;
    
    
	
	    @PostMapping("/mailConfirm")
	    public void mailConfirm(@RequestParam String email) throws Exception {
	        String code = emailService.sendEmailMessage(email); //sendEmailMessage 메서드안에서 인증번호생성, 유저이메일, 유효시간을 레디스에 저장했음.
	        log.info("인증코드 : " + code);//code에는 인증번호가 저장되어있음.
//	        return code;
	    }
	    
	    
	    @PostMapping("/autoEmailOk")
	    @ResponseBody
	    public String autoEmailOk(@RequestParam String authcode, Model model) throws Exception {
	         
	    	// redisUtil.getData를 사용하여 레디스에 저장된 이메일주소를 얻어옴.(authcode 는 view에서 사용자가 입력한 인증번호, code는 해당 인증번호를 레디스에 입력하여 반환받은 이메일주소(키, 밸류값) 
	    	String email = redisUtil.getData(authcode);
	    	
	    	if (email == null) {
	            throw new ChangeSetPersister.NotFoundException();
	        }
	    	
	    	
	    	if (email.equals(redisUtil.getData(authcode))) { // 인증번호로 얻어온 이메일주소가, 레디스에 저장된 인증번호에 대응하는 이메일인지 확인
	    	        // 인증 성공
	    			log.info(authcode);
	    			log.info(email);
	    			log.info("성공");
	    	        return "redirect:/ponyreg";
	    	} else {
	    	        
	    		log.info(authcode);
    			log.info(email);
	    		// 인증 실패
	    			log.info("실패");
	    	        return "redirect:/ponyreg";
	    	}
	    	
	    }
	    
	    
	    @PostMapping("/ponyRegOk")
	    public void createPonyMember( @RequestParam("email") String memberEmail,
	    								@RequestParam("password")String memberPassword ,
	    								@RequestParam("fullName")String memberName ,
	    								@RequestParam("regNumberFirst")String memberBirthday ,
	    								@RequestParam("phone")String memberPhone ,
	    								@RequestParam("postcode")String memberZip ,
	    								@RequestParam("address")String memberAddress1,
	    								@RequestParam("detailAddress")String memberAddress2,
	    								@RequestParam("extraAddress")String memberAddress3,
	    						PonyMemberDTO dto) {
	    	
	    	dto.setMemberEmail(memberEmail);
	    	dto.setMemberPassword(passwordEncoder.encode(memberPassword));
	    	dto.setMemberName(memberName);
	    	dto.setMemberBirthday(memberBirthday);
	    	dto.setMemberPhone(memberPhone);
	    	dto.setMemberZip(memberZip);
	    	dto.setMemberAddress1(memberAddress1);
	    	dto.setMemberAddress2(memberAddress2 + " " + memberAddress3);
	    	
	    	log.info("여기 왔어?");
	    	
	    	service.createMember(dto);
	    	
	    }
	    
	    
}
	    
	    

