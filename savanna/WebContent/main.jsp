<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
<script>

 	function signIn(frm){
 		frm.action = "controller?type=signIn";
 		frm.submit();
 	}
 	
 	function signUp(frm) {
 		frm.action = "controller?type=signUp";
 		frm.submit();
 	}

</script>
</head>
<body>
	<h1>메인화면</h1>
	<p id="user_name"></p>
	<form method="post">
		<input type="button" value="로그인" onclick="signIn(this.form)">
		<input type="button" value="회원가입" onclick="signUp(this.form)">
	</form>

</body>
</html>