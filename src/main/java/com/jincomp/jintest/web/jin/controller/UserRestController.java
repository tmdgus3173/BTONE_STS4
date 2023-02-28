package com.jincomp.jintest.web.jin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jincomp.jintest.web.jin.service.UserService;
import com.jincomp.jintest.web.jin.vo.UserVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RequestMapping(value = "/main")
@RestController
public class UserRestController {

	private static final Logger logger = LoggerFactory.getLogger(UserRestController.class);

	@Autowired
	private UserService jinService;


   @RequestMapping(value = "/getUser.do")
   public List<UserVO> tableList(@RequestParam("word") String word,
		   						//RequestParam("가져올 데이터의 이름") 데이터타입 데이터변수
		   						//이 말은 word라는 아이디를 가지고 오는데 타입은 String 이다.
		   						 HttpServletRequest request, 
		   						 HttpServletResponse response) throws Exception {

       List<UserVO> list = jinService.searchUserList(word);
       //뒤에 돌고 받아온 결과값을 list에 담고
       logger.debug("listt : {}" ,list);
       //디버깅
       return list;
       //리턴한다.
       
       
       //localhost:8080 으로 url을 입력했을때 이거로 타고 들어와서 home.jsp 가 열린다. 이게 가장 먼저 시작되는 부분인 것이다.
       
   }



}
