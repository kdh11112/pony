package kr.co.jhta.pony.security.jwt;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import io.jsonwebtoken.ExpiredJwtException;
import kr.co.jhta.pony.control.MechanicRegisterController;
import kr.co.jhta.pony.security.util.JwtTokenUtil;
import lombok.extern.slf4j.Slf4j;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

@Slf4j
@Component
public class JwtAuthorizationFilter extends OncePerRequestFilter {

    @Autowired
    private JwtUserDetailsService jwtUserDetailService;

    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    private static final List<String> EXCLUDE_URL =
            Collections.unmodifiableList(
                    Arrays.asList(
                        "/ponylogin",
                        "/"
                    ));
    
    @Override
    protected void doFilterInternal(HttpServletRequest request,
                                    HttpServletResponse response,
                                    FilterChain filterChain) throws ServletException, IOException {

        String username = null;
        String jwtToken = null;

        // 요청헤더에 담겨온 쿠키에서 JWT 토큰 추출
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("jwtToken")) {
                    jwtToken = cookie.getValue();
                }
            }
        }

        // jwtToken이 null이 아닌 경우 (즉, JWT 토큰이 존재하는 경우)
        if (jwtToken != null) {
                 try {
                     // JWT 토큰으로부터 사용자 이름을 추출합니다.
                     username = jwtTokenUtil.getUsernameFromToken(jwtToken);
                 } 
                 // JWT 토큰에서 사용자 이름을 추출하다가 예외 발생 시 
                 catch (IllegalArgumentException e) {
                     // "JWT 토큰을 가져오는 데 실패했습니다"라는 메시지를 출력합니다.
                     System.out.println("Unable to get JWT Token");
                 } 
                 // JWT 토큰이 만료된 경우 예외 처리 
                 catch (ExpiredJwtException e) {
                     // "JWT 토큰이 만료되었습니다"라는 메시지를 출력합니다.
                     System.out.println("JWT Token has expired");
                 }
             } 
             // jwtToken이 null인 경우 (즉, 요청에 JWT 토큰이 없는 경우)
             else {
                 // 경고 메시지를 로깅합니다. jwtToken은 null이므로 아무것도 출력되지 않습니다.
                 logger.warn(jwtToken);
                 //logger.warn("요청객체에 JWT 토큰 없음 String : " + jwtToken);
             }

        
        // 현재 요청의 id(username, 우리의 경우 email)가 있고, 현재 인증된 사용자가 없는 경우에 실행합니다.
        if(username != null && SecurityContextHolder.getContext().getAuthentication() == null) {

        	// jwtUserDetailService를 사용하여 사용자 정보를 가져옴 (식별정보, 비밀번호, Role 등)
        	UserDetails userDetails = this.jwtUserDetailService.loadUserByUsername(username);

        	
        	//jwtTokenUtil의 토큰 유효성검사 메서드(토큰 + 유저정보) 를 사용해서 토큰이 유효할때 인증토큰을 생성
            if(jwtTokenUtil.validateToken(jwtToken, userDetails)) {
                UsernamePasswordAuthenticationToken authenticationToken =
                        new UsernamePasswordAuthenticationToken(userDetails, null ,userDetails.getAuthorities());

                authenticationToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                SecurityContextHolder.getContext().setAuthentication(authenticationToken);
            }
        }
        //다음 필터 체인으로
        filterChain.doFilter(request,response);
    }

    @Override
    protected boolean shouldNotFilter(HttpServletRequest request) throws ServletException {
        return EXCLUDE_URL.stream().anyMatch(exclude -> exclude.equalsIgnoreCase(request.getServletPath()));
    }
}
