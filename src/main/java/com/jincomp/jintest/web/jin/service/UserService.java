package com.jincomp.jintest.web.jin.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jincomp.jintest.web.jin.mapper.UserMapper;
import com.jincomp.jintest.web.jin.vo.UserVO;

import lombok.RequiredArgsConstructor;

/**
 *
 * @author kyj
 */
@RequiredArgsConstructor
@Service
public class UserService {

	private static final Logger logger = LoggerFactory.getLogger(UserService.class);
	
	@Autowired
	private UserMapper jinMapper;


	public List<UserVO> getUserList() {
		logger.debug("getUserList 진입");
		List<UserVO> mapper = jinMapper.getUserList();

		return mapper;
	}
	
	public List<UserVO> searchUserList(String word){
		logger.debug("searchUserList 진입");
		
		List<UserVO> mapper1 = jinMapper.searchUserList(word);
		
		
		return mapper1;
	}


}
