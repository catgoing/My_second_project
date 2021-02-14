<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 결과</title>
</head>
<body>
	<h1>로그인 결과</h1>
	<table>
	<thead>
		<tr>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>이름</th>
		<th>휴대전화</th>
		<th>주소</th>
		<th>회원번호</th>
		<th>가입일</th>
		</tr>
	</thead>
	<tbody>
		<tr>
		<td>${vo.id }</td>
		<td>${vo.pwd }</td>
		<td>${vo.name }</td>
		<td>${vo.phone }</td>
		<td>${vo.addr }</td>
		<td>${vo.mem_no }</td>
		<td>${vo.regdate }</td>
		</tr>
	</tbody>
	</table>
	
</body>
</html>