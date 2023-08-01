package kr.co.jhta.pony.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class SessionCheckInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        Object mechanicNo = session.getAttribute("mechanicNo");
        if (mechanicNo == null) {
            // 현재 세션에 메카닉 정보가 없는 경우
            // 현재 요청이 "/reg/login"인 경우에는 인터셉트 적용 안함
            if (request.getRequestURI().equals("/reg/login")) {
                return true;
            }
            response.sendRedirect("/reg/login");
            return false;
        }
        return true;
    }
}
