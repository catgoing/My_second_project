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
	 function adminLogin(frm) {
		frm.action = "controller?type=PagedAdminLogin";
		frm.submit();
	}
    function temp_bookinsert(frm) {
		frm.action = "controller?type=tempBookInsert";
		frm.submit();
	}
    function cartList_search(frm) {
		frm.action = "controller?type=cartList";
		frm.submit();
	}
</script>
</head>
<body>
	<h1>작업선택</h1>
	<form method="post">
		<input type="button" value="카드 리스트" onclick="getcardlist(this.form)">
		<input type="button" value="관리자 로그인" onclick="adminLogin(this.form)">
        <input type="button" value="책 리스트" onclick="temp_bookinsert(this.form)">
		<input type="button" value="장바구니" onclick="cartList_search(this.form)">
	</form>
</body>
</html>