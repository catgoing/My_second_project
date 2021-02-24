<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/savanna/js/bootstrap.js"></script>

<!-- Bootstrap core CSS -->
<link href="/savanna/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/savanna/css/savanna.css" rel="stylesheet">
<link href="/savanna/css/member.css" rel="stylesheet">
<link href="/savanna/css/sidebar.css" rel="stylesheet">
<title>회원정보</title>
</head>
<script>

	var sel_accept = '${vo.sel_accept }';
	
	$(function (){
		if( sel_accept == 'on'){
			$("input[type=checkbox]").prop("checked",true);
		}
	});
	
	function withdrawal(frm){
		frm.action = "/savanna/controller?type=adminWithdrawal";
		frm.submit();
	}
	
	function goList(){
		location.href = "/savanna/controller?type=memList";
	}
	
	function isAdmin(){
		if('${user.id}' != 'a'){
			alert("권한이 없습니다");
			location.href = "/savanna/controller?type=MainPage";
		}
	}

</script>
<style>
footer {
   width:100%;
   position:relative;
   bottom:0;
}

#wrapper{
	height: 1200px;
}

</style>
<body onload="isAdmin();" style="overflow: auto;">
	<!-- 페이지 로드한 이후 때 관리자인지 확인 -->
	<%@ include file="/common/menu.jspf"%>
	<%@ include file="/common/adminSidebar.jspf"%>

	<c:set var="isAdmin" value="${user.id }" />
	<c:if test="${'a' eq isAdmin }">
		<!-- 관리자 아이디일 때만 아래 내용 출력 -->



		<div id="wrapper">
			<form action="controller?type=adminUpdate" method="post" id="fr_info">
				<br>
				
				<h1 style="margin-right:150px">회원정보</h1>
				<!-- content-->
				<div id="content">
					<section>
					<!-- GO LIST BTN-->
					<div class="btn_area">
						<button type="button" id="signinbtn"
							style="margin-left: 130px; width: 200px; height: 40px; line-height: 0;"
							onclick="goList()">
							<span>목록으로</span>
						</button>
					</div>

					<!-- MEMBER.NO -->
					<div>
						<h3 class="join_title">
							<label for="mem_no">회원번호</label>
						</h3>
						<span class="box int_mem_no"> <input type="text"
							id="mem_no" name="mem_no" class="int" readonly
							value="${vo.mem_no }" maxlength="20">
						</span>
					</div>

					<!-- ID -->
					<div>
						<h3 class="join_title">
							<label for="id">아이디</label>
						</h3>
						<span class="box int_id"> <input type="text" id="id"
							name="id" class="int" readonly value="${vo.id }" maxlength="20">
						</span>
					</div>

					<!-- NAME -->
					<div>
						<h3 class="join_title">
							<label for="name">이름</label>
						</h3>
						<span class="box int_name"> <input type="text" id="name"
							name="name" class="int" value="${vo.name }" maxlength="20">
						</span> <span class="error_next_box"></span>
					</div>

					<!-- PW1 -->
					<div>
						<h3 class="join_title">
							<label for="pw">비밀번호</label>
						</h3>
						<span class="box int_pass"> <input type="text" id="pw"
							name="pwd" class="int" maxlength="12" value="${vo.pwd }"
							onchange="check_pw()"> <span id="alertTxtpw">사용불가</span>
						</span> <span id="check1"></span>
					</div>

					<!-- PHONE -->
					<div>
						<h3 class="join_title">
							<label for="phone">휴대전화</label>
						</h3>
						<span class="box int_phone"> <input type="text" id="phone"
							name="phone" class="int" value="${vo.phone }" maxlength="13">
						</span> <span class="error_next_box"></span>
					</div>

					<!-- EMIAL -->
					<div>
						<h3 class="join_title">
							<label for="email">이메일</label>
						</h3>
						<span class="box int_email"> <input type="email" id="email"
							name="email" class="int" value="${vo.email }" maxlength="20">
						</span> <span class="error_next_box"></span>
					</div>

					<!-- ADDRESS -->
					<div>
						<h3 class="join_title">
							<label for="addr">주소</label>
						</h3>
						<span class="box int_addr"> <input type="text" id="addr"
							name="addr" class="int" value="${vo.addr }" maxlength="50">
						</span> <span class="error_next_box"></span>
					</div>

					<!-- REGDATE -->
					<div>
						<h3 class="join_title">
							<label for="regdate">가입일</label>
						</h3>
						<span class="box int_regdate"> <input type="text"
							id="regdate" name="regdate" class="int" readonly
							value="${vo.regdate }" maxlength="50">
						</span> <span class="error_next_box"></span>
					</div>

					<br>

					<!-- SELECTIVE AGREEMENT -->
					<div>
						<span class="join_title"><label for="regdate">선택약관
								동의</label></span> <input type="checkbox" name=sel_accept id="sel_accept">
					</div>

					<!-- UPDATE BTN-->
					<div class="btn_area">
						<button type="submit" id="updatebtn"
							style="width: 49%; margin-bottom: 0;">
							<span>수정</span>
						</button>
						<button type="button" id="withdrawalbtn"
							style="width: 49%; margin-bottom: 0;"
							onclick="withdrawal(this.form)">
							<span>탈퇴</span>
						</button>
					</div>
					</section>

					<br>
					<br>
					<br>

				</div>
			</form>
		</div>
	</c:if>

	<div class="footer">
		<%@ include file="/common/foot.jspf"%>
	</div>
</body>
</html>
