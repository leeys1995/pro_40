package com.jslhrd.service;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.jslhrd.domain.CorpBoardVO;
import com.jslhrd.domain.CorpVO;
import com.jslhrd.domain.PageVO;
import com.jslhrd.mapper.CorpMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CorpServiceImpl implements CorpService {
  
	// 주입
		private CorpMapper mapper;

		// 전체 목록 카운트
		@Override
		public int corpCount() {

			return mapper.corpCount();
		}

		// 검색조건에 맞는 게시물 카운트
		@Override
		public int corpSearchCount(PageVO vo) {
			// TODO Auto-generated method stub
			return mapper.corpSearchCount(vo);
		}

		// 전체 목록 검색
		@Override
		public List<CorpVO> corpList(PageVO vo) {
			// TODO Auto-generated method stub
			return mapper.corpList(vo);
		}

		// 조건에 맞는 게시물 불러오기
		@Override
		public List<CorpVO> corpListSearch(PageVO vo) {
			// TODO Auto-generated method stub
			return mapper.corpListSearch(vo);
		}

		// 등록처리
		@Override
		public void corpWrite(CorpVO vo) {

			mapper.corpWrite(vo);

		}
		
		//조회수 증가
		@Override
		public void corpHits(int idx, HttpServletRequest request, HttpServletResponse response) {

			boolean bool = false;
			Cookie info = null;
			Cookie[] cookies = request.getCookies();
			for (int i = 0; i < cookies.length; i++) {
				info = cookies[i];
				if (info.getName().equals("corpCookie" + idx)) {
					bool = true;
					break;
				}
			}
			String str = "" + System.currentTimeMillis();

			if (!bool) {
				info = new Cookie("corpCookie" + idx, str);
				info.setMaxAge(60 * 60 * 24);
				response.addCookie(info);
				mapper.corpHits(idx);
			}
		}
		
		//뷰처리
		@Override
		public CorpVO corpView(int idx) {

			return mapper.corpView(idx);
		}

		//기업 게시판 리스트 가져오기
		@Override
		public List<CorpBoardVO> corpboardList(int idx) {
			// TODO Auto-generated method stub
			return mapper.corpboardList(idx);
		}
		
		
		//수정
		@Override
		public void corpModify(CorpVO vo) {
		
			mapper.corpModify(vo);
			
		}
		
		//기업 홈페이지 삭제
		@Override
		public void corpDelete(int idx) {
			
			mapper.corpDelete(idx);
			
		}
		
		@Override
		public String corpBanner(int idx) {
			// TODO Auto-generated method stub
			return mapper.corpBanner(idx);
		}
		
		@Override
		public String corpCphoto(int idx) {
			// TODO Auto-generated method stub
			return mapper.corpCphoto(idx);
		}
		
		@Override
		public String corpPphoto(int idx) {
			// TODO Auto-generated method stub
			return mapper.corpPphoto(idx);
		}
		
		@Override
		public String corpCvideo(int idx) {
			// TODO Auto-generated method stub
			return mapper.corpCvideo(idx);
		}
		
		//홈페이지 관리 패스워드 가져오기
		@Override
		public String corparationPass(int idx) {
			
			return mapper.corparationPass(idx);
		}
}
