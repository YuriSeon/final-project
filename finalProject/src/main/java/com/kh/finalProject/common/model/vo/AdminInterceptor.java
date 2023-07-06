package com.kh.finalProject.common.model.vo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.finalProject.member.model.vo.Member;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if (loginUser != null && "A".equals(loginUser.getStatus())) {
			return true;
		}else {
			session.setAttribute("alertMsg2", "관리자 계정이 아닙니다.");
			
			response.sendRedirect(request.getContextPath());
			return false;
		}
	}
}
