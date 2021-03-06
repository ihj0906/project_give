package controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dto.LoginCommand;
import dto.LoginInfo;
import service.MemberService;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private MemberService memberSvc;

	@RequestMapping(method = RequestMethod.GET)
	public String form(LoginCommand loginCommand, @CookieValue(value = "rememberId", required = false) Cookie cookie) {
		if (cookie != null) {
			loginCommand.setId(cookie.getValue());
			loginCommand.setRememberId(true);
		}
		return "member/login";
	}

	@ResponseBody
	@RequestMapping(value="/check", method = RequestMethod.POST)
	public String loginCheck(LoginCommand loginComn) {
		String checkResult = "0";
		LoginInfo loginInfo = memberSvc.login(loginComn.getId(), loginComn.getPassword());
		if (loginInfo == null) {
			return checkResult;
		}else if (loginInfo != null && loginInfo.getUseyn() == 2){
			return checkResult = "1";
		}else {
			return checkResult = "2";
		}

	}
	

	@RequestMapping(method = RequestMethod.POST)
	public String submit(LoginCommand loginComn, HttpSession session, HttpServletResponse response) {
			LoginInfo loginInfo = memberSvc.login(loginComn.getId(), loginComn.getPassword());
			session.setAttribute("loginInfo", loginInfo);

			// 쿠키생성 시작 (로그인이 한번이라도 되면 쿠키생성)
			Cookie rememberCookie = new Cookie("rememberId", loginComn.getId());
			rememberCookie.setPath("/");
			if (loginComn.isRememberId()) {
				rememberCookie.setMaxAge(60 * 60 * 24 * 30); // 쿠키 시간 설정
			} else {
				rememberCookie.setMaxAge(0);
				// 0 또는 -1을 주면 바로 삭제됨
			}
			response.addCookie(rememberCookie); // 물리적 파일 생성
			// 쿠키 생성 종료

			return "redirect:/index";

	}
	
	
}
