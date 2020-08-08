package com.jslhrd.mapper;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jslhrd.domain.NoticeVO;
import com.jslhrd.domain.PageVO;

public interface NoticeMapper {
    

	// 전체 목록 카운트
	public int noticeCount();

	// 검색조건에 맞는 게시물 카운트
	public int noticeSearchCount(PageVO vo);

	// 전체 목록 검색
	public List<NoticeVO> noticeList(PageVO vo);

	// 조건에 맞는 게시물 불러오기
	public List<NoticeVO> noticeListSearch(PageVO vo);

	// 병원 홈페이지 등록
	public void noticeWrite(NoticeVO vo);

	// 뷰처리
	public NoticeVO noticeView(int idx);

	// 조회수
	public void noticeHits(int idx);

	// 수정처리
    public void noticeModify(NoticeVO vo);
	
	// 삭제처리
    public void noticedelete(int idx);
    
	//파일 찾기
	public String noticeFile(int idx);
}
