package com.jslhrd.controller;



import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jslhrd.domain.SearchVO;
import com.jslhrd.service.SearchService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/about")
@AllArgsConstructor

public class SearchController {
	private static final Logger log = LoggerFactory.getLogger(SearchController.class);
	private SearchService service;
	
	@GetMapping("search_page")
	public void search_window(@RequestParam("search") String search,Model model) {
		log.info("search page....");
		log.info("var===>" + search);
		
		List<SearchVO> list = service.all_Search(search);
		System.out.println("testt>>>" + list);
		model.addAttribute("list",list);
		
	}
	
}
