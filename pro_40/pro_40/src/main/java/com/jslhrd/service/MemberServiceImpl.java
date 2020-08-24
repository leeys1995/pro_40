package com.jslhrd.service;

import java.util.List;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.jslhrd.domain.EmailVO;
import com.jslhrd.domain.MemberVO;
import com.jslhrd.domain.PageVO;
import com.jslhrd.mapper.MemberMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService 
{
	private MemberMapper mapper;
	@Override
	public int memInsert(MemberVO vo) 
	{

		return mapper.memInsert(vo);
	}
	
	@Override
	public MemberVO memIdchk(MemberVO vo) 
	{
		
		return mapper.memIdchk(vo);
	}
	
	@Override
	public MemberVO memLogin(MemberVO vo) 
	{
		
		return mapper.memLogin(vo);
	}
	
	@Override
	public int memModify(MemberVO vo) 
	{
		return mapper.memModify(vo);
	}
	
	@Override
	public int admo(MemberVO vo) 
	{
		
		return mapper.admo(vo);
	}
	
	@Override
	public int memCount() 
	{
		return mapper.memCount();
	}
	
	@Override
	public int memSearchCount(PageVO vo) 
	{
		return mapper.memSearchCount(vo);
	}
	
	@Override
	public List<MemberVO> memList(PageVO vo) 
	{
		return mapper.memList(vo);
	}
	
	@Override
	public List<MemberVO> memListSearch(PageVO vo) 
	{
		return mapper.memListSearch(vo);
	}
	
	@Override
	public MemberVO memSelect(int idx) 
	{
		return mapper.memSelect(idx);
	}
	
	@Override
	public void lastTimeUpdate(MemberVO vo) 
	{
		mapper.lastTimeUpdate(vo);
		
	}
	
	@Override
	public MemberVO idsearch(MemberVO vo) 
	{
		return mapper.idsearch(vo);
	}
	
	@Override
	public MemberVO pwchange(MemberVO vo) 
	{
		return mapper.pwchange(vo);
	}
	
	@Override
	public void pwcodeupdate(MemberVO vo) 
	{
		mapper.pwcodeupdate(vo);
	}
	
	@Override
	public int pwupdate(MemberVO vo) 
	{
		return mapper.pwupdate(vo);
	}
	
}
