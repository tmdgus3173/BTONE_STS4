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
	
	function fn_signUp(){
		
	}
	
	
	


	// db 삭제
	function fn_deleteList(){
		var checkCnt = $("input[name='deleteCheck']:checked").length;
		//name이 deleteCheck를 가진 요소들 중에서 check된 상태인 것들만 선택한다.
		
		
		var deleteCheck = new Array();
		//배열을
		
	
		$("input[name='deleteCheck']:checked").each(function(){
					
			//새롭게 만든 리스트에 체크된 값의 value를 넣는다.
			deleteCheck.push($(this).val());
		});
		console.log("deleteCheck:",deleteCheck)
	
		if(checkCnt == 0){
			alert("체크하세용");
		}  else {
			console.log("deleteCheck : ", deleteCheck);
			 
			 $.ajax({
				url : "/main/delete.do",
				type : "post",
				data : {
						"deleteCheck" : deleteCheck
					   },
				success : function(){
						
						alert("삭제 완료");
						 location.reload();
				}, 
				error : function(){
					alert("삭제");
					 location.reload();
				}
			});
		} 
		
		};
			
		function fn_infoList(){
			/* var infoCnt = $("input[name='deleteCheck']:checked").length;			
			
			var infoCheck = new Array();
			//체크된 항목을 담는 배열을 만들었어요.
			
			$("input[name='deleteCheck']:checked").each(function(){
				infoCheck.push($(this).val());
			});
			//console.log("infoCheck : ",infoCheck)
			
			if(infoCnt == 0){
				alert("체크된게 없습니다.");
			} else {
				console.log("체크 값이 잘 넘어오는지 infoCheck : ", infoCheck);
			} */
			
			$("#infoButton").click(function(){
				var row = $("#myTable tbody tr").has("input:checked");
				//이 친구가 계속 누적으로 쌓이고 있어서 조금 수정할 필요가 있어보인다.
				
				var result = "";
				
				console.log("test : ", row)
				
				row.each(function(){
					
					var cell = $(this).find("th");
					
					console.log("cell : ", cell)
					
					cell.each(function(){
						result += $(this).text() + " ";
						
						console.log("result : ",result)
					});
				});
				alert(result);
			});

		};
		
		
		
	/* function fn_updateList(){
		
		$("myTable tr").click(function(){
			var str =""
			var tdList = new Array();
			
			var tr = $(this)
			var td = tr.children();
			
			console.log("모든 데이터 : ",tr.text())
		}
	} */
		
		
	
	
				
	
				
	
	
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

				 " 	<tr>";
				 "       <th width='5px'>체크</th>";
				 " 		<th width='20px'>No</th>";
				 " 		<th width='55px'>사번</th>";
				 " 		<th width='55px'>생일</th>";
				 " 		<th width='70px'>이름</th>";
				 " 		<th width='40px'>성별</th>";
				 " 		<th width='120px'>입사일</th>";
				 " 	</tr>";

				for (i = 0; i < list.length; i++) {
					var item = list[i];
					
					htmlBody += "<tr>";
					htmlBody += "<td width='5px'> <input type = 'checkbox' name = 'deleteCheck' id='deleteCheck'> </td>" 
					htmlBody += "<td width='20px'>" + (i + 1) + "</td>"
					htmlBody += "<td width='55px'>" + item["empNo"] + "</td>";
					htmlBody += "<td width='55px'>" + item["birthDate"]	+ "</td>";
					htmlBody += "<td width='70px'>" + item["name"]	+ "</td>";
					htmlBody += "<td width='40px'>" + item["gender"] + "</td>";
					htmlBody += "<td width='120px'>" + item["hireDate"]	+ "</td>";
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
	
	/*  // 오늘 날짜를 생성합니다.
    const today = new Date();

    // 연도, 월, 일을 각각 추출합니다.
    const year = today.getFullYear();
    const month = String(today.getMonth() + 1).padStart(2, '0');
    const date = String(today.getDate()).padStart(2, '0');

    // yyyyMMdd 형식으로 문자열을 만듭니다.
    const todayString = `${year}${month}${date}`;

    // input 요소의 값을 설정합니다.
    document.getElementById('today_date').value = todayString;
	
    console.log("오늘날짜 : ",todayString) */
	
	
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
									<li><a href="#tabsInsert">DB추가</a></li>
									
									<li><a href="#tabsUserJoin">회원가입</a></li>
									<li><a href="#tabsBookRental">도서대출</a></li>
									<li><a href="#tabsAdmin">관리자용</a></li>
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
					<input type="hidden" id="searchTriggerName"	name="searchTriggerName" />

					<div class="content">
						<div class="">
							<div class="layout">
								<!-- <button class="button color_sub" onclick="fn_search();">조회</button> -->
	 
								 <button class="button color_sub" onclick="fn_deleteList();">db삭제</button>
								 
								 <button class="button color_sub" id="infoButton" onclick="fn_infoList();">INFO</button>
								
								 <button class="button color_sub" id="insertUser" onclick="location.href='/user/insertUserForm'">추가</button>
								 
							<!-- 	<div class="div_radio">
									<input type="radio" id="male" name="gender" value="M"/>
									<label for="male">남</label>
									<input type="radio" id="female" name="gender" value="F"/>
									<label for="female">여</label>
									<input type="radio" id="all" name="gender" value="A"/>
									<label for="all">전체</label>
								</div> -->
							</div>
							<div class="layout">
								<div class="fixedTable" style="overflow-x:hidden; height:500px">
									<div class="fixedBox">
										<table id= "myTable">
											<thead id="tableHead">
												<tr>
													<th width='5px'>체크</th>
				 									<th width='20px'>No</th>
											  		<th width='55px'>사번</th>
											  		<th width='55px'>생일</th>
											  		<th width='70px'>이름</th>
											  		<th width='40px'>성별</th>
											  		<th width='120px'>입사일</th>
													
												</tr>
											</thead>
											<tbody class="table" id="tableBody">
											 	<c:forEach var="item" items="${list}" varStatus="status">
													<tr>
														<th width='5px'><label><input type="checkbox" name='deleteCheck' id="deleteCheck" value= "${item.empNo}"></label></th>
														<th width='20px'>${status.count}</th>
														<th width='55px'>${item.empNo}</th>
														<th width='55px'>${item.birthDate}</th>
														<th width='70px'>${item.name}</th>
														<th width='40px'>${item.gender}</th>
														<th width='120px'>${item.hireDate}</th>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>

					</div>
				</form>
			</div>
			<div>
			
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
			<div id="tabsInsert">
				<div class="content">
					<table>
						<tbody>
							<tr>
								<th>사번</th>
								<td>
								<input type="text" name="empNo" id="empNo"  readonly="readonly">
								</td>
							</tr>
							
							<tr>
								<th>생일</th>
								<td>
									<input type="text" name="userBirthDay" id="userBirthDay">
								</td>
							</tr>
							<tr>
								<th>이름</th>
								<td>
									<input type="text" name="userName" id="userName">
								
								</td>
							</tr>
							<tr>
								<th>성별</th>
								<td>
									<input type="radio" name="userGender" id="userGender" value="M">남자 
									<input type="radio" name="userGender" id="userGender" value="F">여자
								
								</td>
							</tr>
								<tr>
								<th>입사일</th>
								<td>
									<input type="text" id="today_date" value="todayString" readonly="readonly">  
								</td>
							</tr>
							
						</tbody>
					</table>
					<button class="btn btn-success" onclick = "fn_insertUser();">추가하기</button>
				</div>
			
			<!-- 일단 대기 --> 
			</div>

			<!-- tabs4 -->
			<div class="signUpLayout">
            <div id = "tabsUserJoin">
               <p> 회원정보를 입력해주세요 </p>
               <div class="userinfo_box">
                  <div>
                     <input type="text"  placeholder="성함">
                  </div>
                  <div>
                     <input type="text"  placeholder="아이디">
                  </div>
                  <div>
                     <input type="password" placeholder="비밀번호">
                  </div>
                  <div>
                     <input type="password" placeholder="비밀번호 확인">
                  </div>
                  <div>
                     <input type="text" placeholder="휴대폰번호">
                  </div>
                  <div>
                     <input type="text" placeholder="주소">
                     <button class = "buttonAddress">주소 찾기</button>
                     <input type="text" placeholder="상세 주소">
                  </div>
                  <div>
                     <button class="button" onclick = "fn_signUp">회원가입</button>
                     <button class="button">취소</button>
                  </div>
               </div> <!--userinfo_box -->
            </div> <!-- tabsUserJoin -->
				
			
			<!-- tabs6 -->
			<div id = "tabsBookRental">
               <div class ="bookSearch">
                  <input type="text"  placeholder="검색할 도서 입력">
               </div>
            </div>
			
			

			<!-- // tabs6 -->
			
			<!-- tabs7 -->
			 <div id = "tabsAdmin">
         </div>

         </div> <!-- signUpLayout -->
      </div><!-- content -->
   </div> <!--TABS END -->
</div> <!-- 메인 컨테이너 끝 -->

<!-- popup  -->
<div id="popupBox" title="테이블"></div>
			
			<!-- // tabs7 -->











		</div> <!-- tabs end -->
	<div class="userUpdate" id="userUpdate">
	<br>
 사번: <input type="text" id="uEmpNo" name="empNo">
 생일: <input type="text" id="ubirthDate" name="birthDate">
 이름: <input type="text" id="uName" name="name">
 성별: <input type="text" id="uGender" name="gender">
 입사일: <input type="text" id="uHireDate" name="hireDate">
 <button class="button clolor_sub" id="updateUser" onclick="fn_updateList" >수정</button>
</div>
	</div>
	


	<!-- popup  -->
	<div id="popupBox" title="테이블"></div>

</body>
</html>