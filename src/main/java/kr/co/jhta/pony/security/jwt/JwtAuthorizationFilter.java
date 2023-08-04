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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.Collections;
import java.util.Enumeration;
import java.util.List;

@Slf4j
@Component
public class JwtAuthorizationFilter extends OncePerRequestFilter {

    @Autowired
    private JwtUserDetailsService jwtUserDetailService;

    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    // 일부 URL에 대해 필터를 건너뛸 목록을 정의합니다.
    // "/api/member"와 "/authenticate" URL은 필터를 적용하지 않습니다.
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

//        // HTTP 요청의 모든 헤더 이름을 출력합니다.
//        Enumeration<String> headerNames = request.getHeaderNames();
//        while (headerNames.hasMoreElements()) {
//            String headerName = headerNames.nextElement();
//            String headerValue = request.getHeader(headerName);
//            System.out.println("헤더 Name: " + headerName + ", 헤더 Value: " + headerValue);
//        }

        // HTTP 헤더에서 "Authorization" 토큰을 추출합니다.
        final String requestTokenHeader = request.getHeader("Authorization");

        //토큰 어덯게 생겻어
        //log.info("리퀘스트 토큰 헤더 어떻게 생겻어? 여기서 널인데..? : {}", requestTokenHeader);

        String username = null;
        String jwtToken = null;

        // 토큰이 "Bearer "로 시작하면 토큰을 추출하여 처리합니다.
        if (requestTokenHeader != null && requestTokenHeader.startsWith("Bearer ")) {
            jwtToken = requestTokenHeader.substring(7);
            log.info("doFilterInteranl 지나가는중 " + jwtToken);
            try {
                // 토큰에서 사용자 이름을 추출합니다.
                username = jwtTokenUtil.getUsernameFromToken(jwtToken);
            } catch (IllegalArgumentException e) {
                System.out.println("Unable to get JWT Token");
            } catch (ExpiredJwtException e) {
                System.out.println("JWT Token has expired");
            }
        } else {
        	logger.warn(jwtToken);
            logger.warn("JWT 토큰 없어? Bear String : " + jwtToken);
        }

        // 추출한 사용자 이름이 있고, SecurityContext에 인증이 없으면 인증을 수행합니다.
        if(username != null && SecurityContextHolder.getContext().getAuthentication() == null) {
            UserDetails userDetails = this.jwtUserDetailService.loadUserByUsername(username);

            // 추출한 사용자 이름과 토큰을 이용하여 토큰의 유효성을 검증합니다.
            if(jwtTokenUtil.validateToken(jwtToken, userDetails)) {
                // 유효한 토큰일 경우 사용자를 인증하고, SecurityContext에 인증 정보를 저장합니다.
                UsernamePasswordAuthenticationToken authenticationToken =
                        new UsernamePasswordAuthenticationToken(userDetails, null ,userDetails.getAuthorities());

                authenticationToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                SecurityContextHolder.getContext().setAuthentication(authenticationToken);
            }
        }
        // 다음 필터로 요청을 전달합니다.
        filterChain.doFilter(request,response);
    }

    @Override
    protected boolean shouldNotFilter(HttpServletRequest request) throws ServletException {
        // EXCLUDE_URL 리스트에 포함된 URL에 대해서는 필터를 건너뜁니다.
        return EXCLUDE_URL.stream().anyMatch(exclude -> exclude.equalsIgnoreCase(request.getServletPath()));
    }
}
