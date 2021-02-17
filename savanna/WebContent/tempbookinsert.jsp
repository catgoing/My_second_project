<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function cart_insert(frm){
		frm.action="controller?type=cartInsert";
		frm.method="post";
		frm.submit();
	}
</script>
</head>
<body>
	<h1>booklist.jsp</h1>
	<table border>
	<thead>
		<tr>
			<th>책번호</th>
			<th>제목</th>
			<th>저자</th>
			<th>가격</th>
			<th>출판일</th>
			<th>출판사</th>
			<th>재고</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${not empty list }">
			<c:forEach var="vo" items="${list }">
			<c:if test="${vo.stock > 0  }">
			<tr>
				<td>${vo.book_no }</td>
				<td>${vo.book_name  }</td>
				<td>${vo.writer }</td>
				<td>${vo.price  }</td>
				<td>${vo.pub_date  }</td>
				<td>${vo.publisher  }</td>
				<td>${vo.stock  }</td>
				<td>
				<form>
					<input type="button" value="장바구니" onclick="cart_insert(this.form)">
					<input type="hidden" name="book_no" value="${vo.book_no }">
				</form>
				</td>
			</tr>
			</c:if>	
			</c:forEach>
		</c:if>
		<c:if test="${empty list }">
			<tr>
				<td colspan="7">등록된 제품이 없습니다.</td>
			</tr>
		</c:if>
	</tbody>
	</table>
	<input type="button" value="index" onclick="javascript:location.href='main.jsp'">
</body>
</html>