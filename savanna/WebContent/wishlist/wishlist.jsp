<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
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

<title>:: 찜목록 ::</title>
</head>
<style>
	.paging { list-style: none; }
	.paging li {
		float: left;
		margin-right: 8px;
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
		border: 1px solid #ff4aa5;
		padding: 3px 7px;
		background-color: #ff4aa5;
	}
	.paging li a:hover {
		background-color: #00B3DC;
		color: white;
	}
	
</style>
<script>
	function input_cart(frm){
		frm.action = "/savanna/controller?type=wishitemToCart";
		frm.method = "post";
		frm.submit();
	}
	function delete_wish(frm){
		frm.action = "/savanna/controller?type=deleteWishList";
		frm.method = "post";
		frm.submit();
	}
</script>
<body>
	<%@ include file="/common/menu.jspf" %>
	<form>
	<table class="table">
		<thead>
			<tr class="title">
				<th class="booktitle" colspan="2">상품정보</th>
				<th class="price">판매정보</th>
				<th class="delete">선택</th>			
			</tr>
		</thead>
			<c:if test="${not empty list }">
			<c:forEach var="vo" items="${list }">
				<tr class="list">
			        <td colspan="2"><a href="상세페이지">${vo.book_name }</td>
			        <td rowspan="2"><fmt:formatNumber value="${vo.price }" pattern="###,###"/>원</td>
			        <td><input type="button" value="장바구니" onclick="input_cart(this.form)">
			        	<input type="hidden" name="book_no" value="${vo.book_no }"></td>        
			    </tr>
			    <tr>
			        <td>${vo.writer }</td>
			        <td>${vo.publisher }</td>
			        <td><input type="submit" value="삭제" onclick="delete_wish(this.form)">
			        	<input type="hidden" name="book_no" value="${vo.book_no }"></td>        
		    	</tr>
			</c:forEach>
			</c:if>
			<c:if test="${empty list }">
				<tr>
					<td colspan="5">찜목록이 비어있습니다.</td>
				</tr>
			</c:if>
		</tbody>
		<tfoot>
			<%@ include file="../common/pageNavigation.jsp" %>
		</tfoot>
	</table>
	</form>
	
</body>
</html>