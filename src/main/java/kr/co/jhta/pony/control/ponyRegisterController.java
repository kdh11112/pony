package kr.co.jhta.pony.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.crossstore.ChangeSetPersister;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

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
	
	
	    @PostMapping("/mailConfirm")
	    @ResponseBody
	    public String mailConfirm(@RequestParam String email) throws Exception {
	        String code = emailService.sendEmailMessage(email); //sendEmailMessage 메서드안에서 인증번호생성, 유저이메일, 유효시간을 레디스에 저장했음.
	        log.info("인증코드 : " + code);//code에는 인증번호가 저장되어있음.
	        return code;
	    }
	    
	    
	    @PostMapping("/autoEmailOk")
	    @ResponseBody
	    public String autoEmailOk(@RequestParam String authcode, Model model) throws Exception {
	         
	    	
	    	String code = redisUtil.getData(authcode);
	    	
	    	if (code == null) {
	            throw new ChangeSetPersister.NotFoundException();
	        }
	    	
	    	
	    	if (code.equals(redisUtil.getData(authcode))) {
	    	        // 인증 성공
	    			log.info(authcode);
	    			log.info(code);
	    			log.info("성공");
	    	        return "redirect:/ponyreg";
	    	} else {
	    	        
	    		log.info(authcode);
    			log.info(code);
	    		// 인증 실패
	    			log.info("실패");
	    	        return "redirect:/ponyreg";
	    	}
	    	
	    }
}
	    
	    

