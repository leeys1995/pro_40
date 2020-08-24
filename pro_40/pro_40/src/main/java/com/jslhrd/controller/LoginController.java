package com.jslhrd.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.jslhrd.domain.MemberVO;
import com.jslhrd.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {
	private MemberService service;
	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	//2020/08/11 수정 -------------------------------->	/member/login >> /member/login_api
	@RequestMapping(value = "/member/login_api", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {

		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

		System.out.println("naverAuthUrl===>" + naverAuthUrl);
		model.addAttribute("url", naverAuthUrl);
		return "redirect:"+naverLoginBO.getAuthorizationUrl(session);
	}
	
	//2020/08/11 수정 -------------------------------->
	@RequestMapping(value = "/member/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session,HttpServletRequest request)
			throws IOException {
		System.out.println("naver callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);

		apiResult = naverLoginBO.getUserProfile(oauthToken);
		model.addAttribute("result", apiResult);
		System.out.println("json 구조로 출력===>" + apiResult.toString());
		
		//String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = null;
		try {
			obj = parser.parse(apiResult);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		JSONObject jsonObj = (JSONObject) obj;
		//2020/08/11 수정 <--------------------------------
		//3. 데이터 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		
		//response의 nickname값 파싱
		System.out.println("파싱 후 출력===>" + response_obj);
		
		//4.파싱 닉네임 세션으로 저장
		MemberVO user = new MemberVO();
		user.setName((String)response_obj.get("name"));
		user.setUserid((String)response_obj.get("id"));
		
		request.getSession().setAttribute("user", user);
		request.getSession().setMaxInactiveInterval(1800);
		//session.setAttribute("sessionId",nickname); //세션 생성
		//model.addAttribute("result", apiResult);
		
		return "redirect:/";
		//2020/08/11 수정 -------------------------------->
	}
	//2020/08/11 수정 ----------->member/logout >> member/logout_api
	@RequestMapping(value = "member/logout_api", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) throws IOException {
		System.out.println("kakao logout");
		session.invalidate();
		return "member/login";
	}
	
	//2020/08/11 수정 -------------------------------새로 추가됨
	@RequestMapping(value = "member/kakao", method = { RequestMethod.GET, RequestMethod.POST })
	public String kakao_logout(HttpSession session) throws IOException {
		System.out.println("kakao logout");
		session.invalidate();
		return "member/login";
	}

}
