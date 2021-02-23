<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>

<!-- Bootstrap core CSS -->
<link href="/savanna/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/savanna/css/savanna.css" rel="stylesheet">
<link href="/savanna/css/sidebar.css" rel="stylesheet">

<title>:: 장바구니 ::</title>
</head>
<script>
	function order_go(frm){
		var len = $('.quant').length
        
		var values = [];
        values.push($('.quant').val());
        
		for(var i = 0; i < len; i++){
			if(values[i] == 0){
				alert("품절/절판 상품은 구매하실 수 없습니다");
				return false;
			}
			if(values[i]!=0){
                frm.action = "/savanna/controller?type=orderPayment";
                frm.method = "post";
                frm.submit();  
            }
		}
	}
	
	/* function check_delete(){ //선택된 상품 삭제
		$(function(){
			$(".cbclass").click(function(){
				var checkValues = "";
				$(".cbclass:checked").each(function(){
					checkValues += $(this).val();
				});
			});
		});
	} */ 
	
	function clear_cart(frm){
		frm.action = "/savanna/controller?type=clearCart";
		frm.method = "post";
		frm.submit();
	}
	
</script>

<body>
	<%@ include file="/common/menu.jspf" %>
	<%@ include file="/common/memberSidebar.jspf" %>
	
	<h1>장바구니</h1>
	<div class="cartMainView">
	<table border>
		<thead>
			<!-- <tr>
				<td>
					<form>
					<input type="button" value="선택삭제" onclick="check_delete()">
					</form>
				</td>
				<td colspan="4">장바구니</td>
			</tr> -->
			<tr>
				<!-- <th>✔</th> -->
				<th>상품명</th>
				<th>가격</th>
				<th>수량</th>
				<th>선택</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${not empty cartlist }">
		<c:forEach var = "cvo" items="${cartlist }">
			<tr>
				<!-- <td>
					<input type="checkbox" name="check" class="cbclass" value="{$cvo.book_no}">
				</td> -->
				<td>${cvo.book_name  }</td>
				<td><fmt:formatNumber value="${cvo.cart_price  }" pattern="###,###"/>원</td>
				<td>
				<c:if test="${cvo.cart_quan > 0 }">
				<form action="/savanna/controller?type=editQuan" method="post">
					<input type="number" name="quant" class="quant" size="3" min="1" max="10"
							value="${cvo.cart_quan }">
					<input type="submit" value="수정">
					<input type="hidden" name="book_no" value="${cvo.book_no }">
				</form>
				</c:if>
				<c:if test="${cvo.cart_quan == 0 }">
					<input type="number" name="quant" class="quant" size="3" value="0" disabled>품절/절판
				</c:if>
				</td>
				<td>
				<form action="/savanna/controller?type=deleteInCart" method="post">
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
				<td colspan="3">상품가격 : <fmt:formatNumber value="${cvo.allitemsPrice }" pattern="###,###"/> 원 /
								배송비 : <fmt:formatNumber value="${cvo.shippingCharge }" pattern="###,###"/> 원<br>
								총 결제가격 : <fmt:formatNumber value="${cvo.totalPrice }" pattern="###,###"/> 원
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
	</div>
</body>
</html>