package com.jslhrd.mapper;

import java.util.List;

import com.jslhrd.domain.CorpBoardVO;
import com.jslhrd.domain.HospBoardVO;
import com.jslhrd.domain.PageVO;

public interface CorpBoardMapper {

	//전체 목록 카운트
			public int corpboardCount(int idx);
			
			//검색조건에 맞는 게시물 카운트
			public int corpboardSearchCount(PageVO vo);
			
			//전체 목록 검색
			public List<CorpBoardVO> corpboardList(PageVO vo);
			
			//조건에 맞는 게시물 불러오기
			public List<CorpBoardVO> corpboardListSearch(PageVO vo);	
			
			//병원 홈페이지 등록
			public void corpboardWrite(CorpBoardVO vo);
			
			//뷰처리
			public CorpBoardVO corpboardView(int idx);
			
			// 조회수
			public void corpboardHits(int idx);
			
			//수정처리
			
			//삭제처리
			
			//파일찾기
			
			//병원이름가져오기
			public String corpName(int idx);
			
			//병원 배너 가져오기
			public String corpBanner(int idx);


}
