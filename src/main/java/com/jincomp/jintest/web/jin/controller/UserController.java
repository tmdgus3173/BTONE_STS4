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

import com.jincomp.jintest.web.jin.service.UserService;
import com.jincomp.jintest.web.jin.vo.UserVO;

@Controller
public class UserController {
	
		
	@Autowired
	private UserService userService;
	
	private static final Logger log = LoggerFactory.getLogger(UserController.class);

	
	@GetMapping("/")  // 처음 DOMAIN 주소로 접근시 jsp 호출용.
	public String showFirstHome(@RequestParam HashMap param, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
	List<UserVO> list = userService.getUserList();
	model.addAttribute("list",list);
		
		
		return "/main/home";  //home.jsp 로 구성
	}
	
	@PostMapping("/delete")
	public void deleteUser(@RequestParam("deleteCheck[]") List<String> deleteCheck) {
		
		log.debug("{}", "Delete 진입");
		for(String empNo : deleteCheck) {
			userService.deleteCheckUser(empNo);
				
		}
	
		
		
		
		

		
	}
	//추가 
	@GetMapping("/user/insertUserForm")
	public String insertUser() {
		
		log.debug("컨트롤러 애드 폼 진입");
		
		return "/main/insertUserForm";
	}
	//추가 액션
	@PostMapping("/user/insertUserForm")
	public String insertUserAction(UserVO userVO) {
		
		log.debug("애드 액션 진입 {}", userVO);
		
		userService.insertUser(userVO);
		
		
		
		return "redirect:/";
	}
	
	
	
	
	
	
	

}
