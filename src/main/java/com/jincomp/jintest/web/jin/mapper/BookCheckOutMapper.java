package com.jincomp.jintest.web.jin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jincomp.jintest.web.jin.vo.BookCheckOutVO;

@Mapper
public interface BookCheckOutMapper {
	//리스트
	public List<BookCheckOutVO> getBookCheckOutList();
}
