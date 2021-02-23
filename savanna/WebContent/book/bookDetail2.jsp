<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/savanna/js/bootstrap.js"></script>
<link href="/savanna/css/bootstrap.min.css" rel="stylesheet">
<link href="/savanna/css/savanna.css" rel="stylesheet">
<link href="/savanna/css/member.css" rel="stylesheet">

<script>
function deleteBook(frm) {
	frm.action = "controller?type=DeleteBook";
	frm.submit();
}
function enterUpdateBook(frm) {
	frm.action = "controller?type=EnterUpdateBook";
	frm.submit();
}
</script>
<meta charset="UTF-8">
<title>Universal Book Detail</title>
</head>
<body>
	<%@ include file="/common/menu.jspf" %>

	<fieldset>
		<legend>Book Detail</legend>
		<form method="post">
			<table>
			<thead>
			<tr>
				<th>항목</th>
				<th>작성란</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td><label for="book_name">제목</label></td>
				<td>${vo.book_name}</td>
			</tr>
			<tr>
				<td><label for="writer">작가</label></td>
				<td>${vo.writer}</td>
			</tr>
			<tr>
				<td><label for="publisher">출판사</label></td>
				<td>${vo.publisher}</td>
			</tr>
			<tr>
				<td><label for="pub_date">출판일</label></td>
				<td>${vo.pub_date}</td>
			</tr>
			<tr>
				<td><label for="price">가격</label></td>
				<td>${vo.price }</td>
			</tr>
			<tr>
				<td><label for="book_desc">책소개</label></td>
				<td>${vo.book_desc}</td>
			</tr>
			<tr>
				<td><label for="stock">재고</label></td>
				<td>${vo.stock}</td>
			</tr>
			<tr>
				<td><label for="category">분류</label></td>
				<td>${vo.category }</td>
			</tr>
			</tbody>
			<tfoot>
				<tr><td colspan="2">
					<input type="hidden" id="book_no" name="book_no" value="${vo.book_no }">
					<input type="button" value="수정모드" onclick="enterUpdateBook(this.form)">
					<input type="button" value="삭제" onclick="deleteBook(this.form)">
					<input type="button" value="돌아가기" onclick="history.back()">
				</td></tr>
				<tr><td colspan="2">
					<input type="hidden" id="book_no" name="book_no" value="${vo.book_no }">
					<input type="button" value="구매하기" onclick="#">
					<input type="button" value="장바구니에 넣기" onclick="#">
					<input type="button" value="좋아요" onclick="#">
					<input type="button" value="돌아가기" onclick="history.back()">
				</td></tr>
			</tfoot>
			</table>
		</form>
	</fieldset>
</body>
</html>