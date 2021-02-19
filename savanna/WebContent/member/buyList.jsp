<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>구매내역</title>

</head>
<body>
	<%@ include file="/common/menu.jspf" %>
	<h1>구매내역</h1>
	<table>
		<thead>
			<tr class="title">
				<th class="book_name">책이름</th>
				<th class="quan">수량</th>
				<th class="price">가격</th>
				<th class="pur_date">주문일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${list }">
				<a href="main.jsp"></a>
				<tr class="list" onclick="location.href = '/savanna/controller?type=memDetail?id=${vo.id }'">
					<td>${vo.mem_no }</td>
					<td>${vo.id }</td>
					<td>${vo.pwd }</td>
					<td>${vo.name}</td>
					<td>${vo.phone }</td>
					<td>${vo.addr }</td>
					<td>${vo.email }</td>
					<td>${vo.regdate }</td>
				</tr>
				
		</c:forEach>
		</tbody>
		<tfoot>
		 	<tr>
		 	<td colspan="7">
		 		<ol class="paging">
		 				<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
				<c:if test="${pageNo == pvo.nowPage }">
					<li class="now">${pageNo }</li>
				</c:if>
				<c:if test="${pageNo != pvo.nowPage }">
					<li>
						<a href="/savanna/controller?type=memList?cPage=${pageNo }">${pageNo }</a>
					</li>
				</c:if>		
			</c:forEach>
		 	</ol>
		 	</td>
		 	</tr>
   
		</tfoot>
	</table>
	
</body>
</html>