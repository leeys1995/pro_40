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

import com.jslhrd.domain.NoticeVO;
import com.jslhrd.domain.PageVO;
import com.jslhrd.service.NoticeService;
import com.jslhrd.util.PageIndex;
import com.jslhrd.util.SqlMark;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("notice")
public class NoticeController {
  
	private static final Logger log = LoggerFactory.getLogger(HospController.class);

	private NoticeService service;
	
	//전체 리스트 검색
			@GetMapping("notice")
			public void noticeList(@RequestParam("page") int page, PageVO vo, Model model) {

				log.info("notice()....");
				String url = "notice";		
				int nowpage = 1;
				int maxlist = 10;
				int totpage = 1;

				int totcount = 0;
				if (vo.getKey() == null) {
					totcount = service.noticeCount();
				} else {
					
					totcount = service.noticeSearchCount(vo);
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
				
					model.addAttribute("list", service.noticeList(vo));

				} else {
			
					model.addAttribute("list", service.noticeListSearch(vo));
				}

				if (vo.getKey() == null) {
					model.addAttribute("listpage", PageIndex.pageList(nowpage, totpage, url, ""));

				} else {
					model.addAttribute("listpage", PageIndex.pageListHan(nowpage, totpage, url, vo.getSearch(), vo.getKey()));
				}
				
				
			}
			
			//검색된 리스트 가져오기
			@PostMapping("notice")
			public void noticeListSearch(@RequestParam("page") int page, PageVO vo, Model model) {

				log.info("noticeListSearch()....");
				String url = "notice";

				int nowpage = 1; // 시작페이지
				int maxlist = 10; // 페이지당 최대 자료수
				int totpage = 1; // 총 페이지 개수

				
				int totcount = service.noticeSearchCount(vo);// 검색조건에맞는 게시물 갯수

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
				
				
				model.addAttribute("list", service.noticeListSearch(vo));
				model.addAttribute("totcount", totcount);
				// model.addAttribute("listpage", PageIndex.pageList(nowpage, totpage, url,
				// ""));

				model.addAttribute("listpage", PageIndex.pageListHan(nowpage, totpage, url, vo.getSearch(), vo.getKey()));
				
				

			}

			// 병원 등록폼
			@GetMapping("notice_write")
			public void noticeWrite() {
				
				log.info("noticeWrite()....");
			}

			@PostMapping("notice_write")
			public String noticeWritePro(MultipartHttpServletRequest request) {

				log.info("noticeWritePro()....");
				NoticeVO vo = new NoticeVO();

				vo.setSubject(request.getParameter("subject"));
				vo.setContents(request.getParameter("contents"));
			
				
			
				MultipartFile mf = request.getFile("filename");
				
				
				String filename ="";
				if(mf!=null) {
				// 배너 저장경로 설정
				String path = request.getRealPath("/resources/upload/notice/file/");
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

				service.noticeWrite(vo);

				return "redirect:/notice/notice?page=1";
			}

			// 조회수 증가
			@GetMapping("noticeHits")
			public String corpboardHits(@RequestParam("idx") int idx, HttpServletRequest request, HttpServletResponse response) {
				

				log.info("notice_Hits()..........");

				service.noticeHits(idx, request, response);
				return "redirect:/notice/notice_view?idx="+idx;
			}

			// View 처리
			@GetMapping("notice_view")
			public void noticeView(@RequestParam("idx") int idx, Model model) {

				log.info("notice_view()..........");

				NoticeVO vo = service.noticeView(idx);
				
				vo.setContents(SqlMark.lineBreak(vo.getContents()));
				
				model.addAttribute("idx", idx);
				model.addAttribute("notice", vo);
			}

			// 수정
			@GetMapping("notice_modify")
			public void noticeModify(@RequestParam("idx") int idx,Model model) {
				
				log.info("notice_modify()..........");
				
				model.addAttribute("idx", idx);
			
				
				NoticeVO vo = service.noticeView(idx);
				model.addAttribute("notice", vo);
			}
			
			@PostMapping("notice_modify")
			public String noticeModify(MultipartHttpServletRequest request) {
				
				log.info("notice_modifyPro()..........");
				
				NoticeVO vo = new NoticeVO();

				vo.setSubject(request.getParameter("subject"));
				vo.setContents(request.getParameter("contents"));
			
			
				MultipartFile mf = request.getFile("filename");
				
				String filename1 = service.noticeFile(Integer.parseInt(request.getParameter("idx")));
				
				deleteFiles(filename1);
				
				String filename ="";
				if(mf!=null) {
				// 배너 저장경로 설정
				String path = request.getRealPath("/resources/upload/notice/file/");
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

				service.noticeModify(vo);
				
				return "redirect:/notice/notice?page=1";
				
			}
			
			// 삭제 
			@GetMapping("noticedelete")
			public String noticedelete(@RequestParam("idx") int idx) {
				
				log.info("noticedelete");
				
				service.noticedelete(idx);
				
				return "redirect:/notice/notice?page=1";
			}
			
			// 파일완전 삭제 메소드
			private void deleteFiles(String filename) {
				
				
				log.info("파일이름:"+filename);
				if(filename == "") {
					return;
				}
				
				try {
					
					log.info("파일이름:"+filename);
					Path file = Paths.get("C:\\Users\\leeys\\eclipse-workspace\\exSpring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\pro_40\\resources\\notice\\file\\"+filename);
					
					Files.deleteIfExists(file);
					
				}catch(Exception e) {
					e.printStackTrace();
				}
			}

			//////////////////////////////////////////////////////////
	
}
