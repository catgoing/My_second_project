<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: savanna : 장바구니 ::</title>
<script>
	function order_go(frm){
		frm.action = "controller?type=orderGo";
		frm.method = "post";
		frm.submit();
	}
	function clear_cart(frm){
		frm.action = "controller?type=clearCart";
		frm.method = "post";
		frm.submit();
	}
</script>
<style>
</style>
</head>
<body>
	<h1>장바구니 화면(임시)</h1>
	<div class="cartMainView">
	<table border>
		<thead>
			<tr>
				<td colspan="4">장바구니</td>
			</tr>
			<tr>
				<th>번호</th>
				<th>상품명</th>
				<th>가격</th>
				<th>수량</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${not empty cartlist }">
		<c:forEach var = "cvo" items="${cartlist }">
			<tr>
				<td>${cvo.book_no  }</td>
				<td>${cvo.book_name  }</td>
				<td><fmt:formatNumber value="${cvo.cart_price  }" pattern="###,###"/>원</td>
				<td>
					<form action="controller?type=editQuan" method="post">
					<input type="number" name="quant" size="3" min="1" max="10"
							value="${cvo.cart_quan }">
					<input type="submit" value="수정">
					<input type="hidden" name="book_no" value="${cvo.book_no }">
				</form>
				</td>
				<td>
				<form action="controller?type=deleteInCart" method="post">
					<input type="submit" value="삭제">
					<input type="hidden" name="book_no" value="${cvo.book_no }">
				</form>	
				</td>
			</tr>
		</c:forEach>
		</c:if>
		
		<c:if test="${empty cartlist }">
			<tr>
				<td colspan="5">장바구니가 비어있습니다.</td>
			</tr>
		</c:if>
		
			<tr>
				<td colspan="4">배송비 : ${cvo.shippingCharge } 원<br>
								총 가격 : ${cvo.totalPrice } 원
				</td>
				<td>
				<form>
					<input type="button" value="구 입" onclick="order_go(this.form)"><br>
					<input type="button" value="비우기" onclick="clear_cart(this.form)">
					<input type="hidden" name="book_no" value="${cvo.book_no }">
				</form>
				</td>		
			</tr>
		</tbody>
		</table>
		<input type="button" value="index" onclick="javascript:location.href='main.jsp'">
	</div>
	<%@include file="footer.jspf" %>
</body>
</html>