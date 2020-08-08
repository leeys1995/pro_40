package com.jslhrd.domain;

import lombok.Data;

@Data
public class PageVO {
	
	private String search;
	private String key;
	
	private int startpage;
	private int endpage;
	
	private int idx2;
}
