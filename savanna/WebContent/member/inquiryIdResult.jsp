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
<title>아이디 찾기 결과</title>
<style>
footer {
   width:100%;
   position:absolute;
   bottom:0;
}
</style>
</head>
<body>
	<%@ include file="/common/menu.jspf"%>
	<div id="wrapper">
		<!-- content-->
		<div id="content">
			<h1>회원님의 아이디는</h1>

			<!-- 아이디 -->
			<div>
				<span class="box int_signid"> <input type="text" id="id"
					name="id" class="int" value="${id }" maxlength="12">
				</span>
			</div>
			<h1>입니다</h1>
              
                <div class="btn_area" style="margin: 20px 0 0 0">
                  <button type="button" id="signinbtn" style="margin: 0" onclick='location.href="/savanna/member/signIn.jsp"'>
                      <span>로그인</span>
                  </button>
                </div>

		</div>
	</div>
	<%@ include file="/common/foot.jspf" %>
</body>
</html>