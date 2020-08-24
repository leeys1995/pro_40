package com.jslhrd.mapper;

import java.util.List;

import com.jslhrd.domain.SearchVO;

public interface SearchMapper {
	
	//전체검색
	public List<SearchVO> all_Search(String search);
	
}
