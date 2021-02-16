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
</style>
<script>
function createBook(frm) {
	frm.action = "controller?type=createbook";
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
	<fieldset>
		<legend>enroll book</legend>
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
				<td><input type="text" id="book_name" name="book_name"></td>
			</tr>
			<tr>
				<td><label for="writer">작가</label></td>
				<td><input type="text" id="writer" name="writer"></td>
			</tr>
			<tr>
				<td><label for="publisher">출판사</label></td>
				<td><input type="text" id="publisher" name="publisher"></td>
			</tr>
			<tr>
				<td><label for="pub_date">출판일</label></td>
				<td><input type="date" id="pub_date" name="pub_date"></td>
			</tr>
			<tr>
				<td><label for="price">가격</label></td>
				<td><input type="number" id="price" name="price"></td>
			</tr>
			<tr>
				<td><label for="book_desc">책소개</label></td>
				<td><input type="text" id="book_desc" name="book_desc"></td>
			</tr>
			<tr>
				<td><label for="stock">재고</label></td>
				<td><input type="range" id="stock" name="stock"></td>
			</tr>
			<tr>
				<td><label for="category">분류</label></td>
				<td><input type="text" id="category" name="category"></td>
			</tr>
			</tbody>
			<tfoot>
				<tr><td colspan="2">
					<input type="submit" value="등록" onclick="createBook(this.form)">
					<input type="submit" value="더미등록" onclick="createDummyBook(this.form)">
					<input type="button" value="돌아가기" onclick="history.back()">
				</td></tr>
			</tfoot>
			</table>
		</form>
	</fieldset>
</body>
</html>