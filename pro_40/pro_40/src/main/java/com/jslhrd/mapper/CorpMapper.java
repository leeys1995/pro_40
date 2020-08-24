package com.jslhrd.mapper;

import java.util.List;

import com.jslhrd.domain.CorpBoardVO;
import com.jslhrd.domain.CorpVO;
import com.jslhrd.domain.PageVO;

public interface CorpMapper {

	// 전체 목록 카운트
	public int corpCount();

	// 검색조건에 맞는 게시물 카운트
	public int corpSearchCount(PageVO vo);

	// 전체 목록 검색
	public List<CorpVO> corpList(PageVO vo);

	// 조건에 맞는 게시물 불러오기
	public List<CorpVO> corpListSearch(PageVO vo);

	// 병원 홈페이지 등록
	public void corpWrite(CorpVO vo);

	// 뷰처리
	public CorpVO corpView(int idx);

	// 조회수
	public void corpHits(int idx);

	// 수정처리
	public void corpModify(CorpVO vo);

	//삭제처리
	public void corpDelete(int idx);
		
	//파일찾기( c_banner , c_photo, p_photo, c_video)
	public String corpBanner(int idx);
	public String corpCphoto(int idx);
	public String corpPphoto(int idx);
	public String corpCvideo(int idx);

	// 공지사항 불러오기
	public List<CorpBoardVO> corpboardList(int idx);
	
	//홈페이지 관리 패스워드 가져오기
	public String corparationPass(int idx);
}
