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
<link href="/savanna/css/member.css" rel="stylesheet">
<link href="/savanna/css/sidebar.css" rel="stylesheet">
<link href="/savanna/css/paging.css" rel="stylesheet">
<title>나의 리뷰</title>
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

	
table{
	postion: relative;
	margin : auto;
	width: 600px;
 	line-height: 1em;
}

h1{
	margin: auto;
	text-align: center;
	font-weight: bold;
}

footer {
   width:100%;
   position:absolute;
   bottom:0;
}
</style>
</head>
<body>
	<%@ include file="/common/menu.jspf" %>
	<%@ include file="/common/memberSidebar.jspf" %>
	
	<br>

<h1>나의 리뷰</h1>
<br>
	<table style="table-layout:fixed">
		<thead>
			<tr class="title">
				<th class="pwd" style="width : 70%; ">내용</th>
				<th class="name">작성일</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${not empty revlist }">
			<c:forEach var="revvo" items="${revlist }">
			
				<tr class="list" onclick="location.href = '/savanna/board/view.jsp?rev_no=${revvo.rev_no }'">
					<td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${revvo.rev_content }</td>
					<td style="width: 30%;">${revvo.rev_date }</td>
				</tr>
	
		</c:forEach>
		</c:if>
		
		<c:if test="${empty revlist }">
			<tr>
				<td colspan="2">작성된 리뷰가 없습니다.</td>
			</tr>
		</c:if>		
		
		</tbody>
		<tfoot>
			 
   			<tr>
   			<td colspan="2" style="border: none;">
   				<%@ include file="../common/pageNavigation2.jsp" %>
			</td>
   			</tr>
		 	
		</tfoot>
	</table>
	
	<%@ include file="/common/foot.jspf" %>
</body>
</html>