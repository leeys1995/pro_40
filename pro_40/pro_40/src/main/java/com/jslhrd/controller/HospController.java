package com.jslhrd.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jslhrd.domain.HospVO;
import com.jslhrd.domain.PageVO;
import com.jslhrd.service.HospBoardService;
import com.jslhrd.service.HospService;
import com.jslhrd.util.PageIndex;
import com.jslhrd.util.SqlMark;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("hospital")
public class HospController {

	private static final Logger log = LoggerFactory.getLogger(HospController.class);

	private HospService service;
	
	
	//전체 리스트 검색
	@GetMapping("hospital")
	public void hospList(@RequestParam("page") int page, PageVO vo, Model model) {

		log.info("hospital()....");
		String url = "hospital";

		int nowpage = 1;
		int maxlist = 9;
		int totpage = 1;

		int totcount = 0;
		if (vo.getKey() == null) {
			totcount = service.hospCount();
		} else {
			totcount = service.hospSearchCount(vo);
		}

		// 총페이지수 계산
		if (totcount % maxlist == 0) {
			totpage = totcount / maxlist;
		} else {
			totpage = totcount / maxlist + 1;
		}
		if (totpage == 0) {
			totpage = 1;
		}
		if (page != 0) {
			nowpage = page;
		}
		if (nowpage > totpage) { // 현재페이지가 총페이지보다크면 마지막페이지를 현제페이지로
			nowpage = totpage;
		}
		int startpage = (nowpage - 1) * maxlist + 1;// 현재 페이지 시작번호
		int endpage = nowpage * maxlist;
		int listcount = totcount - ((nowpage - 1) * maxlist);

		// PageVO vo = new PageVO();
		vo.setStartpage(startpage);
		vo.setEndpage(endpage);

		model.addAttribute("page", nowpage);
		model.addAttribute("totpage", totpage);
		model.addAttribute("listcount", listcount);
		model.addAttribute("totcount", totcount);

		if (vo.getKey() == null) {
			model.addAttribute("list", service.hospList(vo));

		} else {
			model.addAttribute("list", service.hospListSearch(vo));
		}

		if (vo.getKey() == null) {
			model.addAttribute("listpage", PageIndex.pageList(nowpage, totpage, url, ""));

		} else {
			model.addAttribute("listpage", PageIndex.pageListHan(nowpage, totpage, url, vo.getSearch(), vo.getKey()));
		}
	}
	
	//검색된 리스트 가져오기
	@PostMapping("hospital")
	public void hospListSearch(@RequestParam("page") int page, PageVO vo, Model model) {

		log.info("hospListSearch()....");
		String url = "hospital";

		int nowpage = 1; // 시작페이지
		int maxlist = 9; // 페이지당 최대 자료수
		int totpage = 1; // 총 페이지 개수

		int totcount = service.hospSearchCount(vo);// 검색조건에맞는 게시물 갯수

		// 총페이지수 계산
		if (totcount % maxlist == 0) {
			totpage = totcount / maxlist;
		} else {
			totpage = totcount / maxlist + 1;
		}
		if (totpage == 0) {
			totpage = 1;
		}
		if (page != 0) {
			nowpage = page;
		}
		if (nowpage > totpage) { // 현재페이지가 총페이지보다크면 마지막페이지를 현제페이지로
			nowpage = totpage;
		}
		int startpage = (nowpage - 1) * maxlist + 1;// 현재 페이지 시작번호
		int endpage = nowpage * maxlist;
		int listcount = totcount - ((nowpage - 1) * maxlist);

		// PageVO vo = new PageVO();
		vo.setStartpage(startpage);
		vo.setEndpage(endpage);

		model.addAttribute("page", nowpage);
		model.addAttribute("totpage", totpage);
		model.addAttribute("listcount", listcount);
		model.addAttribute("list", service.hospListSearch(vo));
		model.addAttribute("totcount", totcount);
		// model.addAttribute("listpage", PageIndex.pageList(nowpage, totpage, url,
		// ""));

		model.addAttribute("listpage", PageIndex.pageListHan(nowpage, totpage, url, vo.getSearch(), vo.getKey()));

	}

	// 병원 등록폼
	@GetMapping("hospital_write")
	public void hospitalWrite() {

		log.info("hospitalWrite()....");
	}

	@PostMapping("hospital_write")
	public String hospitalWritePro(MultipartHttpServletRequest request) {

		log.info("hospitalWritePro()....");
		HospVO vo = new HospVO();

		vo.setH_name(request.getParameter("h_name"));
		vo.setH_code(request.getParameter("h_code"));
		vo.setH_tel(request.getParameter("h_tel"));
		vo.setH_addr1(request.getParameter("h_addr1"));
		vo.setH_addr2(request.getParameter("h_addr2"));
		vo.setD_medical(request.getParameter("d_medical"));
		vo.setD_mager(request.getParameter("d_mager"));
		vo.setH_history(request.getParameter("h_history"));
		vo.setH_come(request.getParameter("h_come"));
		
		MultipartFile mf1 = request.getFile("h_banner");
		MultipartFile mf2 = request.getFile("h_photo");
		MultipartFile mf3 = request.getFile("d_photo");
		MultipartFile mf4 = request.getFile("h_video");
	

		// 배너 저장경로 설정
		String path1 = request.getRealPath("/resources/upload/hosp/banner/");
		String h_banner = mf1.getOriginalFilename();
		File file1 = new File(path1 + h_banner);
		try {
			mf1.transferTo(file1); // 실제복사
		} catch (Exception e) {
			e.printStackTrace();
		}

		vo.setH_banner(h_banner);

		// 배경사진 저장경로 설정
		String path2 = request.getRealPath("/resources/upload/hosp/hospital_photo/");
		String h_photo = mf2.getOriginalFilename();
		File file2 = new File(path2 + h_photo);
		try {
			mf2.transferTo(file2); // 실제복사
		} catch (Exception e) {
			e.printStackTrace();
		}

		vo.setH_photo(h_photo);

		// 의사 사진 저장경로 설정
		String path3 = request.getRealPath("/resources/upload/hosp/doctor_photo/");
		String d_photo = mf3.getOriginalFilename();
		File file3 = new File(path3 + d_photo);
		try {
			mf3.transferTo(file3); // 실제복사
		} catch (Exception e) {
			e.printStackTrace();
		}

		vo.setD_photo(d_photo);

		// 병원홍보영상 저장경로 설정
		String path4 = request.getRealPath("/resources/upload/hosp/video/");
		String h_video = mf4.getOriginalFilename();
		File file4 = new File(path4 + h_video);
		try {
			mf4.transferTo(file4); // 실제복사
		} catch (Exception e) {
			e.printStackTrace();
		}

		vo.setH_video(h_video);
		// 배너 저장경로 설정

		service.hospWrite(vo);

		return "redirect:/hospital/hospital?page=1";
	}

	// 조회수 증가
	@GetMapping("hospHits")
	public String hospHits(@RequestParam("idx") int idx, HttpServletRequest request, HttpServletResponse response) {
		
		service.hospHits(idx, request, response);
		return "redirect:/hospital/hospital_view?idx=" + idx;
	}

	// View 처리
	@GetMapping("hospital_view")
	public void hospView(@RequestParam("idx") int idx, Model model) {

		log.info("hosp_view()..........");

		HospVO vo = service.hospView(idx);
        
		vo.setD_medical(SqlMark.lineBreak(vo.getD_medical()));
		vo.setD_mager(SqlMark.lineBreak(vo.getD_mager()));
		vo.setH_history(SqlMark.lineBreak(vo.getH_history()));
		vo.setH_come(SqlMark.lineBreak(vo.getH_come()));
		model.addAttribute("hosp", vo);
		
		model.addAttribute("list", service.hospboardList(idx));
	}

	// 수정
	@GetMapping("hospital_modify")
	public void hospModify(@RequestParam("idx") int idx,Model model) {
		
		HospVO vo = service.hospView(idx);
		model.addAttribute("hosp", vo);
		model.addAttribute("idx", idx);
		log.info("hosp_modify().......");
	}
	
	@PostMapping("hospital_modify")
	public String hospModifyPro(MultipartHttpServletRequest request) {
		
		log.info("hosp_modifyPro().......");
		
		
		HospVO vo = new HospVO();
		
		vo.setH_name(request.getParameter("h_name"));
		vo.setH_code(request.getParameter("h_code"));
		vo.setH_tel(request.getParameter("h_tel"));
		vo.setH_addr1(request.getParameter("h_addr1"));
		vo.setH_addr2(request.getParameter("h_addr2"));
		vo.setD_medical(request.getParameter("d_medical"));
		vo.setD_mager(request.getParameter("d_mager"));
		vo.setH_history(request.getParameter("h_history"));
		vo.setH_come(request.getParameter("h_come"));
		
		MultipartFile mf1 = request.getFile("h_banner");
		MultipartFile mf2 = request.getFile("h_photo");
		MultipartFile mf3 = request.getFile("d_photo");
		MultipartFile mf4 = request.getFile("h_video");
	

		// 배너 저장경로 설정
		String path1 = request.getRealPath("/resources/upload/hosp/banner/");
		String h_banner = mf1.getOriginalFilename();
		File file1 = new File(path1 + h_banner);
		try {
			mf1.transferTo(file1); // 실제복사
		} catch (Exception e) {
			e.printStackTrace();
		}

		vo.setH_banner(h_banner);

		// 배경사진 저장경로 설정
		String path2 = request.getRealPath("/resources/upload/hosp/hospital_photo/");
		String h_photo = mf2.getOriginalFilename();
		File file2 = new File(path2 + h_photo);
		try {
			mf2.transferTo(file2); // 실제복사
		} catch (Exception e) {
			e.printStackTrace();
		}

		vo.setH_photo(h_photo);

		// 의사 사진 저장경로 설정
		String path3 = request.getRealPath("/resources/upload/hosp/doctor_photo/");
		String d_photo = mf3.getOriginalFilename();
		File file3 = new File(path3 + d_photo);
		try {
			mf3.transferTo(file3); // 실제복사
		} catch (Exception e) {
			e.printStackTrace();
		}

		vo.setD_photo(d_photo);

		// 병원홍보영상 저장경로 설정
		String path4 = request.getRealPath("/resources/upload/hosp/video/");
		String h_video = mf4.getOriginalFilename();
		File file4 = new File(path4 + h_video);
		try {
			mf4.transferTo(file4); // 실제복사
		} catch (Exception e) {
			e.printStackTrace();
		}

		vo.setH_video(h_video);
		// 배너 저장경로 설정

		service.hospModify(vo);
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		return "redirect:/hospital/hospital_view?idx="+idx;
	}
	// 삭제 

	// 파일완전 삭제 메소드
	

	//////////////////////////////////////////////////////////
	
	
	
}
