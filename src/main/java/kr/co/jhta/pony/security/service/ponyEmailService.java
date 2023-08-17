package kr.co.jhta.pony.security.service;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import kr.co.jhta.pony.security.util.redisUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;



	@PropertySource("classpath:application.properties")
	@Slf4j
	@RequiredArgsConstructor
	@Service
	public class ponyEmailService {

		
	    private final JavaMailSender javaMailSender;
	    
	    @Autowired
	    redisUtil redisUtil;
	    
	    //인증번호 생성
	    private final String ePw = createKey();

	    @Value("${spring.mail.username}")
	    private String id;

	    
	    //서버측에서 보낼 메세지 생성
	    public MimeMessage createMessage(String toEmail)throws MessagingException, UnsupportedEncodingException {
	        log.info("보내는 대상 : "+ toEmail);
	        log.info("인증 번호 : " + ePw);
	        
	        //메세지 객체 생성
	        MimeMessage message = javaMailSender.createMimeMessage();
	        
	        message.addRecipients(MimeMessage.RecipientType.TO, toEmail); // to 보내는 대상
	        message.setSubject("회원가입 인증 코드: "); //메일 제목

	        // 메일 내용 메일의 subtype을 html로 지정하여 html문법 사용 가능
	        String msg="";
	        msg += "<h1 style=\"font-size: 30px; padding-right: 30px; padding-left: 30px;\">이메일 주소 확인</h1>";
	        msg += "<p style=\"font-size: 20px; padding-right: 30px; padding-left: 30px;\">아래 확인 코드를 회원가입 화면에 인증번호 입력란에 입력하고 확인버튼을 눌러주세요.</p>";
	        msg += "<div style=\"padding-right: 30px; padding-left: 30px; margin: 30px 0 30px;\"><table style=\"border-collapse: collapse; border: 0; background-color: #F4F4F4; height: 70px; table-layout: fixed; word-wrap: break-word; border-radius: 6px;\"><tbody><tr><td style=\"text-align: center; vertical-align: middle; font-size: 30px;\">";
	        msg += ePw;
	        msg += "</td></tr></tbody></table></div>";

	        message.setText(msg, "utf-8", "html"); //내용, charset타입, subtype
	        message.setFrom(new InternetAddress(id,"Pony")); //보내는 사람의 메일 주소, 보내는 사람 이름
	        
	        
	        return message;
	    }

	    // 인증코드 만들기
	    public static String createKey() {
	        StringBuffer key = new StringBuffer();
	        Random rnd = new Random();

	        for (int i = 0; i < 6; i++) { // 인증코드 6자리
	            key.append((rnd.nextInt(10)));
	        }
	        return key.toString();
	    }

	    /*
	        메일 발송
	        sendEmailMessage의 매개변수로 들어온 toEmail는 인증번호를 받을 메일주소
	        MimeMessage 객체 안에 내가 전송할 메일의 내용을 담아준다.
	        bean으로 등록해둔 javaMailSender 객체를 사용하여 이메일 send
	     */
	    public String sendEmailMessage(String toEmail) throws Exception {
	        MimeMessage message = createMessage(toEmail);
	        try {
	        					//생성키 암호키, 유저이메일, 유효시간(1분) 을 레디스 DB에 저장
	        	redisUtil.setDataExpire(ePw, toEmail, 60 * 1L);
	            javaMailSender.send(message); // 메일 발송
	        } catch (MailException es) {
	            es.printStackTrace();
	            throw new IllegalArgumentException();
	        }
	        return ePw; // 메일로 보냈던 인증 코드를 서버로 리턴
	    }
	    
	    

	
	}
	
