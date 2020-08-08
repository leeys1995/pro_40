package com.jslhrd.domain;

import lombok.Data;

@Data
public class HospBoardVO {
	
	private int idx;
	private String subject;
	private String contents;
	private String filename;
	private String regdate;
	private int readcnt;
	
	private String idx2;  //부모의 키
}
