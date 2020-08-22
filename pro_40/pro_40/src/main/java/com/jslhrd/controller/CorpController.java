package com.jslhrd.controller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

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

import com.jslhrd.domain.CorpVO;
import com.jslhrd.domain.HospVO;
import com.jslhrd.domain.PageVO;
import com.jslhrd.service.CorpService;
import com.jslhrd.util.PageIndex;
import com.jslhrd.util.SqlMark;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("corparation")
public class CorpController {

	private static final Logger log = LoggerFactory.getLogger(HospController.class);

	private CorpService service;

	// 전체 리스트 검색
	@GetMapping("corparation")
	public void corpList(@RequestParam("page") int page, PageVO vo, Model model) {

		log.info("corparation()....");
		String url = "corparation";

		int nowpage = 1;
		int maxlist = 9;
		int totpage = 1;

		int totcount = 0;
		if (vo.getKey() == null) {
			totcount = service.corpCount();
		} else {
			totcount = service.corpSearchCount(vo);
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
			model.addAttribute("list", service.corpList(vo));

		} else {
			model.addAttribute("list", service.corpListSearch(vo));
		}

		if (vo.getKey() == null) {
			model.addAttribute("listpage", PageIndex.pageList(nowpage, totpage, url, ""));

		} else {
			model.addAttribute("listpage", PageIndex.pageListHan(nowpage, totpage, url, vo.getSearch(), vo.getKey()));
		}
	}

	// 검색된 리스트 가져오기
	@PostMapping("corparation")
	public void hospListSearch(@RequestParam("page") int page, PageVO vo, Model model) {

		log.info("corparationListSearch()....");
		String url = "corparation";

		int nowpage = 1; // 시작페이지
		int maxlist = 9; // 페이지당 최대 자료수
		int totpage = 1; // 총 페이지 개수

		int totcount = service.corpSearchCount(vo);// 검색조건에맞는 게시물 갯수

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
		model.addAttribute("list", service.corpListSearch(vo));
		model.addAttribute("totcount", totcount);
		// model.addAttribute("listpage", PageIndex.pageList(nowpage, totpage, url,
		// ""));

		model.addAttribute("listpage", PageIndex.pageListHan(nowpage, totpage, url, vo.getSearch(), vo.getKey()));

	}

	// 기업 등록폼
	@GetMapping("corparation_write")
	public void corparationWrite() {

		log.info("corparationWrite()....");
	}

	@PostMapping("corparation_write")
	public String corparationWritePro(MultipartHttpServletRequest request) {

		log.info("corparationWritePro()....");
		CorpVO vo = new CorpVO();

		vo.setC_name(request.getParameter("c_name"));
		vo.setC_code(request.getParameter("c_code"));
		vo.setC_tel(request.getParameter("c_tel"));
		vo.setC_addr1(request.getParameter("c_addr1"));
		vo.setC_addr2(request.getParameter("c_addr2"));
		vo.setP_intro(request.getParameter("p_intro"));
		vo.setP_mager(request.getParameter("p_mager"));
		vo.setC_history(request.getParameter("c_history"));
		vo.setC_come(request.getParameter("c_come"));

		MultipartFile mf1 = request.getFile("c_banner");
		MultipartFile mf2 = request.getFile("c_photo");
		MultipartFile mf3 = request.getFile("p_photo");
		MultipartFile mf4 = request.getFile("c_video");

		// 배너 저장경로 설정
		String path1 = request.getRealPath("/resources/upload/corp/banner/");
		String c_banner = mf1.getOriginalFilename();
		File file1 = new File(path1 + c_banner);
		try {
			mf1.transferTo(file1); // 실제복사
		} catch (Exception e) {
			e.printStackTrace();
		}

		vo.setC_banner(c_banner);

		// 배경사진 저장경로 설정
		String path2 = request.getRealPath("/resources/upload/corp/corparation_photo/");
		String c_photo = mf2.getOriginalFilename();
		File file2 = new File(path2 + c_photo);
		try {
			mf2.transferTo(file2); // 실제복사
		} catch (Exception e) {
			e.printStackTrace();
		}

		vo.setC_photo(c_photo);

		// 제품 사진 저장경로 설정
		String path3 = request.getRealPath("/resources/upload/corp/product_photo/");
		String p_photo = mf3.getOriginalFilename();
		File file3 = new File(path3 + p_photo);
		try {
			mf3.transferTo(file3); // 실제복사
		} catch (Exception e) {
			e.printStackTrace();
		}

		vo.setP_photo(p_photo);

		// 기업홍보영상 저장경로 설정
		String path4 = request.getRealPath("/resources/upload/corp/video/");
		String c_video = mf4.getOriginalFilename();
		File file4 = new File(path4 + c_video);
		try {
			mf4.transferTo(file4); // 실제복사
		} catch (Exception e) {
			e.printStackTrace();
		}

		vo.setC_video(c_video);
		// 배너 저장경로 설정

		service.corpWrite(vo);

		return "redirect:/corparation/corparation?page=1";
	}

	// 조회수 증가
	@GetMapping("corpHits")
	public String corpHits(@RequestParam("idx") int idx, HttpServletRequest request, HttpServletResponse response) {

		service.corpHits(idx, request, response);
		return "redirect:/corparation/corparation_view?idx=" + idx;
	}

	// View 처리
	@GetMapping("corparation_view")
	public void corpView(@RequestParam("idx") int idx, Model model) {

		log.info("corp_view()..........");

		CorpVO vo = service.corpView(idx);
		
		vo.setP_intro(SqlMark.lineBreak(vo.getP_intro()));
		vo.setP_mager(SqlMark.lineBreak(vo.getP_mager()));
		vo.setC_history(SqlMark.lineBreak(vo.getC_history()));
		vo.setC_come(SqlMark.lineBreak(vo.getC_come()));
		model.addAttribute("corp", vo);
   
		model.addAttribute("list", service.corpboardList(idx));
	}

	// 수정
	@GetMapping("corparation_modify")
	public void corpModify(@RequestParam("idx") int idx, Model model) {

		CorpVO vo = service.corpView(idx);
		model.addAttribute("corp", vo);
		model.addAttribute("idx", idx);
		log.info("corp_modify().......");
	}

	@PostMapping("corparation_modify")
	public String corpModifyPro(MultipartHttpServletRequest request) {

		log.info("corp_modifyPro().......");

		CorpVO vo = new CorpVO();
		
		vo.setIdx(Integer.parseInt(request.getParameter("idx")));
		vo.setC_name(request.getParameter("c_name"));
		vo.setC_code(request.getParameter("c_code"));
		vo.setC_tel(request.getParameter("c_tel"));
		vo.setC_addr1(request.getParameter("c_addr1"));
		vo.setC_addr2(request.getParameter("c_addr2"));
		vo.setP_intro(request.getParameter("p_intro"));
		vo.setP_mager(request.getParameter("p_mager"));
		vo.setC_history(request.getParameter("c_history"));
		vo.setC_come(request.getParameter("c_come"));

		MultipartFile mf1 = request.getFile("c_banner");
		MultipartFile mf2 = request.getFile("c_photo");
		MultipartFile mf3 = request.getFile("p_photo");
		MultipartFile mf4 = request.getFile("c_video");

		// 배너 저장경로 설정
		String path1 = request.getRealPath("/resources/upload/corp/banner/");
		String c_banner = mf1.getOriginalFilename();
		File file1 = new File(path1 + c_banner);
		try {
			mf1.transferTo(file1); // 실제복사
		} catch (Exception e) {
			e.printStackTrace();
		}

		vo.setC_banner(c_banner);

		// 배경사진 저장경로 설정
		String path2 = request.getRealPath("/resources/upload/corp/corparation_photo/");
		String c_photo = mf2.getOriginalFilename();
		File file2 = new File(path2 + c_photo);
		try {
			mf2.transferTo(file2); // 실제복사
		} catch (Exception e) {
			e.printStackTrace();
		}

		vo.setC_photo(c_photo);

		// 의사 사진 저장경로 설정
		String path3 = request.getRealPath("/resources/upload/corp/product_photo/");
		String p_photo = mf3.getOriginalFilename();
		File file3 = new File(path3 + p_photo);
		try {
			mf3.transferTo(file3); // 실제복사
		} catch (Exception e) {
			e.printStackTrace();
		}

		vo.setP_photo(p_photo);

		// 병원홍보영상 저장경로 설정
		String path4 = request.getRealPath("/resources/upload/corp/video/");
		String c_video = mf4.getOriginalFilename();
		File file4 = new File(path4 + c_video);
		try {
			mf4.transferTo(file4); // 실제복사
		} catch (Exception e) {
			e.printStackTrace();
		}

		vo.setC_video(c_video);
		// 배너 저장경로 설정

		service.corpModify(vo);

		int idx = Integer.parseInt(request.getParameter("idx"));

		return "redirect:/corparation/corparation_view?idx=" + idx;
	}
	
	// 삭제
		@PostMapping("corparation_delete")
		public String corpDelete(MultipartHttpServletRequest request) {
			
			
			int idx = Integer.parseInt(request.getParameter("idx"));
			
			
			String mf1 = service.corpBanner(idx);
			String mf2 = service.corpCphoto(idx);
			String mf3 = service.corpPphoto(idx);
			String mf4 = service.corpCvideo(idx);
			
			deleteFiles(mf1);
			deleteFiles1(mf2);
			deleteFiles2(mf3);	
			deleteFiles3(mf4);
			
			service.corpDelete(idx);
			
			log.info("corp_delete().......");
			
			return "redirect:/corparation/corparation?page=1";
		}
	
	
	// 배너 완전 삭제 메소드
	private void deleteFiles(String filename) {
		
		
		log.info("파일이름:"+filename);
		if(filename == "") {
			return;
		}
		
		try {
			
			log.info("파일이름:"+filename);
			Path file = Paths.get("C:\\Users\\leeys\\eclipse-workspace\\exSpring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\pro_40\\resources\\corp\\banner\\"+filename);
			
			Files.deleteIfExists(file);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	// 기업사진 완전 삭제 메소드
		private void deleteFiles1(String filename) {
			
			
			log.info("파일이름:"+filename);
			if(filename == "") {
				return;
			}
			
			try {
				
				log.info("파일이름:"+filename);
				Path file = Paths.get("C:\\Users\\leeys\\eclipse-workspace\\exSpring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\pro_40\\resources\\corp\\corparation_photo\\"+filename);
				
				Files.deleteIfExists(file);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		// 기업 제품사진 완전 삭제 메소드
		private void deleteFiles2(String filename) {
			
			
			log.info("파일이름:"+filename);
			if(filename == "") {
				return;
			}
			
			try {
				
				log.info("파일이름:"+filename);
				Path file = Paths.get("C:\\Users\\leeys\\eclipse-workspace\\exSpring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\pro_40\\resources\\corp\\product_photo\\"+filename);
				
				Files.deleteIfExists(file);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		// 기업 비디오 삭제 메소드
		private void deleteFiles3(String filename) {
			
			
			log.info("파일이름:"+filename);
			if(filename == "") {
				return;
			}
			
			try {
				
				log.info("파일이름:"+filename);
				Path file = Paths.get("C:\\Users\\leeys\\eclipse-workspace\\exSpring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\pro_40\\resources\\corp\\video\\"+filename);
				
				Files.deleteIfExists(file);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	//////////////////////////////////////////////////////////
		

		//병원 소개 페이지
		@GetMapping("corparation_about")
		public void corparation(@RequestParam("idx") int idx ,Model model) {
			
			log.info("corparationAbout().......");
			CorpVO vo = service.corpView(idx);
			model.addAttribute("corp", vo);
			
		}
		
		//진료 안내 페이지
			@GetMapping("corparation_guidance")
			public void corparation_guidance(@RequestParam("idx") int idx ,Model model) {
				
				log.info("corparationGuidance().......");
				CorpVO vo = service.corpView(idx);
				model.addAttribute("corp", vo);
			}
		
}
