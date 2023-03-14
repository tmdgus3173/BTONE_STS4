package com.jincomp.jintest.web.jin.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
	
	
	public int  deleteCheckUser(String deleteList) {
//		String row = jinMapper.deleteCheckUser(deleteList);
		
		
		int result =  jinMapper.deleteCheckUser(deleteList);
	
		return result;
	}
	
	
	
	
	
	
	
	public int insertUser(UserVO userVO) {
		
		int row=0;
		
		
		
		List<UserVO> userList = jinMapper.getUserList();
		//리스트를 쭉 뽑아서
		int listSize = getUserList().size()-1;
		//리스트의 길이 0부터 시작이니까 -1
		
		if(userVO.getEmpNo().equals("")) {
			UserVO iuserVo = getUserList().get(listSize);
			//리스트 사이즈를 iuserVo에 넣어서
			logger.debug("iuserVo{}",iuserVo);
			
			int lastEmpNo = Integer.parseInt(iuserVo.getEmpNo());
			//그 값을 lastEmpNo에 담는다.
			lastEmpNo++;
			//하나씩 늘려준다.
			userVO.setEmpNo(String.valueOf(lastEmpNo));
			//userVO에 EmpNo에 set시켜준다. 문자열로 바꿔서
		}
		
		LocalDate now = LocalDate.now();
		
		if(userVO.getHireDate().equals("")) {
			
			
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
			String currentDate = now.format(formatter);
			
			userVO.setHireDate(currentDate);
		}
		
		
		

			row = jinMapper.insertUser(userVO);
		
		return row;
	
}
	

}
