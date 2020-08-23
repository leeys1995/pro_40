package com.jslhrd.service;

import java.util.List;

import com.jslhrd.domain.CorpVO;
import com.jslhrd.domain.HospVO;
import com.jslhrd.domain.NoticeVO;

public interface HomeService {

	// 공지사항 리스트 가져오기
	public List<NoticeVO> noticeList();
	
	// 병원 리스트 가져오기
	public List<HospVO> hospList();
	
	// 기업 리스트 가져오기
	public List<CorpVO> corpList();

}
