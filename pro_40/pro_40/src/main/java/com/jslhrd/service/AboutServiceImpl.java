package com.jslhrd.service;


import org.springframework.stereotype.Service;

import com.jslhrd.domain.AboutVO;
import com.jslhrd.mapper.AboutMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class AboutServiceImpl implements AboutService {
	private AboutMapper mapper;
	//첫글 입력시
	@Override
	public void aboutInsert(String main_about) {
		System.out.println("about service// insert....");
		mapper.aboutInsert(main_about);
	}
	
	//저장값 가져오기
	@Override
	public String aboutView() {
		return mapper.aboutView();
	}
	
	//DB에 값이 있을 때
	@Override
	public void aboutModify(String main_about) {
		System.out.println("about service// modify.....");
		mapper.aboutModify(main_about);
	}
	
}
