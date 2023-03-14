package com.jincomp.jintest.web.jin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jincomp.jintest.web.jin.vo.UserLoginVO;
import com.jincomp.jintest.web.jin.vo.UserVO;

@Mapper
public interface UserMapper {
	//리스트
	public List<UserVO> getUserList();
	
	//삭제
	public int deleteCheckUser(String deleteList);
	
	//추가
	public int insertUser(UserVO userVO);
	
	//회원가입
	public int signUp(UserLoginVO userLoginVO);
	
}
