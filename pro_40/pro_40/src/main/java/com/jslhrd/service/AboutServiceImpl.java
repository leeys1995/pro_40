package com.jslhrd.service;


import org.springframework.stereotype.Service;

import com.jslhrd.domain.AboutVO;
import com.jslhrd.mapper.AboutMapper;

@Service
public class AboutServiceImpl implements AboutService {
	private AboutMapper mapper;
	//병원 소개
	@Override
	public int aboutInsert(AboutVO vo) {
		System.out.println("aboutinsert....");
		
		return mapper.aboutInsert(vo);
	}
	
	//병원 소개 출력
	@Override
	public String aboutSearch() {
		System.out.println("search....");
		return mapper.aboutSearch();
	}
}
