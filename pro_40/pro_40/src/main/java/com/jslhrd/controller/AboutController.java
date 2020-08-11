package com.jslhrd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jslhrd.domain.AboutVO;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class AboutController {
	
	@GetMapping("about/about")
	public void about() {
		System.out.println("about....");
	}
	
	@PostMapping("about/about")
	public void about_pro(AboutVO vo) {
		System.out.println("about pro....");
		System.out.println("값===" + vo.getMain_about().length());
	}

}
