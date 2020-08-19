package com.jslhrd.controller;


import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jslhrd.domain.SearchVO;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/about")
@AllArgsConstructor

public class SearchController {
	private static final Logger log = LoggerFactory.getLogger(SearchController.class);
	
	@GetMapping("search_window")
	public void search_window() {
		log.info("test");
		
	}
	@PostMapping("search_window")
	public String search_post(SearchVO vo) {
		log.info("post-----------");
		System.out.println(vo.getHo_co());
		System.out.println(vo.getBooking());
		return "search_window";
	}
	// 출력 테스트 2020/08/18
	@PostMapping("search_test")
	public void test(HttpServletRequest request) {
		log.info("search test......");
		String search01 = request.getParameter("search01");
		String radio = request.getParameter("ho_co");
		
		String[] checkbox = request.getParameterValues("booking");
		System.out.println("search01===>" + search01 + " radio==>" + radio);
		
		String test ="";
		for(int x=0; x<checkbox.length; x++) {
			test +=checkbox[x] +","; 
		}
		System.out.println("checkbox==>" + test);
	}
	
	
	@GetMapping("test_window")
	public void test() {
		log.info("tttttttttt.........");
		
	}
	
	
	
}
