package kr.green.hanja.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import kr.green.hanja.dao.HanjaDAO;
import kr.green.hanja.vo.HanjaVO;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Data
@Slf4j
public class LoginSuccessHandler implements AuthenticationSuccessHandler {
	@Autowired
	private HanjaDAO hanjaDAO;
	private String successUrl;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		log.debug("LoginSuccessHandler 실행됨");
		// 여기서는 회원 정보를 읽어서 세션에 저장하기
		// 아이디 받기
		String userid = request.getParameter("userid");
		// 아이디로 회원정보 얻기
		List<HanjaVO> list = hanjaDAO.selectByUserid(userid);
		if(list!=null && list.size()>0) {
			HanjaVO vo = list.get(0);
			// 회원정보를 세션에 저장하기
			request.getSession().setAttribute("hanjaVO", vo);
		}
		// 어딘가로 이동
		response.sendRedirect(successUrl);
	}

}
