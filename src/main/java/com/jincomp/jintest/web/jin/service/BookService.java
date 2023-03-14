package com.jincomp.jintest.web.jin.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jincomp.jintest.web.jin.mapper.BookMapper;
import com.jincomp.jintest.web.jin.vo.BookVO;

import lombok.RequiredArgsConstructor;

/**
 *
 * @author kyj
 */
@RequiredArgsConstructor
@Service
public class BookService {

	private static final Logger logger = LoggerFactory.getLogger(BookService.class);
	
	@Autowired
	private BookMapper bookMapper;
	
	 
	public List<BookVO> getBookList() {
		logger.debug("getBookList 진입");
		List<BookVO> getBookList = bookMapper.getBookList();

		return getBookList;
	}


}
