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
<script type="text/javascript" src="/savanna/js/bootstrap.js"></script>

<!-- Bootstrap core CSS -->
<link href="/savanna/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/savanna/css/savanna.css" rel="stylesheet">
<title>회원목록</title>
<style>
	tr > td{
	text-align : center;
	height : 50px;
 	border: 1px solid lightgray;
	}
	tr > th{
	height : 40px;
	text-align : center;
	}

	tbody > tr:hover{
	background-color: #00B3DC;
	color: white;
	cursor: pointer;
	}
	
	
	.paging { 
	margin-left : 300px;
	list-style: none; 
	
	}
	.paging li {
		float: left;
		margin-right: 20px;
	}
	.paging li a {
		text-decoration: none;
		display: block;
		padding: 3px 7px;
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
		border: 1px solid #00B3DC;
		padding: 3px 7px;
		background-color: #00B3DC;
		color: white;
	}
	.paging li a:hover {
		background-color: #00B3DC;
		color: white;
	}
	
	table{
	margin : auto;
	width: 1000px;
  line-height: 1em;
	}
	
	h1{
	margin: auto;
  	text-align: center;
    font-weight: bold;
	}

	
</style>
<script>
	
</script>
</head>
<body>
	<%@ include file="/common/menu.jspf" %>
	<br>
<h1>회원목록</h1>
<br>
	<table>
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
			
				<tr class="list" onclick="location.href = '/savanna/controller?type=memDetail&id=${vo.id }'">
					<td style="width: 70px; text-align: center;">${vo.mem_no }</td>
					<td style="width: 80px;">${vo.id }</td>
					<td style="width: 80px;">${vo.pwd }</td>
					<td style="width: 80px;">${vo.name}</td>
					<td style="width: 150px;">${vo.phone }</td>
					<td style="width: 300px;">${vo.addr }</td>
					<td style="width: 150px;">${vo.email }</td>
					<td>${vo.regdate }</td>
				</tr>
	
		</c:forEach>
		</tbody>
		<tfoot>
	      <tr >
	        <td colspan="8">
	        <form action="/savanna/controller?type=example" method="post">
	        <select name="idx">
	          <option value="0">아이디</option>
	          <option value="1">이름</option>
	          <option value="2">연락처</option>
	          <option value="3">이메일</option>
	        </select>
	        <input type="text" name="keyword">
	        <input type="submit" value="검색">
	        </form>
	      </td>
	      </tr>
   			<tr>
   				<%@ include file="pagingNavigationExample.jsp" %> <!-- 경로는 네비게이션 파일 위치에 따라 다름 -->
   				<!-- 네비게이션에서 cPage와 idx, keyword를 controller에 넘김 -->
   			</tr>
		</tfoot>
	</table>

</body>
</html>