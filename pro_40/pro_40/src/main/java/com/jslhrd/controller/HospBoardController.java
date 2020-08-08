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

import com.jslhrd.domain.HospBoardVO;
import com.jslhrd.domain.PageVO;
import com.jslhrd.service.HospBoardService;
import com.jslhrd.util.PageIndex;
import com.jslhrd.util.SqlMark;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("hospital_board")
public class HospBoardController {
	
	private static final Logger log = LoggerFactory.getLogger(HospController.class);

	private HospBoardService service;
	
	//전체 리스트 검색
		@GetMapping("hospital_board")
		public void hospboardList(@RequestParam("page") int page, PageVO vo, Model model,@RequestParam("idx") int idx) {

			log.info("hospitalboard()....");
			String url = "hospital_board";

			String h_name = service.hospName(idx);
			String h_banner = service.hospBanner(idx);
			
			
			log.info("hospitalboard()....");
			
			model.addAttribute("h_name", h_name);
			model.addAttribute("h_banner", h_banner);
			
			int nowpage = 1;
			int maxlist = 10;
			int totpage = 1;

			int totcount = 0;
			if (vo.getKey() == null) {
				totcount = service.hospboardCount(idx);
			} else {
				vo.setIdx2(idx);
				totcount = service.hospboardSearchCount(vo);
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
				vo.setIdx2(idx);
				model.addAttribute("list", service.hospboardList(vo));

			} else {
				vo.setIdx2(idx);
				model.addAttribute("list", service.hospboardListSearch(vo));
			}

			if (vo.getKey() == null) {
				model.addAttribute("listpage", PageIndex.pageList(nowpage, totpage, url, "",idx));

			} else {
				model.addAttribute("listpage", PageIndex.pageListHan(nowpage, totpage, url, vo.getSearch(), vo.getKey(),idx));
			}
			
			
		}
		
		//검색된 리스트 가져오기
		@PostMapping("hospital_board")
		public void hospboardListSearch(@RequestParam("page") int page, PageVO vo, Model model,@RequestParam("idx") int idx) {

			log.info("hospboardListSearch()....");
			String url = "hospital_board";

			int nowpage = 1; // 시작페이지
			int maxlist = 10; // 페이지당 최대 자료수
			int totpage = 1; // 총 페이지 개수

			vo.setIdx2(idx);
			int totcount = service.hospboardSearchCount(vo);// 검색조건에맞는 게시물 갯수

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
			
			vo.setIdx2(idx);
			model.addAttribute("list", service.hospboardListSearch(vo));
			model.addAttribute("totcount", totcount);
			// model.addAttribute("listpage", PageIndex.pageList(nowpage, totpage, url,
			// ""));

			model.addAttribute("listpage", PageIndex.pageListHan(nowpage, totpage, url, vo.getSearch(), vo.getKey(),idx));
			
			String h_name = service.hospName(idx);
			model.addAttribute("h_name", h_name);

		}

		// 병원 등록폼
		@GetMapping("hospital_board_write")
		public void hospitalboardWrite(@RequestParam("idx") int idx,Model model) {
			
			
			model.addAttribute("idx", idx);
			log.info("hospitalboardWrite()....");
		}

		@PostMapping("hospital_board_write")
		public String hospitalboardWritePro(MultipartHttpServletRequest request) {

			log.info("hospitalboardWritePro()....");
			HospBoardVO vo = new HospBoardVO();

			vo.setSubject(request.getParameter("subject"));
			vo.setContents(request.getParameter("contents"));
		
			vo.setIdx2(request.getParameter("idx2"));
		
			MultipartFile mf = request.getFile("filename");
			
			
			int idx2= Integer.parseInt(request.getParameter("idx2"));
			
			String filename ="";
			if(mf!=null) {
			// 배너 저장경로 설정
			String path = request.getRealPath("/resources/upload/hosp_board/file/");
			filename = mf.getOriginalFilename();
			File file = new File(path + filename);
			try {
				mf.transferTo(file); // 실제복사
			} catch (Exception e) {
				e.printStackTrace();
			}
			}else {
				
				filename="";
			}
			vo.setFilename(filename);

			service.hospboardWrite(vo);

			return "redirect:/hospital_board/hospital_board?idx="+idx2+"&page=1";
		}

		// 조회수 증가
		@GetMapping("hospboardHits")
		public String hospboardHits(@RequestParam("idx") int idx, HttpServletRequest request, HttpServletResponse response,@RequestParam("idx2") int idx2) {
			
			service.hospboardHits(idx, request, response);
			return "redirect:/hospital_board/hospital_board_view?idx=" + idx+"&idx2="+idx2;
		}

		// View 처리
		@GetMapping("hospital_board_view")
		public void hospboardView(@RequestParam("idx") int idx, Model model,@RequestParam("idx2") int idx2) {

			log.info("hosp_board_view()..........");

			HospBoardVO vo = service.hospboardView(idx);
			
			String h_banner = service.hospBanner(idx2);
			model.addAttribute("h_banner", h_banner);
			vo.setContents(SqlMark.lineBreak(vo.getContents()));
			
			
			model.addAttribute("idx2", idx2);
			model.addAttribute("idx", idx);
			model.addAttribute("board", vo);
		}

		// 수정
		@GetMapping("hospital_board_modify")
		public void hospboardModify(@RequestParam("idx") int idx,Model model, @RequestParam("idx2") int idx2) {
			
			log.info("hosp_board_modify()..........");
			
			model.addAttribute("idx", idx);
			model.addAttribute("idx2", idx2);
			
			HospBoardVO vo = service.hospboardView(idx);
			model.addAttribute("board", vo);
		}
		
		@PostMapping("hospital_board_modify")
		public String hospboardModify(MultipartHttpServletRequest request) {
			
			log.info("hosp_board_modifyPro()..........");
			
			HospBoardVO vo = new HospBoardVO();

			vo.setSubject(request.getParameter("subject"));
			vo.setContents(request.getParameter("contents"));
		
			vo.setIdx2(request.getParameter("idx2"));
		
			MultipartFile mf = request.getFile("filename");
			
			String filename1= service.hospboardFile(Integer.parseInt(request.getParameter("idx")));
			deleteFiles(filename1);
			
			int idx2= Integer.parseInt(request.getParameter("idx2"));
			
			String filename ="";
			if(mf!=null) {
			// 배너 저장경로 설정
			String path = request.getRealPath("/resources/upload/hosp_board/file/");
			filename = mf.getOriginalFilename();
			File file = new File(path + filename);
			try {
				mf.transferTo(file); // 실제복사
			} catch (Exception e) {
				e.printStackTrace();
			}
			}else {
				
				filename="";
			}
			vo.setFilename(filename);

			service.hospboardModify(vo);

			return "redirect:/hospital_board/hospital_board?idx="+idx2+"&page=1";
			
		}
		
		// 삭제 
		@GetMapping("hospital_board_delete")
		public String hospboardDelete(@RequestParam("idx") int idx,@RequestParam("idx2") int idx2 ) {
			
			log.info("hospboardDelete");
			
			service.hospboardDelete(idx);
			
			return "redirect:/hospital_board/hospital_board?idx="+idx2+"&page=1";
			
		}
		// 파일완전 삭제 메소드
		private void deleteFiles(String filename) {
			
			
			log.info("파일이름:"+filename);
			if(filename == "") {
				return;
			}
			
			try {
				
				log.info("파일이름:"+filename);
				Path file = Paths.get("C:\\Users\\leeys\\eclipse-workspace\\exSpring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\pro_40\\resources\\hosp_board\\file\\"+filename);
				
				Files.deleteIfExists(file);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		//예약사이트
		@GetMapping("hospital_board_cal")
		public void hospboardcal(@RequestParam("idx") int idx,Model model) {
			
			log.info("hosp_board_cal()..........");
			model.addAttribute("idx2", idx);
		
		}
		//////////////////////////////////////////////////////////
		
}
