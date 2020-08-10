package com.jslhrd.controller;

import java.io.IOException;

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

import lombok.AllArgsConstructor;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {
	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	@RequestMapping(value = "/member/login_api", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {

		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

		System.out.println("naverAuthUrl===>" + naverAuthUrl);
		model.addAttribute("url", naverAuthUrl);
		return "redirect:"+naverLoginBO.getAuthorizationUrl(session);
	}

	@RequestMapping(value = "/member/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
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
		//3. 데이터 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		//response의 nickname값 파싱
		String name = (String)response_obj.get("name");
		//값 DB에 저장
		
		//
		
		System.out.println(name);
		System.out.println("파싱 후 출력===>" + response_obj);
		//4.파싱 닉네임 세션으로 저장
		
		//session.setAttribute("sessionId",nickname); //세션 생성
		//model.addAttribute("result", apiResult);
		
		return "member/naverSuccess";
	}

	@RequestMapping(value = "member/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) throws IOException {
		System.out.println("kakao logout");
		session.invalidate();
		return "member/login";
	}

}
