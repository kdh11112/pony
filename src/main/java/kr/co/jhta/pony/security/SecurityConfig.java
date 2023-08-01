package kr.co.jhta.pony.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.logout.LogoutHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

@Configuration
@EnableWebSecurity
@Order(0)
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	DataSource dataSource;
	
	@Autowired
	UserDetailsService userDetailsService;
	
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		
		auth.userDetailsService(userDetailsService);
		
		
//	      String usernameQuery = "SELECT memberEmail as username , memberPassword as password from MEMBER where memberEmail = ?";
//	      //String authQuery = "SELECT a. id as username, b.role as authority , where a.id=b.id and a.id =?";
//	      //StringBuffer authQuery = new StringBuffer();
//	      //authQuery.append("SELECT a.id as username, b.role as authority ");
//	      //authQuery.append("from member a, member_role b ");
//	      //authQuery.append("where a.id=b.id and a.id=? ");
//	     
//	      
//	      auth.jdbcAuthentication()
//	         .dataSource(dataSource)
//	         .usersByUsernameQuery(usernameQuery);
	         //.authoritiesByUsernameQuery(authQuery.toString())
	         //.passwordEncoder(passwordEncoder); // 참조변수로 바뀜.(원랜 실행 메서드엿음)

		
		
	}
	
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
//	.csrf().disable() 추가 작업해야함
		http.csrf().disable()
			.authorizeHttpRequests() //인가정책
						//.antMatchers("/no").hasRole("ADMIN") // 해당 페이지에는 해당 권한이 필요함
			.anyRequest().permitAll() // 기본적으로 인가 필요없음
		.and()
			.formLogin()
			.loginPage("/login") //우리가 사용할 커스텀 로그인페이지 요청주소  -> 위에서 접근불가 해놧기떄문에 permitAll 해줘야 접근할수있다.
			.usernameParameter("email") // 파라미터 userDetails 에서 username으로 쓰인다.
			.passwordParameter("password") // 파라미터 userDetails 에서 userpassword로 쓰인다.
			.loginProcessingUrl("/login_proc") //로그인 처리할 url (로그인 버튼을 누르면 로그인 기능을 작동하는 요청주소)
			.defaultSuccessUrl("/") // 로그인 성공시 주소, 기본값은 루트 디렉토리로 가라
			.failureUrl("/login") // 로그인 실패시 다시 로그인 페이지
			
			
			.successHandler(new AuthenticationSuccessHandler() { //로그인 성공시 핸들러
				
				@Override
				public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
						Authentication authentication) throws IOException, ServletException {
						System.out.println("authentication : " + authentication.getName()); // 로그인을 성공하면 인증에 성공한 객체 이름 출력
						response.sendRedirect("/"); //인증에 성공하면 루트 페이지로 이동
					
				}
			})
			.failureHandler(new AuthenticationFailureHandler() { // 인증 실패시 핸들러
				
				@Override
				public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
						AuthenticationException exception) throws IOException, ServletException {
					System.out.println("exception " + exception.getMessage()); // 예외메시지 출력
					response.sendRedirect("/");
					
				}
			})
			.permitAll() //이 기능은 누구나 접근가능
			;
		
		http
			.logout()
			.logoutUrl("/logout") //로그아웃 요청 경로, 로그아웃은 기본값 Post임
			.addLogoutHandler(new LogoutHandler() {
				
				@Override
				public void logout(HttpServletRequest request, HttpServletResponse response, Authentication authentication) {
					HttpSession session = request.getSession(); // 세션 가져오기
					session.invalidate(); //세션 초기화
				}
			})
			.logoutSuccessHandler(new LogoutSuccessHandler() {
				
				@Override
				public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
						throws IOException, ServletException {
					response.sendRedirect("/login"); // 로그아웃되면 로그인 페이지로이동
					
					
				}
			})
			.and()
				.rememberMe()
				.rememberMeCookieName("cookName") // 쿠키명 변경 메소드
				.rememberMeParameter("remember") // view 쪽에서 input:text로 받을때 name
				.tokenValiditySeconds(3600)
				.userDetailsService(userDetailsService)
			
		;
		
	}
}

@Configuration
@Order(1)
class SecurityConfig2 extends WebSecurityConfigurerAdapter {

	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

		auth.inMemoryAuthentication().withUser("admin").password(passwordEncoder.encode("111")).roles("ADMIN");
		auth.inMemoryAuthentication().withUser("sys").password(passwordEncoder.encode("111")).roles("SYS"); //임시로 계정만듬. pw는 임시로 평문으로 만듬
		
	}
	
	
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
	
		
		http
			.csrf().disable()
			.authorizeHttpRequests() //인가정책
			.antMatchers("/no").hasAnyRole("ADMIN")
			.anyRequest().authenticated()
		.and()
			.httpBasic();
			
			
		
		
	}
	
	
}

