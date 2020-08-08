package com.jslhrd.domain;

import lombok.Data;

@Data
public class NoticeVO {

	private int idx;
	private String subject;
	private String contents;
	private String filename;
	private String regdate;
	private int readcnt;
	
}
