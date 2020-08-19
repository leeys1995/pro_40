package com.jslhrd.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jslhrd.domain.CorpVO;
import com.jslhrd.domain.HospVO;
import com.jslhrd.domain.NoticeVO;
import com.jslhrd.mapper.HomeMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class HomeServiceImpl implements HomeService {

	// 주입
	private HomeMapper mapper;

	// 공지사항 리스트 가져오기
	@Override
	public List<NoticeVO> noticeList() {

		return mapper.noticeList();
	}

	// 병원 리스트 가져오기
	@Override
	public List<HospVO> hospList() {
		// TODO Auto-generated method stub
		return mapper.hospList();
	}
	
	// 기업 리스트 가져오기
	@Override
	public List<CorpVO> corpList() {
		// TODO Auto-generated method stub
		return mapper.corpList();
	}

}
