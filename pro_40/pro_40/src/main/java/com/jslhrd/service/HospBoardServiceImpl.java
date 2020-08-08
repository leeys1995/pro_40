package com.jslhrd.service;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.jslhrd.domain.HospBoardVO;
import com.jslhrd.domain.PageVO;
import com.jslhrd.mapper.HospBoardMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class HospBoardServiceImpl implements HospBoardService {
	
	// 주입
		private HospBoardMapper mapper;

		// 전체 목록 카운트
		@Override
		public int hospboardCount(int idx) {

			return mapper.hospboardCount(idx);
		}

		// 검색조건에 맞는 게시물 카운트
		@Override
		public int hospboardSearchCount(PageVO vo) {
			// TODO Auto-generated method stub
			return mapper.hospboardSearchCount(vo);
		}

		// 전체 목록 검색
		@Override
		public List<HospBoardVO> hospboardList(PageVO vo) {
			// TODO Auto-generated method stub
			return mapper.hospboardList(vo);
			
		}

		// 조건에 맞는 게시물 불러오기
		@Override
		public List<HospBoardVO> hospboardListSearch(PageVO vo) {
			// TODO Auto-generated method stub
			return mapper.hospboardListSearch(vo);
		}

		// 등록처리
		@Override
		public void hospboardWrite(HospBoardVO vo) {

			mapper.hospboardWrite(vo);

		}
		
		//조회수 증가
		@Override
		public void hospboardHits(int idx, HttpServletRequest request, HttpServletResponse response) {

			boolean bool = false;
			Cookie info = null;
			Cookie[] cookies = request.getCookies();
			for (int i = 0; i < cookies.length; i++) {
				info = cookies[i];
				if (info.getName().equals("hospboardCookie" + idx)) {
					bool = true;
					break;
				}
			}
			String str = "" + System.currentTimeMillis();

			if (!bool) {
				info = new Cookie("hospboardCookie" + idx, str);
				info.setMaxAge(60 * 60 * 24);
				response.addCookie(info);
				mapper.hospboardHits(idx);
			}
		}
		
		//뷰처리
		@Override
		public HospBoardVO hospboardView(int idx) {

			return mapper.hospboardView(idx);
		}
		
		//파일 찾기
		@Override
		public String hospboardFile(int idx) {
			// TODO Auto-generated method stub
			return mapper.hospboardFile(idx);
		}
		
		
		//병원이름찾기
		@Override
		public String hospName(int idx) {
			return mapper.hospName(idx);
		}
		
		//병원 배너 찾기
		@Override
		public String hospBanner(int idx) {
			// TODO Auto-generated method stub
			return mapper.hospBanner(idx);
		}
		
		//수정
		@Override
		public void hospboardModify(HospBoardVO vo) {
			
				mapper.hospboardModify(vo);
		}
		
		//삭제
		@Override
		public void hospboardDelete(int idx) {
		
		   mapper.hospboardDelete(idx);
			
		}
}
