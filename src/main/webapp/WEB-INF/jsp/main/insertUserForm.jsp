<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>양진 추가</title>
 	<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/jquery-ui.css'/>" />
    
    <script src="<c:url value='/js/jquery-1.12.4.min.js'/>"></script>
    <script src="<c:url value='/js/jquery.form.js'/>"></script>
    <script src="<c:url value='/js/jquery-ui.js'/>"></script>
</head>
<body>
<div class="container">
    <div id="tabs">
        <div class="header">
            <table width="100%">
                <tbody>
                <tr>
                    <th style="width: 200px; text-align: left;">BTONE</th>
                    <td>
                        <ul>
                            <li><a href="#tabsUserList">조회</a></li>
                            <li><a href="#tabsLogin">로그인</a></li>
                        </ul>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        
        <div class="content">
        	<div class="layout">
        		<div class="insert">
        			<form action = "/user/insertUserForm" id="addForm" method="post">
        			<table>
	        			<tbody>
	       					<tr>
								<!-- <th>사번</th> -->
								<td>
								<input type="hidden" name="empNo" id="empNo"  >
								</td>
							</tr>
							
							<tr>
								<th>생일</th>
								<td>
									<input type="text" name="birthDate" id="birthDate">
								</td>
							</tr>
							<tr>
								<th>이름</th>
								<td>
									<input type="text" name="name" id="name">
								
								</td>
							</tr>
							<tr>
								<th>성별</th>
								<td>
									<input type="radio" name="gender" id="gender" value="M">남자 
									<input type="radio" name="gender" id="gender" value="F">여자
								
								</td>
							</tr>
								<tr>
								<!-- <th>입사일</th> -->
								<td>
									<input type="hidden" name="hireDate" id="hireDate"  >  
								</td>
							</tr>
	       				</tbody>
	       				</table>
	       				<input type="submit"  value="추가하기"></input>
        			</form>
        		</div>
        	
        	</div>
        
        </div>
        </div>
        </div>











</body>
</html>