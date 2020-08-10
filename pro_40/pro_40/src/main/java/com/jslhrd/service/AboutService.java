package com.jslhrd.service;



import com.jslhrd.domain.AboutVO;

public interface AboutService {
	//병원 소개
	public int aboutInsert(AboutVO vo);
	
	//병원 소개 출력
	public String aboutSearch();
}
