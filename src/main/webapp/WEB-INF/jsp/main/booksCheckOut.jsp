<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영진</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/common.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/jquery-ui.css'/>" />

<script src="<c:url value='/js/jquery-1.12.4.min.js'/>"></script>
<script src="<c:url value='/js/jquery.form.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
</head>
<body>
	<table>
											<thead id="tableHead">
												<tr>
											  		<th width='55px'>번호</th>
											  		<th width='70px'>아이디</th>
											  		<th width='40px'>시작일</th>
											  		<th width='120px'>종료일</th>
													
												</tr>
											</thead>
											<tbody class="table" id="tableBody">
											 	<c:forEach var="item" items="${getBookCheckOutList}" varStatus="status">
													<tr>
														<th width='55px'>${item.empNo}</th>
														<th width='70px'>${item.goodsId}</th>
														<th width='40px'>${item.startDate}</th>
														<th width='120px'>${item.endDate}</th>
													</tr>
												</c:forEach>
											</tbody>
										</table>
</body>
</html>