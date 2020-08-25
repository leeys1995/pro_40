package com.jslhrd.controller;

import java.util.Properties;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jslhrd.domain.EmailVO;
import com.jslhrd.domain.MemberVO;
import com.jslhrd.domain.PageVO;
import com.jslhrd.service.MemberService;
import com.jslhrd.util.PageIndex;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
@RequestMapping("/member")
public class MemberController {

	private static final Logger log = LoggerFactory.getLogger(MemberController.class);
	
	private MemberService service;
	
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	//회원가입 페이지
	@GetMapping("/insert")
	public void meminsert()
	{
		log.info("getmeminsert()*****");
	}
	
	//실제 회원가입
	@PostMapping("/insert")
	public String meminsert(MemberVO vo,RedirectAttributes rttr,HttpServletRequest request,Model model)
	{
		String email = vo.getEmail1()+"@"+vo.getEmail2();
		vo.setEmail(email);
		String tel = vo.getTel1()+"-"+vo.getTel2()+"-"+vo.getTel3();
		vo.setTel(tel);
		String c_code=vo.getC_code1()+"-"+vo.getC_code2()+"-"+vo.getC_code3();
		vo.setC_code(c_code);

		String newPassword = pwdEncoder.encode(vo.getPasswd());
		vo.setPasswd(newPassword);

		int row = service.memInsert(vo);
		model.addAttribute("row", row);
		log.info("postmeminsert()*****");
		return "/member/insert_pro";
	}
	
//	// 가입확인
//	@GetMapping("insert_pro")
//	public void meminsertpro()
//	{
//		log.info("getmeminsertpro()*****");
//	}
	
	//아이디중복확인 
	@GetMapping("/idcheck")
	public void memidchk(Model model)
	{
		int row = 0;
		
		model.addAttribute("row",row);
		log.info("getmemidchk()*****");
	}
	
	//실제아이디중복확인 
	@PostMapping("/idcheck")
	public void memidchk(Model model, HttpServletRequest request, MemberVO vo, RedirectAttributes rttr)
	{		
		log.info("Postmemidchk()*****");
		int row = 1;
		
		MemberVO vo1= service.memIdchk(vo);
		
		String userid="";
		model.addAttribute("row",row);
		if(vo1==null)
		{ 
			userid = vo.getUserid();
			model.addAttribute("userid",userid);
		}else
		{ 
			
			model.addAttribute("vo1",vo1);
		}
		
	}
	
	@GetMapping("/login")
	public void memlogin()
	{
		log.info("getmemlogin()*****");
	}
	
	@PostMapping("/login")
	public String memlogin(Model model, HttpServletRequest request,MemberVO vo,RedirectAttributes rttr)
	{
		log.info("postmemlogin()*****");
		MemberVO vo1= service.memIdchk(vo);//BD값
		log.info("vo1:"+vo1);

		log.info(vo.getPasswd());

		int row=0;
		if(vo1==null )
		{
			log.info("postmemlogin(1)*****");
			row = 0;
			model.addAttribute("row", row);
			return "/member/login_pro";
		}else
		{
			boolean pwMatch = pwdEncoder.matches(vo.getPasswd(),vo1.getUserpw());
			log.info(""+pwMatch);
			if(pwMatch)
			{
				log.info(vo.getPasswd());
				vo.setPasswd(vo1.getUserpw());
				log.info("postmemlogin(2)*****");
				
				service.lastTimeUpdate(vo);
				row = 1;
				request.getSession().setAttribute("user", service.memLogin(vo));
				request.getSession().setMaxInactiveInterval(1800);
				model.addAttribute("row", row);
				log.info(""+service.memLogin(vo));
				return "/member/login_pro";
			}else
			{
				log.info("postmemlogin(3)*****");
				row = 0;
				model.addAttribute("row", row);
				return "/member/login_pro";
			}
		}
	}
	
   //사용자를 로그아웃 시킴
   @GetMapping("logout")
   public String logout(HttpServletRequest request) 
   {
      request.getSession().invalidate();
      return "redirect:/";
   }
   
   //회원정보 수정 
   @GetMapping("modify")
   public void memmodify()
   {
	   log.info("memmodify()*****");
   }
   
   @PostMapping("modify")
   public String memmodify(MemberVO vo,RedirectAttributes rttr,HttpServletRequest request,Model model)
   {
		String email = vo.getEmail1()+"@"+vo.getEmail2();
		vo.setEmail(email);
		String tel = vo.getTel1()+"-"+vo.getTel2()+"-"+vo.getTel3();
		vo.setTel(tel);
		String c_code=vo.getC_code1()+"-"+vo.getC_code2()+"-"+vo.getC_code3();
		vo.setC_code(c_code);
		int row = service.memModify(vo);
		model.addAttribute("row", row);
	   return "/member/modify_pro";
   }
   
   //회원정보 수정 
   @GetMapping("admo")
   public void admo(@RequestParam("idx") int idx,Model model)
   {
	   MemberVO vo = service.memSelect(idx);
	   model.addAttribute("vo", vo);
	   log.info("admo()*****");
   }
   
   @PostMapping("admo")
   public String admo(MemberVO vo,RedirectAttributes rttr,HttpServletRequest request,Model model)
   {
	   String email = vo.getEmail1()+"@"+vo.getEmail2();
	   vo.setEmail(email);
	   String tel = vo.getTel1()+"-"+vo.getTel2()+"-"+vo.getTel3();
	   vo.setTel(tel);
	   String c_code=vo.getC_code1()+"-"+vo.getC_code2()+"-"+vo.getC_code3();
	   vo.setC_code(c_code);
	   int row = service.admo(vo);
	   model.addAttribute("row", row);
	   return "/member/admo_pro";
   }
   
   //회원 리스트
   @GetMapping("list")
   public void memlist(MemberVO vo, PageVO vo1, Model model,@RequestParam("page") int page)
   {
	   String url = "list";
		int nowpage = 1; // 시작페이지
		int maxlist = 10; // 페이지당 최대 자료수
		int totpage = 1; // 총 페이지 개수

		int totcount = 0;
		if(vo1.getKey() == null) 
		{
			totcount = service.memCount();
		} else 
		{

			totcount = service.memSearchCount(vo1);
		}

		// 총페이지수 계산
		if(totcount % maxlist == 0) 
		{
			totpage = totcount / maxlist;
		} else {
			totpage = totcount / maxlist + 1;
		}
		if(totpage == 0) 
		{
			totpage = 1;
		}
		if(page != 0) 
		{
			nowpage = page;
		}
		if(nowpage > totpage) 
		{ // 현재페이지가 총페이지보다크면 마지막페이지를 현제페이지로
			nowpage = totpage;
		}
		int startpage = (nowpage - 1) * maxlist + 1;// 현재 페이지 시작번호
		int endpage = nowpage * maxlist;
		int listcount = totcount - ((nowpage - 1) * maxlist);

		// PageVO vo = new PageVO();
		vo1.setStartpage(startpage);
		vo1.setEndpage(endpage);

		model.addAttribute("page", nowpage);
		model.addAttribute("totpage", totpage);
		model.addAttribute("listcount", listcount);
		model.addAttribute("totcount", totcount);

		if(vo1.getKey() == null) 
		{
			model.addAttribute("list", service.memList(vo1));

		} else 
		{
			model.addAttribute("list", service.memListSearch(vo1));
		}

		if (vo1.getKey() == null) {
			//다음 페이지
			String nextpage="/member/list?page="+totpage;
			if(nowpage<totpage) {
				nextpage="/member/list?page="+(nowpage+1);
			}
			//이전페이지
			String prevPage="/member/list?page="+1;
			if(nowpage>1) {
				prevPage="/member/list?page="+(nowpage-1);
			}
			
			model.addAttribute("prev",prevPage);
			model.addAttribute("next",nextpage);
			model.addAttribute("page",PageIndex.pageList(nowpage, totpage, url, "").substring(46,PageIndex.pageList(nowpage, totpage, url, "").length()-46));
			
			//model.addAttribute("listpage", PageIndex.pageList(nowpage, totpage, url, ""));
		} else {
			//model.addAttribute("listpage", PageIndex.pageListHan(nowpage, totpage, url, vo.getSearch(), vo.getKey()));
			//다음 페이지
			String nextpage="/member/list?page="+totpage+"&search=" + vo1.getSearch() + "&key=" +vo1.getKey();;
			if(nowpage<totpage) {
				nextpage="/member/list?page="+(nowpage+1)+"&search=" + vo1.getSearch() + "&key=" +vo1.getKey();;
			}
			//이전페이지
			String prevPage="/member/list?page="+1+"&search=" + vo1.getSearch() + "&key=" +vo1.getKey();;
			if(nowpage>1) {
				prevPage="/member/list?page="+(nowpage-1)+"&search=" + vo1.getSearch() + "&key=" +vo1.getKey();;
			}
			
			model.addAttribute("prev",prevPage);
			model.addAttribute("next",nextpage);
			
			model.addAttribute("page",PageIndex.pageListHan(nowpage, totpage, url, vo1.getSearch(), vo1.getKey()).substring(46,PageIndex.pageListHan(nowpage, totpage, url, vo1.getSearch(), vo1.getKey()).length()-46));
		}
   }
   
   @PostMapping("list")
   public void memlistP(MemberVO vo, PageVO vo1, Model model,@RequestParam("page") int page)
   {
	   String url = "list";
		int nowpage = 1; // 시작페이지
		int maxlist = 10; // 페이지당 최대 자료수
		int totpage = 1; // 총 페이지 개수

		int totcount = 0;
		if(vo1.getKey() == null) 
		{
			totcount = service.memCount();
		} else 
		{

			totcount = service.memSearchCount(vo1);
		}

		// 총페이지수 계산
		if(totcount % maxlist == 0) 
		{
			totpage = totcount / maxlist;
		} else {
			totpage = totcount / maxlist + 1;
		}
		if(totpage == 0) 
		{
			totpage = 1;
		}
		if(page != 0) 
		{
			nowpage = page;
		}
		if(nowpage > totpage) 
		{ // 현재페이지가 총페이지보다크면 마지막페이지를 현제페이지로
			nowpage = totpage;
		}
		int startpage = (nowpage - 1) * maxlist + 1;// 현재 페이지 시작번호
		int endpage = nowpage * maxlist;
		int listcount = totcount - ((nowpage - 1) * maxlist);

		// PageVO vo = new PageVO();
		vo1.setStartpage(startpage);
		vo1.setEndpage(endpage);

		model.addAttribute("page", nowpage);
		model.addAttribute("totpage", totpage);
		model.addAttribute("listcount", listcount);
		model.addAttribute("totcount", totcount);

		model.addAttribute("list", service.memListSearch(vo1));
		
		String nextpage="/member/list?page="+totpage+"&search="+vo1.getSearch()+"&key="+vo1.getKey();
		if(nowpage<totpage) {
			nextpage="/member/list?page="+(nowpage+1)+"&search="+vo1.getSearch()+"&key="+vo1.getKey();
		}
		//이전페이지
		String prevPage="/member/list?page="+1+"&search="+vo1.getSearch()+"&key="+vo1.getKey();
		if(nowpage>1) {
			prevPage="/member/list?page="+(nowpage-1)+"&search="+vo1.getSearch()+"&key="+vo1.getKey();
		}
		
		
		model.addAttribute("prev",prevPage);
		model.addAttribute("next",nextpage);
		
		model.addAttribute("page",PageIndex.pageListHan(nowpage, totpage, url, vo1.getSearch(), vo1.getKey()).substring(46,PageIndex.pageListHan(nowpage, totpage, url, vo1.getSearch(), vo1.getKey()).length()-46));

   }
	
   @GetMapping("idsearch")
   public void idsearch(Model model)
   {
	   model.addAttribute("userid",0);
	   log.info("Getidsearch()*****");
   }
   
   @PostMapping("idsearch")
   public String idsearch(Model model, HttpServletRequest request, MemberVO vo, RedirectAttributes rttr)
   {
	   log.info("Postidsearch()*****");
	   
	   MemberVO vo1= service.idsearch(vo);
	   log.info(""+vo);
		String userid="";
	//	model.addAttribute("row",row);
		if(vo1!=null)
		{ 
			log.info("1");
			userid = vo1.getUserid();
			log.info(userid);
		//	rttr.addAttribute("userid",userid);
			model.addAttribute("userid",userid);
			model.addAttribute("chk",3);
		}else
		{ 
			log.info("2");
			//rttr.addAttribute("userid",1);
			model.addAttribute("userid",1);
		}
	   
	   return "/member/idsearch";
   }
   
   @GetMapping("pwchange")
   public void pwchange(Model model)
   {
	   model.addAttribute("code",0);
	   log.info("Getpwchange()*****");
   }
   
   @PostMapping("pwchange")
   public String pwchange(Model model, HttpServletRequest request, MemberVO vo, RedirectAttributes rttr,EmailVO evo)
   {
	   log.info("Postpwchange()*****");
		String email = vo.getEmail1()+"@"+vo.getEmail2();
		vo.setEmail(email);
		
		log.info(vo.getEmail());
		log.info(vo.getName());
		log.info(vo.getUserid());
		
	   MemberVO vo1= service.pwchange(vo);
	   log.info(""+vo);
		String userid="";
	//	model.addAttribute("row",row);
		if(vo1!=null)
		{ 
			log.info("1");

			//
			return "redirect:/member/sendEmail.do?userid="+vo.getUserid();
		}else
		{ 
			log.info("2");
			//rttr.addAttribute("userid",1);
			model.addAttribute("userid",1);
			return "/member/pwchange";
		}
	   
   }
   
   @RequestMapping("/sendEmail.do")
   public String sendEmail(HttpServletRequest req, HttpServletResponse res, @RequestParam("userid") String userid, MemberVO vo,Model model) throws Exception
   {
	   //메일관련 정보 
	  String host = "smtp.naver.com";
	  final String emailid = "tjr0315"; 
	  final String pass = "tkfkdgo1!2@";
	  int port = 587;
	  
	  //메일내용 
	  String recipient = "tjr0315@naver.com";
	  String subject = "비밀번호 변경을 위한 인증 코드";
	 
		final char[] random = 
			{
				'1','2','3','4','5','6','7','8','9','0',
				'A','B','C','D','E','F','G','H','I','J',
				'K','L','M','N','O','P','Q','R','S','T',
				'U','V','W','X','Y','Z'
			};
		final int randomcnt = random.length;
		Random rnd = new Random();
		StringBuffer buf = new StringBuffer();
		for(int x=0; x<6; x++)
		{
			buf.append(random[rnd.nextInt(randomcnt)]);
		}
		vo.setPw_code(buf.toString());
		service.pwcodeupdate(vo);
		log.info(buf.toString());
		String body = "인증코드는"+buf.toString()+"입니다.";
	  Properties props = System.getProperties();
	  
	  props.put("mail.smtp.host", host);
	  props.put("mail.smtp.port", port);
	  props.put("mail.smtp.auth", "true");
	  props.put("mail.smtp.ssl.enable", "trun");
	  props.put("mail.smtp.ssl.trust", host);
	  
	  Session se = Session.getDefaultInstance(props, new javax.mail.Authenticator()
			  {
		  		String un = emailid;
		  		String pw = pass;
		  		protected PasswordAuthentication getPasswordAuthentication()
		  		{
		  			return new PasswordAuthentication(un, pw);
		  		}
			  });
	  se.setDebug(true);
	  
	  Message mimeMessage = new MimeMessage(se);
	  mimeMessage.setFrom(new InternetAddress(emailid+"@naver.com"));
	  mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
	  mimeMessage.setSubject(subject);
	  mimeMessage.setText(body);
	  Transport.send(mimeMessage);
	  
	  model.addAttribute("userid",vo.getUserid());
	  return "/member/pwchange_pro";
   }

  @PostMapping("pwupdate")
  public String pwupdate(MemberVO vo,Model model)
  {
	  String newPassword = pwdEncoder.encode(vo.getPasswd());
	  vo.setPasswd(newPassword);
	  int row = service.pwupdate(vo);
	   model.addAttribute("row", row);
	  return "/member/pwupdate_pro";
  }
}
