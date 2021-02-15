<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>booklist for admin</title>
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
</style>
<script>
	function goEntryBookView(frm) {
		frm.action = "controller?type=goentrybook";
		frm.submit();
	}
</script>
</head>
<body>
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
				<a href="controller?type=showdetail&book_no=${vo.book_no }">
				${vo.book_name }
				</a>
			</td>
			<td>${vo.writer }</td>
			<td>${vo.publisher }</td>
			<td>${vo.price }</td>
			<td>&lt;&lt;${vo.stock }&gt;&gt;</td>
		</tr>
	</c:forEach>
	</tbody>
	<tfoot>
		<tr><td colspan="8">
			<form method="post">
				<input type="text" value="test">
				<input type="button" value="신규 등록" onclick="goEntryBookView(this.form)">
				<input type="button" value="재고 수정(카트방식)">
				<input type="button" value="돌아가기" onclick="history.back()">
			</form>
		</td>
		</tr>
	</tfoot>
	</table>
	</div>
</body>
</html>