<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
<script>

 	function myInfo(frm){
 		frm.action = "/savanna/controller?type=pwdCheck";
 		frm.submit();
 	}
 	
 	function myHistory(frm) {
 		frm.action = "/savanna/controller?type=myHistory";
 		frm.submit();
 	}
 	
 	function logout(frm) {
 		frm.action = "/savanna/controller?type=logout";
 		frm.submit();
 	}

</script>
</head>
<body>
	<h1>메인화면</h1>
	<p id="user_name"> ${vo.name }님 환영합니다</p>
	<form method="post">
		<input type="button" value="내정보" onclick="myInfo(this.form)">
		<input type="button" value="내역확인" onclick="myHistory(this.form)">
		<input type="button" value="로그아웃" onclick="logout(this.form)">
	</form>

</body>
</html>