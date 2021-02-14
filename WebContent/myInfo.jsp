<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보</title>
</head>
<script>

	function update(frm){
		frm.action = "controller?type=update";
		frm.submit();
	}
	
	function withdrawal(frm){
		frm.action = "controller?type=withdrawal";
		frm.submit();
	}

</script>
<body>
	<h1>내정보</h1>
	
	<form id="fr_info">
	<table id="info_t">
		<tr>
			<th>이름</th>
			<td><input type="text" id="username" value=${user.name }></td>
		</tr>
		<tr>
			<th>패스워드</th>
			<td><input type="text" id="username" value=${user.pwd }></td>
		</tr>
		<tr>
			<th>연락처</th>
			<td><input type="text" id="username" value=${user.phone }></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" id="username" value=${user.addr }></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" id="username" value=${user.email }></td>
		</tr>
		<tr>
			<td><input type="button" value="수정" onclick="update(this.form)"></td>
			<td><input type="button" value="탈퇴" onclick="withdrawal(this.form)"></td>
		</tr>		
	</table>
	</form>
</body>
</html>