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
<link href="/savanna/css/paging.css" rel="stylesheet">
<link href="/savanna/css/sidebar.css" rel="stylesheet">
<title>회원목록</title>
<style>

	ul, ol{
	list-style: none;
	margin-left: 10px;
	}
	
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
function isAdmin(){
	if('${user.id}' != 'a'){
		alert("권한이 없습니다");
		location.href = "/savanna/controller?type=MainPage";
	}
}
</script>
</head>
<body onload="isAdmin();">
	<%@ include file="/common/menu.jspf" %>
	<%@ include file="/common/adminSidebar.jspf" %>
	<br>
<h1>회원목록</h1>
<br>
<c:set var="isAdmin" value="${user.id }"/>
<c:if test="${'a' eq isAdmin }"> <!-- 관리자 아이디일 때만 아래 내용 출력 -->

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
	        <form action="/savanna/controller?type=memsearch" method="post">
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
   			<td colspan="8" style="border:none;">
   				<%@ include file="../common/pageNavigation2.jsp" %>
  			</td>
   			</tr>
		</tfoot>
	</table>

</c:if>
	

</body>
</html>