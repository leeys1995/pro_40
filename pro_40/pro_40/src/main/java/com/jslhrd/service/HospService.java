package com.jslhrd.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jslhrd.domain.HospBoardVO;
import com.jslhrd.domain.HospVO;
import com.jslhrd.domain.PageVO;

public interface HospService {

	// 전체 목록 카운트
	public int hospCount();

	// 검색조건에 맞는 게시물 카운트
	public int hospSearchCount(PageVO vo);

	// 전체 목록 검색
	public List<HospVO> hospList(PageVO vo);

	// 조건에 맞는 게시물 불러오기
	public List<HospVO> hospListSearch(PageVO vo);

	// 병원 홈페이지 등록
	public void hospWrite(HospVO vo);

	// 뷰처리
	public HospVO hospView(int idx);

	// 조회수
	public void hospHits(int idx,HttpServletRequest request, HttpServletResponse response);
	
	//공지사항 불러오기
	public List<HospBoardVO> hospboardList(int idx);
	
	//수정처리
	public void hospModify(HospVO vo);
}
