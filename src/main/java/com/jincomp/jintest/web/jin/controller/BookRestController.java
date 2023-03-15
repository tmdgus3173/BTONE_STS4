package com.jincomp.jintest.web.jin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jincomp.jintest.web.jin.service.BookService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RequestMapping(value = "/main")
@RestController
public class BookRestController<BookVO> {
	
	private static final Logger logger = LoggerFactory.getLogger(BookRestController.class);

@Autowired
private BookService bookService;

}
