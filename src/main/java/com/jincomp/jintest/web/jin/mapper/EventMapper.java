package com.jincomp.jintest.web.jin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jincomp.jintest.web.jin.vo.EventVO;

@Mapper
public interface EventMapper {
	//리스트
	public List<EventVO> getEventList();
	
	
	
}
