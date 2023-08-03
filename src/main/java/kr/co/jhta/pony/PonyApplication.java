package kr.co.jhta.pony;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@SpringBootApplication
public class PonyApplication {

	
	
	@Bean// 이런 객체를 스프링에게 관리해줘..  순환참조가 생기므로 SecuretyConfig에서 옮겨옴 
	PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	public static void main(String[] args) {
		SpringApplication.run(PonyApplication.class, args);
	}

}
