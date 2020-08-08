package com.jslhrd.service;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.jslhrd.domain.NoticeVO;
import com.jslhrd.domain.PageVO;
import com.jslhrd.mapper.NoticeMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService {

	
	// 주입
			private NoticeMapper mapper;

			// 전체 목록 카운트
			@Override
			public int noticeCount() {

				return mapper.noticeCount();
			}

			// 검색조건에 맞는 게시물 카운트
			@Override
			public int noticeSearchCount(PageVO vo) {
				// TODO Auto-generated method stub
				return mapper.noticeSearchCount(vo);
			}

			// 전체 목록 검색
			@Override
			public List<NoticeVO> noticeList(PageVO vo) {
				// TODO Auto-generated method stub
				return mapper.noticeList(vo);
				
			}

			// 조건에 맞는 게시물 불러오기
			@Override
			public List<NoticeVO> noticeListSearch(PageVO vo) {
				// TODO Auto-generated method stub
				return mapper.noticeListSearch(vo);
			}

			// 등록처리
			@Override
			public void noticeWrite(NoticeVO vo) {

				mapper.noticeWrite(vo);

			}
			
			//조회수 증가
			@Override
			public void noticeHits(int idx, HttpServletRequest request, HttpServletResponse response) {

				boolean bool = false;
				Cookie info = null;
				Cookie[] cookies = request.getCookies();
				for (int i = 0; i < cookies.length; i++) {
					info = cookies[i];
					if (info.getName().equals("noticeCookie" + idx)) {
						bool = true;
						break;
					}
				}
				String str = "" + System.currentTimeMillis();

				if (!bool) {
					info = new Cookie("noticeCookie" + idx, str);
					info.setMaxAge(60 * 60 * 24);
					response.addCookie(info);
					mapper.noticeHits(idx);
				}
			}
			
			//뷰처리
			@Override
			public NoticeVO noticeView(int idx) {

				return mapper.noticeView(idx);
			}
			
			@Override
			public void noticeModify(NoticeVO vo) {
				
				mapper.noticeModify(vo);
			}
		    
		    //삭제
			@Override
			public void noticedelete(int idx) {
				
				mapper.noticedelete(idx);
				
			}
			//파일찾기
			@Override
			public String noticeFile(int idx) {
				// TODO Auto-generated method stub
				return mapper.noticeFile(idx);
			}
}
