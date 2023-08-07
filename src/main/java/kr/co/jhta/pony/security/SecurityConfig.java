package kr.co.jhta.pony.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.authentication.logout.LogoutHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import kr.co.jhta.pony.security.jwt.JwtAuthenticationEntryPoint;
import kr.co.jhta.pony.security.jwt.JwtAuthorizationFilter;
import kr.co.jhta.pony.security.service.CustomOAuth2UserService;
import kr.co.jhta.pony.security.service.CustomUserDetailsService;
import kr.co.jhta.pony.security.util.JwtTokenUtil;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private CustomUserDetailsService customUserDetailsService;

	@Autowired
	private CustomOAuth2UserService customOAuth2UserService;
	
    @Autowired
    private JwtAuthenticationEntryPoint jwtAuthenticationEntryPoint;

    @Autowired
    private JwtAuthorizationFilter jwtAuthorizationFilter;

    @Autowired
    private JwtTokenUtil jwtTokenUtil;
    
    
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(authenticationProvider());
    }

    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(customUserDetailsService);
        authProvider.setPasswordEncoder(passwordEncoder);
        return authProvider;
    }

    @Override
    @Bean
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }


    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
            .cors()
        .and()
            .csrf().disable()
            .authorizeRequests()
            .antMatchers("/css/**", "/js/**", "/images/**", "/webjars/**").permitAll() // 정적 리소스에 대해서도 인증 없이 접근 허용
            .antMatchers("/login", "/", "/ponyreg").permitAll() // 로그인 페이지와 기본 페이지는 인증 없이 접근 허용
            .anyRequest().authenticated() // 그 외 모든 요청은 인증된 사용자만 접근 가능
//            .authorizeHttpRequests() //인가정책
//	        		//.antMatchers("/no").hasRole("ADMIN") // 해당 페이지에는 해당 권한이 필요함
//	        	.anyRequest().permitAll() // 기본적으로 인가 필요없음
        .and()
            .formLogin()
                .loginPage("/login")
                .usernameParameter("email")
                .passwordParameter("password")
                .loginProcessingUrl("/login_proc")
                .defaultSuccessUrl("/")
                .failureUrl("/login")
                .successHandler(new AuthenticationSuccessHandler() {
                    @Override
                    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                                        Authentication authentication) throws IOException, ServletException {
                        String username = authentication.getName();
                        
                        // JwtTokenUtil을 사용하여 토큰을 생성합니다.
                        String token = jwtTokenUtil.generateToken(username);
                        System.out.println("로그인 성공 핸들러 통과중 토큰 : " + token); //<--- 여기선 있음.
                        
						/*
						 * // 생성된 토큰을 응답 헤더에 추가 response.addHeader("Authorization", token); // <-- 여기서
						 * null임.
						 */
                     // 생성된 토큰을 쿠키에 저장합니다.
                        Cookie cookie = new Cookie("jwtToken", token);
                        cookie.setPath("/"); // 쿠키의 유효 범위를 "/"로 설정하여 모든 경로에서 사용 가능하도록 합니다.
                        response.addCookie(cookie);

//                        //확인용 코드  /// 요청객체에서 확인하는게 아니라, 쿠키에 담아서 확인. 쿠키는 자동으로 요청객체에 쿠키로 담김
//                        final String requestTokenHeader = request.getHeader("Authorization");
//                        System.out.println("리퀘스트 토큰 해더 : " + requestTokenHeader);
                        
                        response.sendRedirect("/"); // 로그인 성공하면 루트 페이지로 이동
                    }
                })
                .failureHandler(new AuthenticationFailureHandler() {
                    @Override
                    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
                            AuthenticationException exception) throws IOException, ServletException {
                        System.out.println("exception " + exception.getMessage());
                        response.sendRedirect("/login");
                    }
                })
                .permitAll()
            .and()
            .logout()
                .logoutUrl("/logout")
                .addLogoutHandler(new LogoutHandler() {
                    @Override
                    public void logout(HttpServletRequest request, HttpServletResponse response,
                            Authentication authentication) {
                        HttpSession session = request.getSession();
                        session.invalidate();
                    }
                })
                .logoutSuccessHandler(new LogoutSuccessHandler() {
                    @Override
                    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response,
                            Authentication authentication) throws IOException, ServletException {
                        response.sendRedirect("/login");
                    }
                })
            .and()
            .rememberMe()
                .rememberMeCookieName("cookName")
                .rememberMeParameter("remember")
                .tokenValiditySeconds(3600)
                .userDetailsService(customUserDetailsService)
        	.and()
            .oauth2Login()
            .loginPage("/login") // 로그인 페이지 설정
            .defaultSuccessUrl("/") // OAuth 2.0 로그인 성공하면 루트 페이지로 이동
            .userInfoEndpoint()
                .userService(customOAuth2UserService); // OAuth 2.0 사용자 정보를 처리할 커스텀 UserService를 설정
        		
                
        			
        
        
        // JwtAuthorizationFilter를 UsernamePasswordAuthenticationFilter 앞에 추가
        http.addFilterBefore(jwtAuthorizationFilter, UsernamePasswordAuthenticationFilter.class);
    }

}
