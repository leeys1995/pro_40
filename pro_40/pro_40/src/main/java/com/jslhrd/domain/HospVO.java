package com.jslhrd.domain;

import lombok.Data;

@Data
public class HospVO {
		
	private int idx;
	private String h_name;
	private String h_code;
	private String h_tel;
	private String h_addr1;
	private String h_addr2;
	private String h_banner;
	private String h_photo;
	private String h_history;
	private String h_come;
	private String d_photo;
	private String d_mager;
	private String d_medical;
	private String h_video;
	
	private int h_readcnt;
}
