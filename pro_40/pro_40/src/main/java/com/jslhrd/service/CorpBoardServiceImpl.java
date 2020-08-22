package com.jslhrd.service;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.jslhrd.domain.CorpBoardVO;
import com.jslhrd.domain.PageVO;
import com.jslhrd.domain.ProductVO;
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

	// 기업이름가져오기
	@Override
	public String corpName(int idx) {
		return mapper.corpName(idx);
	}

	// 기업 배너가져오기
	@Override
	public String corpBanner(int idx) {
		// TODO Auto-generated method stub
		return mapper.corpBanner(idx);
	}

	// 파일 찾기
	@Override
	public String corpboardFile(int idx) {
		// TODO Auto-generated method stub
		return mapper.corpboardFile(idx);
	}

	// 수정
	@Override
	public void corpboardModify(CorpBoardVO vo) {

		mapper.corpboardModify(vo);
	}

	// 삭제
	@Override
	public void corpboardDelete(int idx) {

		mapper.corpboardDelete(idx);

	}

//////////////////////////////////////////////////////////

//Product 관련
	
	// 전체 목록 카운트
		@Override
		public int productCount(int idx) {

			return mapper.productCount(idx);
		}

		// 검색조건에 맞는 게시물 카운트
		@Override
		public int productSearchCount(PageVO vo) {
			// TODO Auto-generated method stub
			return mapper.productSearchCount(vo);
		}

		// 전체 목록 검색
		@Override
		public List<ProductVO> productList(PageVO vo) {
			// TODO Auto-generated method stub
			return mapper.productList(vo);

		}

		// 조건에 맞는 게시물 불러오기
		@Override
		public List<ProductVO> productListSearch(PageVO vo) {
			// TODO Auto-generated method stub
			return mapper.productListSearch(vo);
		}

		// 등록처리
		@Override
		public void productWrite(ProductVO vo) {

			mapper.productWrite(vo);

		}

		
		// 뷰처리
		@Override
		public ProductVO productView(int idx) {

			return mapper.productView(idx);
		}
        
		//패스워드 찾기
		@Override
		public String productPass(ProductVO vo) {
			
			return mapper.productPass(vo);		
			
		}

		// 삭제
		@Override
		public void productDelete(int idx) {

			mapper.productDelete(idx);

		}
		
		//답글달기
		@Override
		public void productReply(ProductVO vo) {
			
			mapper.productReply(vo);
		}
		
		// 전체 목록 검색
		@Override
		public List<ProductVO> productDirectList(PageVO vo) {
			// TODO Auto-generated method stub
			return mapper.productDirectList(vo);
		}

		// 조건에 맞는 게시물 불러오기
		@Override
		public List<ProductVO> productDirectListSearch(PageVO vo) {
			// TODO Auto-generated method stub
			return mapper.productDirectListSearch(vo);
		}
}
