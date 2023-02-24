package com.jincomp.jintest.web.jin.vo;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonAutoDetect.Visibility;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@AllArgsConstructor
@Data
@Getter
@Setter
@JsonAutoDetect(fieldVisibility = Visibility.ANY)
public class UserVO implements Serializable {

	public static final long serialVersionUID = 1L;
	private String empNo;
	private String birthDate;
	private String firstName;
	private String lastName;
	private String gender;
	private String hireDate;

}
