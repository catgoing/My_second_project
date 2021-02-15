<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>작업선택</title>
<script>
	function getcardlist(frm) {
		frm.action = "controller?type=cardlist";
		frm.submit();
	}
	 function admin_login(frm) {
		frm.action = "controller?type=adminlogin";
		frm.submit();
	}
</script>
</head>
<body>
	<h1>작업선택</h1>
	<form method="post">
		<input type="button" value="카드 리스트" onclick="getcardlist(this.form)">
		<input type="button" value="관리자 로그인" onclick="admin_login(this.form)">
	</form>
</body>
</html>