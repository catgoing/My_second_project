<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제(암호확인)</title>
</head>
<body>
	
	<form action="controller?type=delete" method="post">
		리뷰 비밀번호를 입력하세요 : <input type="password" name="pwd">
		<input type="button" value="삭제" onclick="del_go(this.form)">
	</form>
<script>
	function del_go(frm) {
		if (frm.pwd.value == "${rvo.rev_pwd}") { //암호 일치
			var isDelete = confirm("정말 삭제할까요?");
			if (isDelete) {
				frm.submit();
			} else {
				history.back();
			}
		} else {
			alert("비밀번호가 일치하지 않습니다. 확인하세요");
			frm.pwd.value = "";
			frm.pwd.focus();
		}
	}
</script>
</body>
</html>









