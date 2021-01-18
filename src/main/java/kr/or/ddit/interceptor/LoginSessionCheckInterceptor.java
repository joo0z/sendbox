package kr.or.ddit.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.or.ddit.emp.vo.EmpVO;


public class LoginSessionCheckInterceptor extends HandlerInterceptorAdapter{

	private static final Logger logger = LoggerFactory.getLogger(LoginSessionCheckInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		// 사용자가 정상적으로 접속 했는지 체크
		// LoginController를 통해 정삭적으로 접속 했을 경우
		// Session에 S_MEMBER 속성이 존재해야함
		HttpSession session = request.getSession();
		EmpVO empVO = (EmpVO) session.getAttribute("EMP");
		
		logger.debug("================================session info========================================");
		logger.debug("");
		logger.debug("");
		logger.debug("session info : {}, session emp info : {}", session, empVO);
		logger.debug("");
		logger.debug("");
		logger.debug("====================================================================================");
		// 로그인 페이지로 이동
		if(empVO == null) {
			response.sendRedirect(request.getContextPath() + "/login/view");
			return false;
		}
		return true;
	}
}
