package com.jslhrd.service;

import java.util.List;

import com.jslhrd.domain.EmailVO;
import com.jslhrd.domain.MemberVO;
import com.jslhrd.domain.PageVO;

public interface MemberService 
{
	// 회원가입
	public int memInsert(MemberVO vo);
	
	//아이디 검색
	public MemberVO memIdchk(MemberVO vo);
	
	//로그인 
	public MemberVO memLogin(MemberVO vo);
	
	//정보수정
	public int memModify(MemberVO vo);
	
	//관리자수정
	public int admo(MemberVO vo);
	
	// 전체 게시물 총 카운트
	public int memCount();

	// 검색조건에 맞는 게시물 카운트
	public int memSearchCount(PageVO vo);

	// 전체게시물 목록 불러오기(list)
	public List<MemberVO> memList(PageVO vo);

	// 조건에맞는 전체게시물 불러오기
	public List<MemberVO> memListSearch(PageVO vo);

	// 특정 게시물 검색(view)
	public MemberVO memSelect(int idx);
	
	// 로그인한 날자 업데이트
	public void lastTimeUpdate(MemberVO vo);
	
	//아이디 찾기
	public MemberVO idsearch(MemberVO vo);
	
	//PW 변경전 개인정보 검색
	public MemberVO pwchange(MemberVO vo);
	
	//인증코드 등록 
	public void pwcodeupdate(MemberVO vo);
	
	//pw 업데이트 
	public int pwupdate(MemberVO vo);

}
