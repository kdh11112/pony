package kr.co.jhta.pony.security;

import java.io.IOException;
import java.util.Map;

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
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.security.web.authentication.logout.LogoutHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import kr.co.jhta.pony.dto.PonyMemberDTO;
import kr.co.jhta.pony.security.jwt.JwtAuthenticationEntryPoint;
import kr.co.jhta.pony.security.jwt.JwtAuthorizationFilter;
import kr.co.jhta.pony.security.service.CustomOAuth2UserService;
import kr.co.jhta.pony.security.service.CustomUserDetailsService;
import kr.co.jhta.pony.security.service.PonyMemberService;
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

   @Autowired
   private PonyMemberService ponyMemberService;

   SecurityContextHolder securitycontextholder;

   @Override
   protected void configure(AuthenticationManagerBuilder auth) throws Exception {
      auth.authenticationProvider(authenticationProvider());
   }

   // 사용자 인증을 처리하는 컴포넌트
   @Bean
   public DaoAuthenticationProvider authenticationProvider() {
      DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
      authProvider.setUserDetailsService(customUserDetailsService);
      authProvider.setPasswordEncoder(passwordEncoder);
      return authProvider;
   }

   @Override
   protected void configure(HttpSecurity http) throws Exception {
      http.cors().and().csrf().disable().authorizeRequests()
            .antMatchers("/css/**", "/js/**", "/images/**", "/webjars/**").permitAll() // 정적 리소스에 대해서도 인증 없이 접근 허용
            .antMatchers("/login", "/", "/ponyreg", "/ponyRegOk", "/model/**", "/admin", "/adminlogin").permitAll() // 로그인 페이지와 기본페이지는 인증 없이 접근 허용
            .anyRequest().authenticated() // 그 외 모든 요청은 인증된 사용자만 접근 가능
//            .authorizeHttpRequests() //인가정책
//                 //.antMatchers("/no").hasRole("ADMIN") // 해당 페이지에는 해당 권한이 필요함
//              .anyRequest().permitAll() // 기본적으로 인가 필요없음
            .and().formLogin().loginPage("/login").usernameParameter("email").passwordParameter("password")
            .loginProcessingUrl("/login_proc").defaultSuccessUrl("/").failureUrl("/login")
            .authenticationDetailsSource(new WebAuthenticationDetailsSource() {
                    @Override
                    public WebAuthenticationDetails buildDetails(HttpServletRequest request) {
                        HttpSession session = request.getSession();
                        session.setAttribute("targetUrl", request.getHeader("Referer"));
                        return super.buildDetails(request);
                    }
                })
            .successHandler(new AuthenticationSuccessHandler() {
               @Override
               public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                     Authentication authentication) throws IOException, ServletException {

                  String username = authentication.getName();

                  // 토큰생성 및 클라이언트에 쿠키 저장 및 전달
                  generateTokenAndCookie(response, username);
                  System.out.println("여기 지나가니?");
               
                     String targetUrl = getTargetUrlFromSession(request.getSession());

                       if (targetUrl != null) {
                           // 로그인을 시도한 페이지에 따라 다른 URL로 리다이렉트
                           if (targetUrl.endsWith("/login")) {
                               response.sendRedirect("/");
                           } else if (targetUrl.endsWith("/adminlogin")) {
                               response.sendRedirect("/admin");
                           } else {
                               response.sendRedirect(targetUrl);
                           }
                       } else {
                           // 기본적으로 지정된 URL로 리다이렉트
                           response.sendRedirect("/");
                       }
                   
               }
            }).failureHandler(new AuthenticationFailureHandler() {
               @Override
               public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
                     AuthenticationException exception) throws IOException, ServletException {

                  String email = request.getParameter("email");
                  PonyMemberDTO dto = ponyMemberService.getMemberEmail(email);

                  String errorMessage = "";

                  if (dto != null) {
                     String pony = "Pony";
                     String provider = dto.getMemberProvider();
                     if (provider.equals(pony)) {
                        errorMessage = "비밀번호가 틀렸습니다.";
                     } else {
                        errorMessage = "당신은 " + dto.getMemberProvider() + "계정으로 가입되어 있습니다. \\n"
                              + dto.getMemberProvider() + "계정으로 로그인 해 주세요.";
                     }
                     request.getSession().setAttribute("errorMessage", errorMessage); // 세션에 에러 메시지 저장
                  }

                  response.sendRedirect("/login"); // 리다이렉트하여 로그인 페이지로 이동
               }
            }).permitAll().and().logout().logoutUrl("/logout").addLogoutHandler(new LogoutHandler() {
               @Override
               public void logout(HttpServletRequest request, HttpServletResponse response,
                     Authentication authentication) {
                  HttpSession session = request.getSession();
                  session.invalidate();

                  Cookie cookie = new Cookie("jwtToken", null);
                  cookie.setMaxAge(0);
                  response.addCookie(cookie);
               }
            }).logoutSuccessHandler(new LogoutSuccessHandler() {
               @Override
               public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response,
                     Authentication authentication) throws IOException, ServletException {
                  response.sendRedirect("/login");
               }
            })
//        .and()
//            .rememberMe()   //jwt토큰 인증방식과 같이 사용하기에는 적합하지 않음.
//                .rememberMeCookieName("jwtToken")
//                .rememberMeParameter("remember")
//                .tokenValiditySeconds(3600)
//                .userDetailsService(customUserDetailsService)
            .and().oauth2Login().loginPage("/login") // 로그인 페이지 설정
            .defaultSuccessUrl("/") // OAuth 2.0 로그인 성공하면 루트 페이지로 이동
            .successHandler(new AuthenticationSuccessHandler() {
               @Override
               public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                     Authentication authentication) throws IOException, ServletException {

                  OAuth2User oauth2User = (OAuth2User) securitycontextholder.getContext().getAuthentication()
                        .getPrincipal();
                  String username = null;

                  Map<String, Object> attributes = oauth2User.getAttributes();

                  if (attributes.containsKey("kakao_account")) {
                     Map<String, Object> kakaoAccount = (Map<String, Object>) attributes.get("kakao_account");

                     if (kakaoAccount.containsKey("email")) {
                        String email = (String) kakaoAccount.get("email");
                        username = email;
                        System.out.println("Kakao Email: " + email);
                     }

                  } else {
                     String email = (String) attributes.get("email");
                     if (email != null) {
                        username = email;
                        System.out.println("Email: " + email);
                     } else {
                        System.out.println("이메일이 없습니다.");
                     }
                  }

                  generateTokenAndCookie(response, username);

                  response.sendRedirect("/"); // 로그인 성공하면 루트 페이지로 이동
               }
            }).userInfoEndpoint().userService(customOAuth2UserService); // OAuth 2.0 사용자 정보를 처리할 커스텀 UserService를 설정

      // JwtAuthorizationFilter를 UsernamePasswordAuthenticationFilter 앞에 추가
      http.addFilterBefore(jwtAuthorizationFilter, UsernamePasswordAuthenticationFilter.class);
   }

   private void generateTokenAndCookie(HttpServletResponse response, String username) {
      // JwtTokenUtil을 사용하여 토큰을 생성
      String token = jwtTokenUtil.generateToken(username);

      // 생성된 토큰을 쿠키에 저장
      Cookie cookie = new Cookie("jwtToken", token);
      cookie.setPath("/"); // 쿠키의 유효 범위를 "/"로 설정하여 모든 경로에서 사용 가능하도록 만듬
      cookie.setHttpOnly(true); // 클라이언트에서 Javascript로 쿠키 접근 불가
      cookie.setSecure(false); // true로 하면 https 통신으로만 쿠키를 전송함. 우리는 localhost를 사용중이므로 http도 사용.
      response.addCookie(cookie);

      // //확인용 코드 /// 요청객체에서 확인하는게 아니라, 쿠키에 담아서 확인. 쿠키는 자동으로 요청객체에 쿠키로 담김
      // final String requestTokenHeader = request.getHeader("Authorization");
      // System.out.println("리퀘스트 토큰 해더 : " + requestTokenHeader);
   }

   //요청한 페이지에 따라 리다이렉트할 URL을 결정하는 메서드
   private String getTargetUrlFromSession(HttpSession session) {
       String targetUrl = (String) session.getAttribute("targetUrl");
       System.out.println("세션에서 가져온 url " + targetUrl);
       // 세션에서 가져온 후에는 세션에서 삭제해줌
       session.removeAttribute("targetUrl");
       return targetUrl;
   }

}