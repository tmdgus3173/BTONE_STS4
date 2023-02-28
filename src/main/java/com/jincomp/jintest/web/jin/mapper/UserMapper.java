package com.jincomp.jintest.web.jin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jincomp.jintest.web.jin.vo.UserVO;

@Mapper
public interface UserMapper {

	List<UserVO> getUserList();
	
	List<UserVO> searchUserList(String word);
	//service에서 받은 requestParam을 String word로 받곤
	
}
