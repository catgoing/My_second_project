<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업선택</title>
<script>
	function booklist_search(frm) {
		frm.action = "controller?type=booklist";
		frm.submit();
	}
	/* function search_go(frm) {
		frm.action = "controller?type=search";
		frm.submit();
	}
	*/
	
</script>
</head>
<body>
	<h1>작업선택</h1>
	<form method="post">
		<input type="button" value="책 리스트" onclick="booklist_search(this.form)">
	</form>
	
	
	
	
	
</body>
</html>