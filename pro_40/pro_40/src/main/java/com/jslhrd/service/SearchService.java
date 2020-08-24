package com.jslhrd.service;

import java.util.List;

import com.jslhrd.domain.SearchVO;

public interface SearchService {

	//전체 검색
	public List<SearchVO> all_Search(String search);
}
