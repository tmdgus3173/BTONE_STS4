package com.jincomp.jintest.web.jin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import com.jincomp.jintest.web.jin.service.BookService;
import com.jincomp.jintest.web.jin.vo.BookVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class HomeController {
	@Autowired
	private static final Logger log = LoggerFactory.getLogger(HomeController.class);

	private final BookService bookService;


	@GetMapping("/") // 처음 DOMAIN 주소로 접근시 jsp 호출용.
	public String showFirstHome(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		
		// bookList 가져오는 로직
		List<BookVO> getBookList = bookService.getBookList();
		model.addAttribute("getBookList",getBookList);
		
		
		return "/main/home2"; // home.jsp 로 구성
	}		

}
