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
<script type="text/javascript" src="/savanna/js/bootstrap.js"></script>

<!-- Bootstrap core CSS -->
<link href="/savanna/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/savanna/css/savanna.css" rel="stylesheet">
<link href="/savanna/css/sidebar.css" rel="stylesheet">
<link href="/savanna/css/paging.css" rel="stylesheet">
<style>
	.buy {
        width: 900px;
        margin: auto;
    }
    table {
        max-width: 700px;
        margin:auto;
    }
    .title {
    	text-align: center;
    }
    
    h1{
	margin-right: 100px;
	text-align: center;
	font-weight: bold;
	}	
	
	
	tbody > tr:hover{
	background-color: #00B3DC;
	color: white;
	cursor: pointer;
	}
</style>
<script>
function isAdmin(){
	if('${user.id}' != 'a'){
		alert("권한이 없습니다");
		location.href = "/savanna/controller?type=MainPage";
	}
}

</script>

<title>주문관리</title>
</head>
<body onload="isAdmin();">
	<%@ include file="/common/menu.jspf" %>
	<%@ include file="/common/adminSidebar.jspf" %>
	<br>
	<h1>주문관리</h1>
	<br><br><br>

<c:set var="isAdmin" value="${user.id }"/>
<c:if test="${'a' eq isAdmin }"> <!-- 관리자 아이디일 때만 아래 내용 출력 -->
		
	<div class="buy">
	<table class="table" style="margin-left:30px">
		<thead>
			<tr>
				<th class="title">주문번호</th>
				<th class="title">상태</th>			
				<th class="title">아이디</th>
				<th class="title">상품명</th>			
				<th class="title">수량</th>			
				<th class="title">결제금액</th>			
				<th class="title">구매일</th>	
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${orderlist }">
			
				<tr class="list" onclick="location.href = '/savanna/controller?type=orderdetail&buylist_no=${vo.buylist_no}'">
	              	<td style="text-align:center;">${vo.buylist_no}</td>
	              	<td style="text-align:center;">${vo.status}</td>
	              	<td style="text-align:center;">${vo.id}</td>
	              	<td width="20%" style="text-align:center;">${vo.book_name}</td>
	              	<td style="text-align:center;">${vo.quan}</td>
	              	<td style="text-align:center;"><fmt:formatNumber value="${vo.price }" pattern="###,###"/>원</td>
	              	<td style="text-align:center;">${vo.pur_date}</td>
			    </tr>
			    
			</c:forEach>
		</tbody>
		<tfoot>
	      	<tr>
	        <td colspan="7" align="center">
	        <form action="/savanna/controller?type=adminordersearch" method="post">
	        <select name="idx">
	          <option value="0">아이디</option>
	          <option value="1">상품명</option>
	          <option value="2">상태</option>
	        </select>
	        <input type="text" name="keyword">
	        <input type="submit" value="검색">
	        </form>
	      </td>
	      </tr>
			<tr>
			<td colspan="7">
				<%@ include file="../common/pageNavigation2.jsp" %>
			</td>
			</tr>
		</tfoot>
		</table>
	</div>
</c:if>
	<hr>
	<%@ include file="/common/foot.jspf" %>	
</body>
</html>