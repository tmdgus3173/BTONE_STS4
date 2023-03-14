package com.jincomp.jintest.web.jin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jincomp.jintest.web.jin.vo.BookVO;
import com.jincomp.jintest.web.jin.vo.UserVO;

@Mapper
public interface BookMapper {
	//리스트
	public List<BookVO> getBookList();
	
	
	
}
