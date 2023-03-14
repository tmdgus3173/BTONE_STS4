package com.jincomp.jintest.web.jin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
   public List<UserVO> tableList(HttpServletRequest request, HttpServletResponse response) throws Exception {

       List<UserVO> list = jinService.getUserList();

       logger.debug("list : {}" ,list);

       return list;
   }

   @PostMapping(value = "/delete.do")
   public int deleteUserList(String deleteCheck) throws Exception {

       
	   
       int row =  jinService.deleteCheckUser(deleteCheck);
       
       

       return row;
   }
   
   

}
