<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function all_search(frm) {
		frm.action="list";
		frm.submit();
	}
</script>
</head>
<body>
<form method="GET">
	<input type="button" value="전체보기" onclick="all_search(this.form)">
	<input type="button" value="부서코드검색" onclick="dept_search(this.form)" >
	<input type="button" value="성명검색(성-이름)">
	<input type="button" value="동적검색">
</form>
</body>
</html>