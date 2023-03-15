<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<script type="text/javascript">
	$(document).ready(function() { // 화면이 켜지면 기본적으로 셋팅되는효과들을 정의

		$("#tabs").tabs();

		$("#tabs1-tabs").tabs();

	});
</script>

</head>
<body>
	<div class="container">
		<div id="tabs">
			<!-- menu bar-->
			<div class="header">
				<ul class="tabNav">
					<li><a href="#tabsHome">HOME</a></li>
					<li><a href="#tabsAdmin">관리자용</a></li>
				</ul>
			</div>

			<!-- tabs 안에 content -->
			<div class="content">
				<!-- home -->
				<div id="tabsHome">
					<div id="tabsUserList">
						<form id="tabs1-frm" name="tabs1-frm" method="post"
							onSubmit="return false;">
							<input type="hidden" id="searchTableName" name="searchTableName" />
							<input type="hidden" id="searchObjectType"
								name="searchObjectType" /> <input type="hidden"
								id="searchObjectName" name="searchObjectName" /> <input
								type="hidden" id="searchTriggerName" name="searchTriggerName" />

							<div class="content">
								<div class="">
									<div class="layout">
										<select id="searchType" name="searchType">
											<option value="">--선택--</option>
											<option value="EMP_NO">사번</option>
											<option value="NAME">이름</option>
											<option value="HIRE_DATE">입사일</option>
										</select> <input type="text" name="keyword" value=""
											placeholder="검색어를 입력하세요.">
										<button class="button color_sub" onclick="fn_search();">검색
										</button>
										<div class="div_radio">
											<input type="radio" id="all" name="gender" value="" /> <label
												for="all">전체</label> <input type="radio" id="male"
												name="gender" value="M" /> <label for="male">남</label> <input
												type="radio" id="female" name="gender" value="F" /> <label
												for="female">여</label>
										</div>
										<button onclick="location.href='/addUser.do'" class="button">추가</button>
										<!-- 사원등록 양식 페이지로 이동 -->
										<button onclick="fn_delete();" class="button">삭제</button>
										<button onclick="fn_select();" class="button">조회</button>
									</div>

									<div class="layout" id="reRoad">
										<div class="fixedTable">
											<div class="fixedBox"
												style="overflow-x: hidden; height: 500px">
												<table>
													<thead id="tableHead">
														<tr>
															<th width='20px'>No</th>
															<th width='190px'>테이블</th>
															<th width='40px'>컬럼</th>
															<th>설명</th>
														</tr>
													</thead>
													<tbody class="table" id="tableBody">
														<c:forEach var="item" items="${getBookList}" varStatus="status">
															<tr>
																<!-- 도서목록 -->
																<th width='70px'>${item.BookId}</th>
																<th width='40px'>${item.BookName}</th>
																<th width='120px'>${item.price}</th>
															</tr>
														</c:forEach>
													</tbody>
												</table>
												<div id="button"></div>
											</div>
										</div>

									</div>
								</div>
							</div>
						</form>
					</div>
					<!-- // tabs1 -->
				</div>
				<!--tabsHome -->
			</div>
			<!-- 관리자 -->
			<div id="tabsAdmin"></div>

		</div>
		<!-- signUpLayout -->
	</div>
	<!-- content -->
	</div>
	<!--TABS END -->
	</div>
	<!-- 메인 컨테이너 끝 -->

	<!-- popup  -->
	<div id="popupBox" title="테이블"></div>

</body>
</html>