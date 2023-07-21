package kr.co.jhta.pony.control;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.jhta.pony.service.ponyEmailService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RestController
public class ponyRegisterController {
	 
	private final ponyEmailService emailService;

	    @PostMapping("/mailConfirm")
	    @ResponseBody
	    public String mailConfirm(@RequestParam String email) throws Exception {
	        String code = emailService.sendSimpleMessage(email);
	        log.info("인증코드 : " + code);
	        return code;
	    }
}
