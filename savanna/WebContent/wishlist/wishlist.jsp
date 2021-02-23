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
<link href="/savanna/css/sidebar.css" rel="stylesheet">
<link href="/savanna/css/paging.css" rel="stylesheet">
<title>:: 찜목록 ::</title>
</head>
<style>
	ul, ol{
	list-style: none;
	}

	.center {
	text-align: center;
	}
	.wish {
        width: 800px;
        margin: auto;
    }
    h1{
		margin-right: 100px;
		text-align: center;
		font-weight: bold;
	}	
    table {
        max-width: 700px;
        margin:auto;
    }
    .title {
    	text-align: center;
    }
    .btn {
    	border: 1px solid #ff4aa5;
		padding: 3px 7px;
    }
    .btn:hover {
		background-color: #292929;
		color: white;
	}
	


/*부트스트랩css의 table td의 border-top속성을 일부td에서 무효화하고 width="%"를 주기위해 inline으로 style을 적용함*/


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
	<%@ include file="/common/memberSidebar.jspf" %>
	<br>
	<h1>위시리스트</h1>
	<div class="wish">
	<table class="table">
		<thead>
			<tr>
				<th class="title" colspan="3">상품정보</th>
				<th class="title">판매정보</th>
				<th class="title">선택</th>			
			</tr>
		</thead>
		<tbody>
			<c:if test="${not empty list }">
			<c:forEach var="vo" items="${list }">
				<tr class="list">
             		<td class="img-container" rowspan="2" width="25%">표지이미지</td>
			        <td colspan="2" width="45%"><a href="controller?type=EnterDetail&book_no=${vo.book_no }">${vo.book_name }</td>
			        <td rowspan="2" width="20%"><fmt:formatNumber value="${vo.price }" pattern="###,###"/>원</td>
			        <td>
			        <form>
			        	<input type="button" class="btn" value="장바구니" onclick="input_cart(this.form)">
			        	<input type="hidden" name="book_no" value="${vo.book_no }">
		        	</form>
		        	</td>
			    </tr>
			    <tr>
			        <td width="20%" style="border-top:none">${vo.writer }</td>
			        <td style="border-top:none">${vo.publisher }</td>
			        <td style="border-top:none">
			        <form>
			        	<input type="submit" class="btn" value="삭제" onclick="delete_wish(this.form)">
			        	<input type="hidden" name="book_no" value="${vo.book_no }">
		        	</form>
		        	</td>        
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
		<tr>
			<td colspan="5">
			<%@ include file="../common/pageNavigation3.jsp" %>
			</td>
		</tr>
		</tfoot>
	</table>
	</form>
	</div>

</body>
</html>
