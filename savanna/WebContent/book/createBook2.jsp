<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/savanna/js/bootstrap.js"></script>
<link href="/savanna/css/bootstrap.min.css" rel="stylesheet">
<link href="/savanna/css/savanna.css" rel="stylesheet">
<link href="/savanna/css/member.css" rel="stylesheet">
<link href="/savanna/css/book.css" rel="stylesheet">

<script>
function createBook(frm) {
	frm.action = "controller?type=CreateBook";
	frm.submit();
}
function createDummyBook(frm) {
	var bookInputs = document.getElementsByTagName("input");
	bookInputs["book_name"].value="dummy";
	bookInputs["writer"].value="dummy";
	bookInputs["publisher"].value="dummy";
	bookInputs["pub_date"].value= "1999-09-09";
	bookInputs["price"].value="999";
	bookInputs["book_desc"].value="dummy";
	bookInputs["stock"].value="1";
	bookInputs["category"].value="dummy";
	createBook(frm);
}
</script>
<meta charset="UTF-8">
<title>enroll book</title>
</head>
<body>
	<%@ include file="/common/menu.jspf" %>

	<h1>상품 등록</h1>
	<form method="post">
		<table id="content">
		<thead>
		<tr>
			<th>항목</th>
			<th>작성란</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td><label for="book_name">제목</label></td>
			<td><input class="box" type="text" id="book_name" name="book_name"></td>
		</tr>
		<tr>
			<td><label for="writer">작가</label></td>
			<td><input class="box" type="text" id="writer" name="writer"></td>
		</tr>
		<tr>
			<td><label for="publisher">출판사</label></td>
			<td><input class="box" type="text" id="publisher" name="publisher"></td>
		</tr>
		<tr>
			<td><label for="pub_date">출판일</label></td>
			<td><input class="box" type="date" id="pub_date" name="pub_date"></td>
		</tr>
		<tr>
			<td><label for="price">가격</label></td>
			<td><input class="box" type="number" id="price" name="price"></td>
		</tr>
		<tr>
			<td><label for="book_desc">책소개</label></td>
			<td><input class="box" type="text" id="book_desc" name="book_desc"></td>
		</tr>
		<tr>
			<td><label for="stock">재고</label></td>
			<td><input type="range" id="stock" name="stock"></td>
		</tr>
		<tr>
			<td><label for="category">분류</label></td>
			<td><input class="box" type="text" id="category" name="category"></td>
		</tr>
		</tbody>
		<tfoot>
			<div class="btn_area">
			<tr><td colspan="2">
				<input type="submit" value="등록" onclick="createBook(this.form)">
				<input type="submit" value="더미등록" onclick="createDummyBook(this.form)">
				<input type="button" value="돌아가기" onclick="history.back()">
			</td></tr>
			</div>
		</tfoot>
		</table>
	</form>
</body>
</html>