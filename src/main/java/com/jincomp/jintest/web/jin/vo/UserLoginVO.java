package com.jincomp.jintest.web.jin.vo;

import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
public class UserLoginVO {
   
   private int userNo;
   private String userName;
   private String userId;
   private String userPassword;
   private String userAddress;
}