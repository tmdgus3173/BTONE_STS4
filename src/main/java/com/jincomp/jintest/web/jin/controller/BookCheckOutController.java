package com.jincomp.jintest.web.jin.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jincomp.jintest.web.jin.service.BookCheckOutService;
import com.jincomp.jintest.web.jin.service.UserService;
import com.jincomp.jintest.web.jin.vo.BookCheckOutVO;
import com.jincomp.jintest.web.jin.vo.UserVO;

@Controller
public class BookCheckOutController {
	
		
	@Autowired
	private BookCheckOutService bookCheckOutService;
	
	private static final Logger log = LoggerFactory.getLogger(BookCheckOutController.class);

	
	@GetMapping("/bookCheckOut")  // 처음 DOMAIN 주소로 접근시 jsp 호출용.
	public String getBookCheckOutList(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
	List<BookCheckOutVO> getBookCheckOutList = bookCheckOutService.getBookCheckOutList();
	model.addAttribute("getBookCheckOutList",getBookCheckOutList);
		
		
		return "/main/booksCheckOut";  //home.jsp 로 구성
	}
	
	}
