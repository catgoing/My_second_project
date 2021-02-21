<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width", initial-scale="1">
<script src="../js/bootstrap.min.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>삭제(암호확인)</title>
<link rel="stylesheet" type="text/css" href="/savanna/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/savanna.css">	
</head>
<%@ include file="/common/menu.jspf" %>
<hr>
<body>
	
	<form action="../controller?type=reviewDelete" method="post">
		리뷰 비밀번호를 입력하세요 : <input type="password" name="rev_pwd">
		<input type="hidden" id="rev_no" name="rev_no" value="${rvo.rev_no }">
		<input type="button" value="삭제" onclick="del_go(this.form)">
	</form>
<script>
	function del_go(frm) {
		if (frm.rev_pwd.value == "${rvo.rev_pwd}") { //암호 일치
			var isDelete = confirm("정말 삭제할까요?");
			if (isDelete) {
				frm.submit();
			} else {
				history.back();
			}
		} else {
			alert("비밀번호가 일치하지 않습니다. 확인하세요");
			frm.rev_pwd.value = "";
			frm.rev_pwd.focus();
		}
	}

</script>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="js/bootstrap.js"></script>
</body>
</html>









