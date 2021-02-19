<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>

<!-- Bootstrap core CSS -->
<link href="/savanna/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/savanna/css/savanna.css" rel="stylesheet">
<title>회원목록</title>
<style>
	.paging { list-style: none; }
	.paging li {
		float: left;
		margin-right: 8px;
	}
	.paging li a {
		text-decoration: none;
		display: block;
		padding: 13px 7px;
		border: 1px solid #00B3DC;
		font-weight: bold;
		color: black;
	}
	.paging .disable {
		border: 1px solid silver;
		padding: 3px 7px;
		color: silver;
	}
	.paging .now {
		border: 1px solid #ff4aa5;
		padding: 3px 7px;
		background-color: #ff4aa5;
	}
	.paging li a:hover {
		background-color: #00B3DC;
		color: white;
	}
</style>
<script>

	
</script>
</head>
<body>
	<%@ include file="/common/menu.jspf" %>
<h1>회원목록</h1>
	<table>
		<caption>회원 전체 목록</caption>
		<thead>
			<tr class="title">
				<th class="no">회원번호</th>
				<th class="id">아이디</th>
				<th class="pwd">패스워드</th>
				<th class="name">이름</th>
				<th class="phone">휴대전화</th>
				<th class="addr">주소</th>
				<th class="email">이메일</th>
				<th class="regdate">가입일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${list }">
				<a href="main.jsp"></a>
				<tr class="list" onclick="location.href = '/savanna/controller?type=memDetail?id=${vo.id }'">
					<td >${vo.mem_no }</td>
					<td>${vo.id }</td>
					<td>${vo.pwd }</td>
					<td>${vo.name}</td>
					<td>${vo.phone }</td>
					<td>${vo.addr }</td>
					<td>${vo.email }</td>
					<td>${vo.regdate }</td>
				</tr>
				
		</c:forEach>
		</tbody>
		<tfoot>
   			<tr>
   				<%@ include file="../common/pageNavigation.jsp" %>
   			</tr>
		</tfoot>
	</table>

</body>
</html>