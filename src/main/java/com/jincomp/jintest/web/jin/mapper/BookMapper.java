package com.jincomp.jintest.web.jin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jincomp.jintest.web.jin.vo.BookVO;

@Mapper
public interface BookMapper {
	//리스트
	public List<BookVO> getBookList();
	
	
	
}
