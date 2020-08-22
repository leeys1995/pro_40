package com.jslhrd.service;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;


import com.jslhrd.domain.HospBoardVO;
import com.jslhrd.domain.HospVO;
import com.jslhrd.domain.PageVO;
import com.jslhrd.domain.ReservationVO;
import com.jslhrd.mapper.HospMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class HospServiceImpl implements HospService {

	// 주입
	private HospMapper mapper;

	// 전체 목록 카운트
	@Override
	public int hospCount() {

		return mapper.hospCount();
	}

	// 검색조건에 맞는 게시물 카운트
	@Override
	public int hospSearchCount(PageVO vo) {
		// TODO Auto-generated method stub
		return mapper.hospSearchCount(vo);
	}

	// 전체 목록 검색
	@Override
	public List<HospVO> hospList(PageVO vo) {
		// TODO Auto-generated method stub
		return mapper.hospList(vo);
	}

	// 조건에 맞는 게시물 불러오기
	@Override
	public List<HospVO> hospListSearch(PageVO vo) {
		// TODO Auto-generated method stub
		return mapper.hospListSearch(vo);
	}

	// 등록처리
	@Override
	public void hospWrite(HospVO vo) {

		mapper.hospWrite(vo);

	}

	// 조회수 증가
	@Override
	public void hospHits(int idx, HttpServletRequest request, HttpServletResponse response) {

		boolean bool = false;
		Cookie info = null;
		Cookie[] cookies = request.getCookies();
		for (int i = 0; i < cookies.length; i++) {
			info = cookies[i];
			if (info.getName().equals("hospCookie" + idx)) {
				bool = true;
				break;
			}
		}
		String str = "" + System.currentTimeMillis();

		if (!bool) {
			info = new Cookie("hospCookie" + idx, str);
			info.setMaxAge(60 * 60 * 24);
			response.addCookie(info);
			mapper.hospHits(idx);
		}
	}

	// 뷰처리
	@Override
	public HospVO hospView(int idx) {

		return mapper.hospView(idx);
	}

	// 리스트
	@Override
	public List<HospBoardVO> hospboardList(int idx) {
		// TODO Auto-generated method stub
		return mapper.hospboardList(idx);
	}

	// 수정
	@Override
	public void hospModify(HospVO vo) {

		mapper.hospModify(vo);

	}

	//병원 홈페이지 삭제
	@Override
	public void hospDelete(int idx) {
		
		mapper.hospDelete(idx);
		
	}
	
	//파일찾기( h_banner , h_photo, d_photo, h_video)
	@Override
	public String hospBanner(int idx) {
		// TODO Auto-generated method stub
		return mapper.hospBanner(idx);
	}
	
	@Override
	public String hospHphoto(int idx) {
		// TODO Auto-generated method stub
		return mapper.hospHphoto(idx);
	}
	
	@Override
	public String hospDphoto(int idx) {
		// TODO Auto-generated method stub
		return mapper.hospDphoto(idx);
	}
	
	@Override
	public String hospHvideo(int idx) {
		// TODO Auto-generated method stub
		return mapper.hospHvideo(idx);
	}
	
	// 예약시스템 시작

	// 리스트 홈페이지 이동
	@Override
	public List<ReservationVO> reservationList(ReservationVO vo) {

		return mapper.reservationList(vo);
	}

	// 리스트 홈페이지 확인 홈페이지 이동
	@Override
	public List<ReservationVO> reservationListPro(int idx) {

		return mapper.reservationListPro(idx);
	}

	// 예약 추가 사이트
	@Override
	public void reservationWrite(ReservationVO vo) {

		mapper.reservationWrite(vo);

	}

	// 예약자 확인
	@Override
	public List<ReservationVO> reservationList_ok(int idx) {
		
		return mapper.reservationList_ok(idx);
	}
	
	//예약하기
	@Override
	public void reservationProInsert(ReservationVO vo) {
		
		mapper.reservationProInsert(vo);
		
	}
	
	//예약 시간 삭제
	@Override
	public void hospitalReservationDelete(ReservationVO vo) {
		
		mapper.hospitalReservationDelete(vo);
		
	}
	
	//미예약 개수
	@Override
	public int reservationCount(int idx) {
		// TODO Auto-generated method stub
		return mapper.reservationCount(idx);
	}
	
	//예약된 개수
	@Override
	public int reservationCount_ok(int idx) {
		// TODO Auto-generated method stub
		return mapper.reservationCount_ok(idx);
	}
	
	//예약자 상세 신상 확인
	@Override
	public ReservationVO hospital_reservationPro2(ReservationVO vo) {
		// TODO Auto-generated method stub
		return mapper.hospital_reservationPro2(vo);
	}
	
	@Override
	public List<ReservationVO> reservation_countO(int idx) {
		// TODO Auto-generated method stub
		return mapper.reservation_countO(idx);
	}
	
	@Override
	public List<ReservationVO> reservation_countX(int idx) {
		// TODO Auto-generated method stub
		return mapper.reservation_countX(idx);
	}
}
