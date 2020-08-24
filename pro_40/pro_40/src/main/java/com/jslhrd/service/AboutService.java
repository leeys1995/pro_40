package com.jslhrd.service;

public interface AboutService {
	//첫 글 입력시
	public void aboutInsert(String main_about);
	
	//저장 값 가져오기
	public String aboutView();
	
	//DB에 값이 있을 때
	public void aboutModify(String main_about);
	
}
