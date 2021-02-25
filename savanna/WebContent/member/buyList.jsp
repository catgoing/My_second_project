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
<title>구매내역</title>
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
	cursor: pointer;
	}
	
      
    img {
  	max-width: 100%;
	}
</style>

</head>
<body>
	<%@ include file="/common/menu.jspf" %>
	<%@ include file="/common/memberSidebar.jspf" %>
	<br>
	<h1>구매내역</h1>
	<br><br><br>
		
	<div class="buy">
	<table class="table" style="margin-left:50px">
		<thead>
			<tr>
				<th class="title" colspan="3">상품정보</th>
				<th class="title">권수</th>
				<th class="title">결제금액</th>			
				<th class="title">결제일</th>			
				<th class="title">상태</th>			
			</tr>
		</thead>
		<tbody>
			<c:if test="${not empty buylist }">
			<c:forEach var="vo" items="${buylist }">
				<tr class="list" onclick="location.href = '/savanna/controller?type=EnterDetail&book_no=${vo.book_no }'">
              		<td rowspan="2" width="10%">
						<img src="images/${vo.book_no}.jpg" alt="제품이미지">
						</td>
			        <td colspan="2" width="50%">${vo.book_name }</td>
			        <td width="10%" style="text-align:center;">${vo.quan }</td>
			        <td rowspan="2" width="10%" style="text-align:center;"><fmt:formatNumber value="${vo.price }" pattern="###,###"/>원</td>
			        <td rowspan="2" width="10%" style="text-align:center;">${vo.pur_date }</td>
			        <td rowspan="2" width="10%" style="text-align:center;">${vo.status_print }</td>
			              
			    </tr>
			    <tr onclick="location.href = '/savanna/controller?type=EnterDetail&book_no=${vo.book_no }'">
			        <td colspan="3" style="border-top:none">${vo.addr }</td>
		    	</tr>
			</c:forEach>
			</c:if>
			<c:if test="${empty buylist }">
				<tr>
					<td colspan="7" style="text-align:center;">구매내역이 없습니다.</td>
				</tr>
			</c:if>
		</tbody>
		<tfoot>
			<tr>
			<td colspan="7">
				<%@ include file="../common/pageNavigation2.jsp" %>
			</td>
			</tr>
		</tfoot>
		</table>
	</div>
	<%@ include file="/common/foot.jspf" %>
</body>
</html>