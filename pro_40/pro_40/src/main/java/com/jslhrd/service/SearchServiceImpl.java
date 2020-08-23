package com.jslhrd.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jslhrd.domain.SearchVO;
import com.jslhrd.mapper.SearchMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class SearchServiceImpl implements SearchService {
	private SearchMapper mapper;

	//전체 검색
	@Override
	public List<SearchVO> all_Search(String search) {
		System.out.println("search service...");
		
		return mapper.all_Search(search);
	}

}
