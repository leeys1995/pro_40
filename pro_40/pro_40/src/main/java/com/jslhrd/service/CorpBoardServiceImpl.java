package com.jslhrd.service;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.jslhrd.domain.CorpBoardVO;
import com.jslhrd.domain.PageVO;
import com.jslhrd.mapper.CorpBoardMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CorpBoardServiceImpl implements CorpBoardService {

	// 주입
	private CorpBoardMapper mapper;

	// 전체 목록 카운트
	@Override
	public int corpboardCount(int idx) {

		return mapper.corpboardCount(idx);
	}

	// 검색조건에 맞는 게시물 카운트
	@Override
	public int corpboardSearchCount(PageVO vo) {
		// TODO Auto-generated method stub
		return mapper.corpboardSearchCount(vo);
	}

	// 전체 목록 검색
	@Override
	public List<CorpBoardVO> corpboardList(PageVO vo) {
		// TODO Auto-generated method stub
		return mapper.corpboardList(vo);

	}

	// 조건에 맞는 게시물 불러오기
	@Override
	public List<CorpBoardVO> corpboardListSearch(PageVO vo) {
		// TODO Auto-generated method stub
		return mapper.corpboardListSearch(vo);
	}

	// 등록처리
	@Override
	public void corpboardWrite(CorpBoardVO vo) {

		mapper.corpboardWrite(vo);

	}

	// 조회수 증가
	@Override
	public void corpboardHits(int idx, HttpServletRequest request, HttpServletResponse response) {

		boolean bool = false;
		Cookie info = null;
		Cookie[] cookies = request.getCookies();
		for (int i = 0; i < cookies.length; i++) {
			info = cookies[i];
			if (info.getName().equals("corpboardCookie" + idx)) {
				bool = true;
				break;
			}
		}
		String str = "" + System.currentTimeMillis();

		if (!bool) {
			info = new Cookie("corpboardCookie" + idx, str);
			info.setMaxAge(60 * 60 * 24);
			response.addCookie(info);
			mapper.corpboardHits(idx);
		}
	}

	// 뷰처리
	@Override
	public CorpBoardVO corpboardView(int idx) {

		return mapper.corpboardView(idx);
	}

	@Override
	public String corpName(int idx) {
		return mapper.corpName(idx);
	}

	@Override
	public String corpBanner(int idx) {
		// TODO Auto-generated method stub
		return mapper.corpBanner(idx);
	}
}
