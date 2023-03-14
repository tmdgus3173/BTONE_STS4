package com.jincomp.jintest.web.jin.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jincomp.jintest.web.jin.mapper.EventMapper;
import com.jincomp.jintest.web.jin.vo.EventVO;

import lombok.RequiredArgsConstructor;

/**
 *
 * @author kyj
 */
@RequiredArgsConstructor
@Service
public class EventService {

	private static final Logger logger = LoggerFactory.getLogger(EventService.class);
	
	@Autowired
	private EventMapper eventMapper;
	
	 
	public List<EventVO> getEventList() {
		logger.debug("getEventList 진입");
		List<EventVO> getEventList = eventMapper.getEventList();

		return getEventList;
	}


}
