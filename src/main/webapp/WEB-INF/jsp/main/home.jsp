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

<script>
	$(document).ready(function() {

		//
		$("#tabs").tabs();

		$("#tabs1-tabs").tabs();

	});

	//임시 테이블 조회   //EMPLOYEES  이걸로 고정
	function fn_search() {

		var frmData = $("#tabs1-frm").serializeArray();

		$.ajax({
			url : "main/getUser.do",
			type : "post",
			dataType : "json",
			data : frmData,
			success : function(data) {
				console.log("data", data);
				$("#tabs1-tabs1-input").val(data.result);
				var list = data;

				var htmlHead = "";
				var htmlBody = "";

				htmlHead += " 	<tr>";
				htmlHead += " 		<th width='20px'>No</th>";
				htmlHead += " 		<th width='55px'>사번</th>";
				htmlHead += " 		<th width='55px'>생일</th>";
				htmlHead += " 		<th width='55px'>성</th>";
				htmlHead += " 		<th width='70px'>이름</th>";
				htmlHead += " 		<th width='40px'>성별</th>";
				htmlHead += " 		<th width='120px'>입사일</th>";
				htmlHead += " 	</tr>";

				for (i = 0; i < list.length; i++) {
					var item = list[i];
					htmlBody += "<tr>";
					htmlBody += "<td width='20px'>" + (i + 1) + "</td>"
					htmlBody += "<td width='55px'>" + item["empNo"] + "</td>";
					htmlBody += "<td width='55px'>" + item["birthDate"]
							+ "</td>";
					htmlBody += "<td width='55px'>" + item["firstName"]
							+ "</td>";
					htmlBody += "<td width='70px'>" + item["lastName"]
							+ "</td>";
					htmlBody += "<td width='40px'>" + item["gender"] + "</td>";
					htmlBody += "<td width='120px'>" + item["hireDate"]
							+ "</td>";
					htmlBody += "</tr>";
				}

				//
				$("#tableHead").html(htmlHead);
				$("#tableBody").html(htmlBody);

			},
			error : function(xhr, status, error) {
				alert("에러발생");
			}
		});

	}
	
	
	
	
	
	
	
</script>

<script>
//검색기능을 여기에 만드는데 검색은 조회와 같은 기능이다. 쿼리만 조금 다를뿐일거다.
	$(document).ready(function(){
		
		$("#tabs").tabs();
		
		$("#tabs1-tabs").tabs();
		
		
	});
	
funtion fn_searching(){
	
	var frmData1 = $("#tabs1-frm").serializeArray();
	
	$.ajax({
		url : "main/getUser.do",
		type : "post",
		dateType : "json",
		date : frmData,
		success : function("date", date){
			console.log("data1",data);
			
			$("#tabs1-tabs1-input").val(data.result);
			var list = data;
			
			val htmlHead1 = "";
			var hrmlBody1 = "";
			
			htmlHead += " 	<tr>";
			htmlHead += " 		<th width='20px'>No</th>";
			htmlHead += " 		<th width='55px'>사번</th>";
			htmlHead += " 		<th width='55px'>생일</th>";
			htmlHead += " 		<th width='55px'>성</th>";
			htmlHead += " 		<th width='70px'>이름</th>";
			htmlHead += " 		<th width='40px'>성별</th>";
			htmlHead += " 		<th width='120px'>입사일</th>";
			htmlHead += " 	</tr>";
			
			
			
			
		}
		
		
		
	})
	
}

	
	
	
	


</script>


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
			<!-- tabs2 -->
			<div id="tabsUserList">
				<form id="tabs1-frm" name="tabs1-frm" method="post"
					onSubmit="return false;">
					<input type="hidden" id="searchTableName" name="searchTableName" />
					<input type="hidden" id="searchObjectType" name="searchObjectType" />
					<input type="hidden" id="searchObjectName" name="searchObjectName" />
					<input type="hidden" id="searchTriggerName"
						name="searchTriggerName" />

					<div class="content">
						<div class="">
							<div class="layout">
								<button class="button color_sub"
									onclick="fn_search();">조회			
								</button>
								
								<form>
									<input type="text" name="word" placeholder="사번을 입력하세요.">
									<button class ="button color_sub" onclick="fn_searching();">
										검색
									</button></form>
								</form>
								
								
							</div>
							<div class="layout">
								<div class="fixedTable">
									<div class="fixedBox">
										<table>
											<thead id="tableHead">
												<tr>
													<th width='20px'>No</th>
													<th width='190px'>테이블</th>
													<th width='40px'>컬럼</th>
													<th>설명</th>
												</tr>
											</thead>
											<tbody id="tableBody"></tbody>
										</table>
									</div>
								</div>
							</div>
						</div>

					</div>
				</form>
			</div>
			<!-- // tabs1 -->

			<!-- tab2 -->
			<div id="tabsLogin">
				<form id="tabs6-frm" name="tabs6-frm" method="post"
					onSubmit="return false;">
					<div class="content">
						<table>
							<tr>
								<th width='100px'>아이디</th>
								<td width='200px'><input type="text" id="username"
									name="username" style="width: 200px;" value="kss" /></td>
							</tr>
							<tr>
								<th width='100px'>비밀번호</th>
								<td width='200px'><input type="text" id="password"
									name="password" style="width: 200px;" value="1" //></td>
							</tr>
							<tr>
								<th width='100px' colspan="2">
									<button class="button color_sub"
										onclick="javascript:fn_login();">로그인</button>
								</th>
							</tr>
						</table>
					</div>
				</form>
			</div>
			<!-- // tabs3 -->

			<!-- tabs4 -->
			<!-- tabs6 -->

			<!-- // tabs6 -->


		</div>
	</div>


	<!-- popup  -->
	<div id="popupBox" title="테이블"></div>

</body>
</html>