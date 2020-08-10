package com.jslhrd.mapper;

import com.jslhrd.domain.AboutVO;

public interface AboutMapper {

	//병원 소개
	public int aboutInsert(AboutVO vo);
	
	//병원소개 메인페이지
	public String aboutSearch();
	
}
