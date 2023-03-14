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

import com.jincomp.jintest.web.jin.service.EventService;
import com.jincomp.jintest.web.jin.vo.EventVO;

@Controller
public class EventController {
	
		
	@Autowired
	private EventService eventService;
	
	private static final Logger log = LoggerFactory.getLogger(EventController.class);

	
	@GetMapping("/event")  // 처음 DOMAIN 주소로 접근시 jsp 호출용.
	public String getEventList(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
	List<EventVO> getEventList = eventService.getEventList();
	model.addAttribute("getEventList",getEventList);
		
		
		return "/main/event";  //home.jsp 로 구성
	}
	
	}
