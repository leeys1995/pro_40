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

import com.jslhrd.domain.CorpBoardVO;
import com.jslhrd.domain.CorpVO;
import com.jslhrd.domain.PageVO;
import com.jslhrd.domain.ProductVO;
import com.jslhrd.service.CorpBoardService;
import com.jslhrd.service.CorpService;
import com.jslhrd.util.PageIndex;
import com.jslhrd.util.SqlMark;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("corparation_board")
public class CorpBoardController {

	private static final Logger log = LoggerFactory.getLogger(HospController.class);

	private CorpBoardService service;
	private CorpService service1;
	
	// 전체 리스트 검색
	@GetMapping("corparation_board")
	public void corpboardList(@RequestParam("page") int page, PageVO vo, Model model, @RequestParam("idx") int idx) {

		log.info("corpitalboard()....");
		String url = "corparation_board";

		String c_name = service.corpName(idx);
		String c_banner = service.corpBanner(idx);

		log.info("corparationboard()....");

		model.addAttribute("c_name", c_name);
		model.addAttribute("c_banner", c_banner);

		int nowpage = 1;
		int maxlist = 10;
		int totpage = 1;

		int totcount = 0;
		if (vo.getKey() == null) {
			totcount = service.corpboardCount(idx);
		} else {
			vo.setIdx2(idx);
			totcount = service.corpboardSearchCount(vo);
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
			model.addAttribute("list", service.corpboardList(vo));

		} else {
			vo.setIdx2(idx);
			model.addAttribute("list", service.corpboardListSearch(vo));
		}

		if (vo.getKey() == null) {
			//다음 페이지
			String nextpage="/corparation_board/corparation_board?idx="+idx+"&page="+totpage;
			if(nowpage<totpage) {
				nextpage="/corparation_board/corparation_board?idx="+idx+"&page="+(nowpage+1);
			}
			//이전페이지
			String prevPage="/corparation_board/corparation_board?idx="+idx+"&page="+1;
			if(nowpage>1) {
				prevPage="/corparation_board/corparation_board?idx="+idx+"&page="+(nowpage-1);
			}
			
			model.addAttribute("prev",prevPage);
			model.addAttribute("next",nextpage);
			model.addAttribute("page",PageIndex.pageList(nowpage, totpage, url, "").substring(46,PageIndex.pageList(nowpage, totpage, url, "").length()-46));
			
			//model.addAttribute("listpage", PageIndex.pageList(nowpage, totpage, url, ""));
		} else {
			//model.addAttribute("listpage", PageIndex.pageListHan(nowpage, totpage, url, vo.getSearch(), vo.getKey()));
			//다음 페이지
			String nextpage="/corparation_board/corparation_board?idx="+idx+"&page="+totpage+"&search=" + vo.getSearch() + "&key=" +vo.getKey();;
			if(nowpage<totpage) {
				nextpage="/corparation_board/corparation_board?idx="+idx+"&page="+(nowpage+1)+"&search=" + vo.getSearch() + "&key=" +vo.getKey();;
			}
			//이전페이지
			String prevPage="/corparation_board/corparation_board?idx="+idx+"&page="+1+"&search=" + vo.getSearch() + "&key=" +vo.getKey();;
			if(nowpage>1) {
				prevPage="/corparation_board/corparation_board?idx="+idx+"&page="+(nowpage-1)+"&search=" + vo.getSearch() + "&key=" +vo.getKey();;
			}
			
			model.addAttribute("prev",prevPage);
			model.addAttribute("next",nextpage);
			
			model.addAttribute("page",PageIndex.pageListHan(nowpage, totpage, url, vo.getSearch(), vo.getKey()).substring(46,PageIndex.pageListHan(nowpage, totpage, url, vo.getSearch(), vo.getKey()).length()-46));
		}
		
		CorpVO vo1 = service1.corpView(idx);
		model.addAttribute("corp", vo1);
	}

	// 검색된 리스트 가져오기
	@PostMapping("corparation_board")
	public void hospboardListSearch(@RequestParam("page") int page, PageVO vo, Model model,
			@RequestParam("idx") int idx) {

		log.info("corpboardListSearch()....");
		String url = "corparation_board";

		int nowpage = 1; // 시작페이지
		int maxlist = 10; // 페이지당 최대 자료수
		int totpage = 1; // 총 페이지 개수

		vo.setIdx2(idx);
		int totcount = service.corpboardSearchCount(vo);// 검색조건에맞는 게시물 갯수

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
		model.addAttribute("list", service.corpboardListSearch(vo));
		model.addAttribute("totcount", totcount);
		// model.addAttribute("listpage", PageIndex.pageList(nowpage, totpage, url,
		// ""));

		String nextpage="/corparation_board/corparation_board?idx="+idx+"&page="+totpage+"&search="+vo.getSearch()+"&key="+vo.getKey();
		if(nowpage<totpage) {
			nextpage="/corparation_board/corparation_board?idx="+idx+"&page="+(nowpage+1)+"&search="+vo.getSearch()+"&key="+vo.getKey();
		}
		//이전페이지
		String prevPage="/corparation_board/corparation_board?idx="+idx+"&page="+1+"&search="+vo.getSearch()+"&key="+vo.getKey();
		if(nowpage>1) {
			prevPage="/corparation_board/corparation_board?idx="+idx+"&page="+(nowpage-1)+"&search="+vo.getSearch()+"&key="+vo.getKey();
		}
		
		
		model.addAttribute("prev",prevPage);
		model.addAttribute("next",nextpage);
		
		model.addAttribute("page",PageIndex.pageListHan(nowpage, totpage, url, vo.getSearch(), vo.getKey()).substring(46,PageIndex.pageListHan(nowpage, totpage, url, vo.getSearch(), vo.getKey()).length()-46));

		String c_name = service.corpName(idx);
		model.addAttribute("c_name", c_name);
		
		
		CorpVO vo1 = service1.corpView(idx);
		model.addAttribute("corp", vo1);
	}

	// 기업 등록폼
	@GetMapping("corparation_board_write")
	public void corparationboardWrite(@RequestParam("idx") int idx, Model model) {

		model.addAttribute("idx", idx);
		
		String c_banner = service.corpBanner(idx);
		
		
		CorpVO vo1 = service1.corpView(idx);
		model.addAttribute("corp", vo1);
		
		model.addAttribute("c_banner",c_banner);
		log.info("corpitalboardWrite()....");
	}

	@PostMapping("corparation_board_write")
	public String corparationboardWritePro(MultipartHttpServletRequest request) {

		log.info("corparationboardWritePro()....");
		CorpBoardVO vo = new CorpBoardVO();

		vo.setSubject(request.getParameter("subject"));
		vo.setContents(request.getParameter("contents"));

		vo.setIdx2(request.getParameter("idx2"));

		MultipartFile mf = request.getFile("filename");

		int idx2 = Integer.parseInt(request.getParameter("idx2"));

		String filename = "";
		if (mf != null) {
			// 배너 저장경로 설정
			String path = request.getRealPath("/resources/upload/corp_board/file/");
			filename = mf.getOriginalFilename();
			File file = new File(path + filename);
			try {
				mf.transferTo(file); // 실제복사
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {

			filename = "";
		}
		vo.setFilename(filename);

		service.corpboardWrite(vo);

		return "redirect:/corparation_board/corparation_board?idx=" + idx2 + "&page=1";
	}

	// 조회수 증가
	@GetMapping("corpboardHits")
	public String corpboardHits(@RequestParam("idx") int idx, HttpServletRequest request, HttpServletResponse response,
			@RequestParam("idx2") int idx2) {

		service.corpboardHits(idx, request, response);
		return "redirect:/corparation_board/corparation_board_view?idx=" + idx + "&idx2=" + idx2;
	}

	// View 처리
	@GetMapping("corparation_board_view")
	public void corpboardView(@RequestParam("idx") int idx, Model model, @RequestParam("idx2") int idx2) {

		log.info("corp_board_view()..........");

		CorpBoardVO vo = service.corpboardView(idx);

		String c_banner = service.corpBanner(idx2);
		model.addAttribute("c_banner", c_banner);
		vo.setContents(SqlMark.lineBreak(vo.getContents()));

		model.addAttribute("idx2", idx2);
		model.addAttribute("idx", idx);
		model.addAttribute("board", vo);
	}

	// 수정
	@GetMapping("corparation_board_modify")
	public void corpboardModify(@RequestParam("idx") int idx, Model model, @RequestParam("idx2") int idx2) {

		log.info("corp_board_modify()..........");

		model.addAttribute("idx", idx);
		model.addAttribute("idx2", idx2);

		CorpBoardVO vo = service.corpboardView(idx);
		model.addAttribute("board", vo);
		
	}

	@PostMapping("corparation_board_modify")
	public String corpboardModify(MultipartHttpServletRequest request) {

		log.info("corp_board_modifyPro()..........");

		String filename1 = service.corpboardFile(Integer.parseInt(request.getParameter("idx")));
		
		deleteFiles(filename1);
		
		CorpBoardVO vo = new CorpBoardVO();

		vo.setSubject(request.getParameter("subject"));
		vo.setContents(request.getParameter("contents"));

		vo.setIdx2(request.getParameter("idx2"));

		MultipartFile mf = request.getFile("filename");

		int idx2 = Integer.parseInt(request.getParameter("idx2"));

		String filename = "";
		if (mf != null) {
			// 배너 저장경로 설정
			String path = request.getRealPath("/resources/upload/corp_board/file/");
			filename = mf.getOriginalFilename();
			File file = new File(path + filename);
			try {
				mf.transferTo(file); // 실제복사
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {

			filename = "";
		}
		vo.setFilename(filename);

		service.corpboardModify(vo);

		return "redirect:/corparation_board/corparation_board?idx=" + idx2 + "&page=1";

	}
	// 삭제

	@GetMapping("corparation_board_delete")
	public String corpboardDelete(@RequestParam("idx") int idx, @RequestParam("idx2") int idx2) {

		log.info("corpboardDelete");

		String filename = service.corpboardFile(idx);
		
		deleteFiles(filename);
		
		service.corpboardDelete(idx);
		
		return "redirect:/corparation_board/corparation_board?idx=" + idx2 + "&page=1";

	}

	// 파일완전 삭제 메소드
	private void deleteFiles(String filename) {

		log.info("파일이름:" + filename);
		if (filename == "") {
			return;
		}

		try {

			log.info("파일이름:" + filename);
			Path file = Paths.get(
					"C:\\Users\\leeys\\eclipse-workspace\\exSpring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\pro_40\\resources\\corp_board\\file\\"
							+ filename);

			Files.deleteIfExists(file);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//////////////////////////////////////////////////////////
	
	//Product 관련
	// 전체 리스트 검색
		@GetMapping("product")
		public void productList(@RequestParam("page") int page, PageVO vo, Model model, @RequestParam("idx") int idx) {

			log.info("product()....");
			String url = "product";

			
			CorpVO vo1 = service1.corpView(idx);
			model.addAttribute("corp", vo1);
			
			String c_name = service.corpName(idx);
			String c_banner = service.corpBanner(idx);

			model.addAttribute("c_name", c_name);
			model.addAttribute("c_banner", c_banner);

			int nowpage = 1;
			int maxlist = 10;
			int totpage = 1;

			int totcount = 0;
			if (vo.getKey() == null) {
				totcount = service.productCount(idx);
			} else {
				vo.setIdx2(idx);
				totcount = service.productSearchCount(vo);
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
				model.addAttribute("list", service.productList(vo));

			} else {
				vo.setIdx2(idx);
				model.addAttribute("list", service.productListSearch(vo));
			}

			if (vo.getKey() == null) {
				//다음 페이지
				String nextpage="/corparation_board/product?idx="+idx+"&page="+totpage;
				if(nowpage<totpage) {
					nextpage="/corparation_board/product?idx="+idx+"&page="+(nowpage+1);
				}
				//이전페이지
				String prevPage="/corparation_board/product?idx="+idx+"&page="+1;
				if(nowpage>1) {
					prevPage="/corparation_board/product?idx="+idx+"&page="+(nowpage-1);
				}
				
				model.addAttribute("prev",prevPage);
				model.addAttribute("next",nextpage);
				model.addAttribute("page",PageIndex.pageList(nowpage, totpage, url, "").substring(46,PageIndex.pageList(nowpage, totpage, url, "").length()-46));
				
				//model.addAttribute("listpage", PageIndex.pageList(nowpage, totpage, url, ""));
			} else {
				//model.addAttribute("listpage", PageIndex.pageListHan(nowpage, totpage, url, vo.getSearch(), vo.getKey()));
				//다음 페이지
				String nextpage="/corparation_board/product?idx="+idx+"&page="+totpage+"&search=" + vo.getSearch() + "&key=" +vo.getKey();;
				if(nowpage<totpage) {
					nextpage="/corparation_board/product?idx="+idx+"&page="+(nowpage+1)+"&search=" + vo.getSearch() + "&key=" +vo.getKey();;
				}
				//이전페이지
				String prevPage="/corparation_board/product?idx="+idx+"&page="+1+"&search=" + vo.getSearch() + "&key=" +vo.getKey();;
				if(nowpage>1) {
					prevPage="/corparation_board/product?idx="+idx+"&page="+(nowpage-1)+"&search=" + vo.getSearch() + "&key=" +vo.getKey();;
				}
				
				model.addAttribute("prev",prevPage);
				model.addAttribute("next",nextpage);
				
				model.addAttribute("page",PageIndex.pageListHan(nowpage, totpage, url, vo.getSearch(), vo.getKey()).substring(46,PageIndex.pageListHan(nowpage, totpage, url, vo.getSearch(), vo.getKey()).length()-46));
			}
			

			
		}

		// 검색된 리스트 가져오기
		@PostMapping("product")
		public void productListSearch(@RequestParam("page") int page, PageVO vo, Model model,
				@RequestParam("idx") int idx) {

			log.info("productListSearch()....");
			String url = "product";

			CorpVO vo1 = service1.corpView(idx);
			model.addAttribute("corp", vo1);
			
			
			int nowpage = 1; // 시작페이지
			int maxlist = 10; // 페이지당 최대 자료수
			int totpage = 1; // 총 페이지 개수

			vo.setIdx2(idx);
			int totcount = service.productSearchCount(vo);// 검색조건에맞는 게시물 갯수

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
			model.addAttribute("list", service.productListSearch(vo));
			model.addAttribute("totcount", totcount);
			// model.addAttribute("listpage", PageIndex.pageList(nowpage, totpage, url,
			// ""));


			String nextpage="/corparation_board/product?idx="+idx+"&page="+totpage+"&search="+vo.getSearch()+"&key="+vo.getKey();
			if(nowpage<totpage) {
				nextpage="/corparation_board/product?idx="+idx+"&page="+(nowpage+1)+"&search="+vo.getSearch()+"&key="+vo.getKey();
			}
			//이전페이지
			String prevPage="/corparation_board/product?idx="+idx+"&page="+1+"&search="+vo.getSearch()+"&key="+vo.getKey();
			if(nowpage>1) {
				prevPage="/corparation_board/product?idx="+idx+"&page="+(nowpage-1)+"&search="+vo.getSearch()+"&key="+vo.getKey();
			}
			
			
			model.addAttribute("prev",prevPage);
			model.addAttribute("next",nextpage);
			
			model.addAttribute("page",PageIndex.pageListHan(nowpage, totpage, url, vo.getSearch(), vo.getKey()).substring(46,PageIndex.pageListHan(nowpage, totpage, url, vo.getSearch(), vo.getKey()).length()-46));


			String c_name = service.corpName(idx);
			model.addAttribute("c_name", c_name);

		}
	
		// 제품 등록폼
		@GetMapping("product_write")
		public void productWrite(@RequestParam("idx") int idx, Model model) {

			String c_banner = service.corpBanner(idx);
			
			CorpVO vo1 = service1.corpView(idx);
			model.addAttribute("corp", vo1);
			
			model.addAttribute("c_banner",c_banner);
			model.addAttribute("idx", idx);
			log.info("productWrite()....");
		}

		@PostMapping("product_write")
		public String productWritePro(ProductVO vo) {

			log.info("productWritePro()....");

			service.productWrite(vo);

			return "redirect:/corparation_board/product?idx=" + vo.getIdx2() + "&page=1";
		}

		//비밀번호 찾기 
		@GetMapping("product_pass")
		public void productPass(Model model, @RequestParam("idx") int idx,@RequestParam("idx2") int idx2) {
			
			log.info("productPass()....");
			
			CorpVO vo1 = service1.corpView(idx2);
			model.addAttribute("corp", vo1);
			
			model.addAttribute("idx", idx);
			model.addAttribute("idx2", idx2);
			
		}
		
		//비밀번호찾기
		@PostMapping("product_pass")
		public String productPassPro(ProductVO vo,@RequestParam("idx") int idx,@RequestParam("idx2") int idx2) {
			
			
			vo.setIdx(idx);
			vo.setIdx2(idx2);
			
			log.info("productPass()....");
			
			String p_pass1 = service.productPass(vo);
			
			if(p_pass1.contains(vo.getP_pass())) {
				
				return "redirect:/corparation_board/product_view?idx="+vo.getIdx()+"&idx2="+vo.getIdx2();
			}else {
				
				return "redirect:/corparation_board/product_viewX";
			}
			
		}
		
		// View 처리
		@GetMapping("product_view")
		public void productView(@RequestParam("idx") int idx, Model model, @RequestParam("idx2") int idx2) {

			log.info("product_view()..........");

				
			ProductVO vo = service.productView(idx);
            
			
			String c_banner = service.corpBanner(idx2);
			model.addAttribute("c_banner", c_banner);
			vo.setP_contents(SqlMark.lineBreak(vo.getP_contents()));

			String c_name = service.corpName(idx2);
			CorpVO vo1 = service1.corpView(idx2);
			model.addAttribute("corp", vo1);
			
			model.addAttribute("c_name", c_name);
			model.addAttribute("idx2", idx2);
			model.addAttribute("idx", idx);
			model.addAttribute("product", vo);
		}

		//View X
		@GetMapping("product_viewX")
		public void productViewX() {
			
			log.info("product_viewX()..........");
		}
		
		// 삭제

		@GetMapping("productdelete")
		public String productDelete(@RequestParam("idx") int idx) {

			log.info("productDelete");

			
			service.productDelete(idx);
			
			return "redirect:/corparation_board/product?idx=" + idx + "&page=1";

		}
		
		//답글달기
		
		@PostMapping("reply")
		public String productReply(@RequestParam("idx") int idx, @RequestParam("idx2") int idx2,ProductVO vo) {
			
			log.info("reply");
	
			service.productReply(vo);
			
			return "redirect:/corparation_board/product_view?idx="+idx+"&idx2="+idx2;
			
			
		}
		
		/////////////////////////////////////////////////////////////////////////////////////
		
		// 전체 리스트 검색
				@GetMapping("productDirect")
				public void productDirectList(@RequestParam("page") int page, PageVO vo, Model model, @RequestParam("idx") int idx) {

					log.info("productDirect()....");
					String url = "productDirect";

					
					CorpVO vo1 = service1.corpView(idx);
					model.addAttribute("corp", vo1);
					
					String c_name = service.corpName(idx);
					String c_banner = service.corpBanner(idx);

					model.addAttribute("c_name", c_name);
					model.addAttribute("c_banner", c_banner);

					int nowpage = 1;
					int maxlist = 10;
					int totpage = 1;

					int totcount = 0;
					if (vo.getKey() == null) {
						totcount = service.productCount(idx);
					} else {
						vo.setIdx2(idx);
						totcount = service.productSearchCount(vo);
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
						model.addAttribute("list", service.productList(vo));

					} else {
						vo.setIdx2(idx);
						model.addAttribute("list", service.productListSearch(vo));
					}

					if (vo.getKey() == null) {
						model.addAttribute("listpage", PageIndex.pageList(nowpage, totpage, url, "", idx));

					} else {
						model.addAttribute("listpage",
								PageIndex.pageListHan(nowpage, totpage, url, vo.getSearch(), vo.getKey(), idx));
					}

					
				}

				// 검색된 리스트 가져오기
				@PostMapping("productDirect")
				public void productDirectListSearch(@RequestParam("page") int page, PageVO vo, Model model,
						@RequestParam("idx") int idx) {

					log.info("productDirectListSearch()....");
					String url = "productDirect";

					CorpVO vo1 = service1.corpView(idx);
					model.addAttribute("corp", vo1);
					
					int nowpage = 1; // 시작페이지
					int maxlist = 10; // 페이지당 최대 자료수
					int totpage = 1; // 총 페이지 개수

					vo.setIdx2(idx);
					int totcount = service.productSearchCount(vo);// 검색조건에맞는 게시물 갯수

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
					model.addAttribute("list", service.productListSearch(vo));
					model.addAttribute("totcount", totcount);
					// model.addAttribute("listpage", PageIndex.pageList(nowpage, totpage, url,
					// ""));

					model.addAttribute("listpage", PageIndex.pageListHan(nowpage, totpage, url, vo.getSearch(), vo.getKey(), idx));

					String c_name = service.corpName(idx);
					model.addAttribute("c_name", c_name);

				}
	
}
