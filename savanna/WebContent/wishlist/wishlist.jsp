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
	
	.pagination {
	display: inline-block;
	}
	
	.pagination a {
	display: block;
	padding: 3px 7px;
	border: 1px solid #292929;
	font-weight: bold;
	color: black;
	float: left;
	text-decoration: none;
	transition: background-color .3s;
	margin: 0 4px;
	
	}

	.pagination a.now {
		border: 1px solid #ff4aa5;
		padding: 3px 7px;
		background-color: #292929;
		color: silver;
	}

	.pagination .disable {
		border: 1px solid silver;
		padding: 3px 7px;
		color: silver;
	}

	.pagination a:hover {
	background-color: #292929;
		color: white;
	}
	
	/*

	.paging { 
		margin-left : 250px;
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
		border: 1px solid #292929;
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
		background-color: #292929;
		color: silver;
	}
	.paging li a:hover {
		background-color: #292929;
		color: white;
	}

	
	*/

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

	<div class="wish">
	<form>
	<table class="table">
		<thead>

				<th class="title" colspan="3">상품정보</th>
				<th class="title">판매정보</th>
				<th class="title">선택</th>			
			</tr>
		</thead>
			<c:if test="${not empty list }">
			<c:forEach var="vo" items="${list }">
				<tr class="list">
              <td rowspan="2" width="25%">표지이미지</td>

			        <td colspan="2" width="45%"><a href="/savanna/controller?type=EnterDetail&book_no=${vo.book_no }">${vo.book_name }</a></td>
			        <td rowspan="2" width="20%"><fmt:formatNumber value="${vo.price }" pattern="###,###"/>원</td>
			        <td><input type="button" class="btn" value="장바구니" onclick="input_cart(this.form)">
			        	<input type="hidden" name="book_no" value="${vo.book_no }"></td>        
			    </tr>
			    <tr>
			        <td width="20%" style="border-top:none">${vo.writer }</td>
			        <td style="border-top:none">${vo.publisher }</td>
			        <td style="border-top:none"><input type="submit" class="btn" value="삭제" onclick="delete_wish(this.form)">
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
		<tr>
		<td colspan="6">
		<%@ include file="../common/pageNavigation2.jsp" %>
		</td>
		</tr>
			
		</tfoot>
	</table>
	</form>
	</div>

</body>
</html>
