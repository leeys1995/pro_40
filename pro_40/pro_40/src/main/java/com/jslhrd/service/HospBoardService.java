package com.jslhrd.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jslhrd.domain.HospBoardVO;
import com.jslhrd.domain.PageVO;

public interface HospBoardService {

	//전체 목록 카운트
			public int hospboardCount(int idx);
			
			//검색조건에 맞는 게시물 카운트
			public int hospboardSearchCount(PageVO vo);
			
			//전체 목록 검색
			public List<HospBoardVO> hospboardList(PageVO vo);
			
			//조건에 맞는 게시물 불러오기
			public List<HospBoardVO> hospboardListSearch(PageVO vo);	
			
			//병원 홈페이지 등록
			public void hospboardWrite(HospBoardVO vo);
			
			//뷰처리
			public HospBoardVO hospboardView(int idx);
			
			// 조회수
			public void hospboardHits(int idx,HttpServletRequest request, HttpServletResponse response);
			
			//수정처리
			public void hospboardModify(HospBoardVO vo);
			
			//삭제처리
			public void hospboardDelete(int idx);
			
			//파일찾기
			public String hospboardFile(int idx);
			
			//병원이름가져오기
			public String hospName(int idx);
			
			//병원 배너 가져오기
			public String hospBanner(int idx);
}
