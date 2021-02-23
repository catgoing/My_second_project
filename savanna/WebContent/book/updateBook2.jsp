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

<meta charset="UTF-8">
<title>Update book</title>
</head>
<body>
	<%@ include file="/common/menu.jspf" %>

	<h1>상품 수정</h1>
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
			<td><input type="text" id="book_name" name="book_name" value="${vo.book_name }"></td>
		</tr>
		<tr>
			<td><label for="writer">작가</label></td>
			<td><input type="text" id="writer" name="writer" value="${vo.writer }"></td>
		</tr>
		<tr>
			<td><label for="publisher">출판사</label></td>
			<td><input type="text" id="publisher" name="publisher" value="${vo.publisher }"></td>
		</tr>
		<tr>
			<td><label for="pub_date">출판일</label></td>
			<td><input type="month" id="pub_date" name="pub_date" value="${vo.pub_date }"></td>
		</tr>
		<tr>
			<td><label for="price">가격</label></td>
			<td><input type="number" id="price" name="price" value="${vo.price }"></td>
		</tr>
		<tr>
			<td><label for="book_desc">책소개</label></td>
			<td><input type="text" id="book_desc" name="book_desc" value="${vo.book_desc }"></td>
		</tr>
		<tr>
			<td><label for="stock">재고</label></td>
			<td><input type="range" id="stock" name="stock" value="${vo.stock }"></td>
		</tr>
		<tr>
			<td><label for="category">분류</label></td>
			<td><input type="text" id="category" name="category" value="${vo.category }"></td>
		</tr>
		</tbody>
		<tfoot>
			<tr><td colspan="2">
				<input type="hidden" id="book_no" name="book_no" value="${vo.book_no }">
				<input type="submit" value="등록" onclick="updateBook(this.form)">
				<input type="button" value="돌아가기" onclick="history.back()">
			</td></tr>
		</tfoot>
		</table>
	</form>
</body>
</html>