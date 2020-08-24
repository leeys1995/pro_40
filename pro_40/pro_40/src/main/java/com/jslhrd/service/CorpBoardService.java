package com.jslhrd.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jslhrd.domain.CorpBoardVO;

import com.jslhrd.domain.PageVO;
import com.jslhrd.domain.ProductVO;

public interface CorpBoardService {

	// 전체 목록 카운트
	public int corpboardCount(int idx);

	// 검색조건에 맞는 게시물 카운트
	public int corpboardSearchCount(PageVO vo);

	// 전체 목록 검색
	public List<CorpBoardVO> corpboardList(PageVO vo);

	// 조건에 맞는 게시물 불러오기
	public List<CorpBoardVO> corpboardListSearch(PageVO vo);

	// 병원 홈페이지 등록
	public void corpboardWrite(CorpBoardVO vo);

	// 뷰처리
	public CorpBoardVO corpboardView(int idx);

	// 조회수
	public void corpboardHits(int idx, HttpServletRequest request, HttpServletResponse response);

	// 수정처리
	public void corpboardModify(CorpBoardVO vo);

	// 삭제처리
	public void corpboardDelete(int idx);

	// 파일찾기
	public String corpboardFile(int idx);

	// 기업이름가져오기
	public String corpName(int idx);

	// 기업 배너 가져오기
	public String corpBanner(int idx);

//////////////////////////////////////////////////////////

//Product 관련
	// 전체 목록 카운트
	public int productCount(int idx);

	// 검색조건에 맞는 게시물 카운트
	public int productSearchCount(PageVO vo);

	// 전체 목록 검색
	public List<ProductVO> productList(PageVO vo);

	// 조건에 맞는 게시물 불러오기
	public List<ProductVO> productListSearch(PageVO vo);

	// 제품 문의 홈페이지 등록
	public void productWrite(ProductVO vo);

	// 뷰처리
	public ProductVO productView(int idx);

	// 삭제처리
	public void productDelete(int idx);

	// 패스워드 찾기
	public String productPass(ProductVO vo);

	// 답글달기
	public void productReply(ProductVO vo);

	// 전체 목록 검색
	public List<ProductVO> productDirectList(PageVO vo);

	// 조건에 맞는 게시물 불러오기
	public List<ProductVO> productDirectListSearch(PageVO vo);
}
