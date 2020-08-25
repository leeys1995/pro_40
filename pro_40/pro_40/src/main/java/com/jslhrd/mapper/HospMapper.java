package com.jslhrd.mapper;

import java.util.List;


import com.jslhrd.domain.HospBoardVO;
import com.jslhrd.domain.HospVO;
import com.jslhrd.domain.PageVO;
import com.jslhrd.domain.ReservationVO;

public interface HospMapper {

	// 전체 목록 카운트
	public int hospCount();

	// 검색조건에 맞는 게시물 카운트
	public int hospSearchCount(PageVO vo);

	// 전체 목록 검색
	public List<HospVO> hospList(PageVO vo);

	// 조건에 맞는 게시물 불러오기
	public List<HospVO> hospListSearch(PageVO vo);

	// 병원 홈페이지 등록
	public void hospWrite(HospVO vo);

	// 뷰처리
	public HospVO hospView(int idx);

	// 조회수
	public void hospHits(int idx);

	// 수정처리
	public void hospModify(HospVO vo);

	// 삭제처리
	public void hospDelete(int idx);

	// 파일찾기( h_banner , h_photo, d_photo, h_video)
	public String hospBanner(int idx);

	public String hospHphoto(int idx);

	public String hospDphoto(int idx);

	public String hospHvideo(int idx);

	// 공지사항 불러오기
	public List<HospBoardVO> hospboardList(int idx);

	// 예약시스템 시작
	public List<ReservationVO> reservationList(ReservationVO vo);

	// 예약시스템 확인
	public List<ReservationVO> reservationListPro(int idx);

	// 예약 시간 추가
	public void reservationWrite(ReservationVO vo);

	// 예약 하기
	public void reservationProInsert(ReservationVO vo);

	// 예약자 확인
	public List<ReservationVO> reservationList_ok(int idx);

	// 예약 시간 추가 후 삭제
	public void hospitalReservationDelete(ReservationVO vo);

	// 미예약 개수
	public int reservationCount(int idx);

	// 예약 된 개수
	public int reservationCount_ok(int idx);

	// 예약자 상세 신상 확인
	public ReservationVO hospital_reservationPro2(ReservationVO vo);

	// 예약 날짜 별 예약가능 데이터 개수 가져오기
	public List<ReservationVO> reservation_countX(int idx);

	// 예약 날짜 별 예약되어있는 데이터 개수 가져오기
	public List<ReservationVO> reservation_countO(int idx);
	
	//홈페이지 관리 패스워드 가져오기
	public String hospitalPass(int idx);
}
