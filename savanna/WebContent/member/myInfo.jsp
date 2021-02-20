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
<title>내정보</title>

</head>
<script>
	var sel_accept = '${user.sel_accept }';
	$(function (){
		if( sel_accept == 'on'){
			$("input[type=checkbox]").prop("checked",true);
		}
	});

	
	function withdrawal(){
		location.href = "member/withdrawal.jsp"
	}
	
	function main(){
		location.href = "/savanna/main.jsp"
	}

</script>
<body>
	<%@ include file="/common/menu.jspf" %>
	<h1>내정보</h1>
	
	<form action="/savanna/controller?type=update" method="post" id="fr_info">
	<table id="info_t">
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" id="name" value=${user.name }></td>
		</tr>
		<tr>
			<th>패스워드</th>
			<td><input type="text" name="pwd" id="pwd" value=${user.pwd }></td>
		</tr>
		<tr>
			<th>연락처</th>
			<td><input type="text" name="phone" id="phone" value=${user.phone }></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="addr" id="addr" value=${user.addr }></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email" id="email" value=${user.email }></td>
		</tr>
		<tr>
			<th>가입일</th>
			<td><input type="text" name="regdate" id="regdate" readonly value=${user.regdate } ></td>
		</tr>
		<tr>
			<th>선택약관 동의</th>
			<td><input type="checkbox" name=sel_accept id="sel_accept"></td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="수정">
				<input type="hidden" name="id" value=${user.id }>
				<input type="hidden" name="regdate" value=${user.regdate }>
				<input type="hidden" name="mem_no" value=${user.mem_no }>
			</td>
			<td><input type="button" value="탈퇴" onclick="withdrawal()"></td>
			
		</tr>		
		<tr>
			<td colspan="2"><input type="button" value="메인으로" onclick="main()"></td>
		</tr>		
	</table>
	</form>
	

</body>
</html>