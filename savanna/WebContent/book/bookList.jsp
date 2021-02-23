<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>booklist for admin</title>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/savanna/js/bootstrap.js"></script>
<link href="/savanna/css/bootstrap.min.css" rel="stylesheet">
<link href="/savanna/css/savanna.css" rel="stylesheet">
<link href="/savanna/css/member.css" rel="stylesheet">
<style>
	table, td {
		border: 1px solid black;
		border-collapse: collapse;
	}
	.img-container {
		background-color: peru;
		padding: 0px;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	.img-placeholder {
		background-color: lightgreen;
		padding: 0px;
		width: 15vh;
		height: 15vh;
		border-radius: 50%;
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
	function enterCreateBookView(frm) {
		frm.action = "controller?type=EnterCreateBook";
		frm.submit();
	}
</script>
</head>
<body>
	<%@ include file="/common/menu.jspf" %>

	<h1>booklist for admin</h1>
	<div class="container">
	<table>
	<thead>
		<tr>
			<th width="5%">인덱스</th>
			<th width="10%">썸네일</th>
			<th width="30%">서명</th>
			<th width="15%">저자</th>
			<th width="15%">출판사</th>
			<th width="10%">가격</th>
			<th width="10%">재고</th>
		<tr>
	</thead>
	<tbody>
	<c:forEach var="vo" items="${list }">
		<tr class="book">
			<td>${vo.book_no }</td>
			<td class="img-container">
				<div class="img-placeholder"></div>
			</td>
			<td>
				<a href="controller?type=EnterDetail&book_no=${vo.book_no }">
				${vo.book_name }
				</a>
			</td>
			<td>${vo.writer }</td>
			<td>${vo.publisher }</td>
			<td>${vo.price }</td>
			<td class="stock">&lt;&lt;${vo.stock }&gt;&gt;</td>
		</tr>
	</c:forEach>
	</tbody>
	<tfoot>
		<tr><td colspan="8">
			<form method="post">
				<input type="button" value="신규 등록" onclick="enterCreateBookView(this.form)">
				<input type="button" value="재고 수정(카트방식)">
				<input type="button" value="돌아가기" onclick="history.back()">
			</form>
			</td>
		</tr>
		<%@ include file="../common/pageNavigation.jsp" %>
	</tfoot>
	</table>
	</div>
</body>
</html>